using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using Microsoft.Office.Interop.Excel;
using Excel;
using System.Text.RegularExpressions;
using System.Collections;
using Products_Cost;
using System.Windows.Shapes;

namespace Tools
{
    public partial class FrmImportEachOneQuantitiesOfTheLine : Form
    {
        String defaultDir = System.Windows.Forms.Application.StartupPath ;
        //选定文档所在目录下的所有xls,xlsx文档的全路径。
        List<string> xlsFilePathList = null;
        //选定的Excel全路径
        String xlsFilePath = null;      
        BackgroundWorker readDataToDB_bgWorker = new BackgroundWorker();
        MyExcel myExcel = null;
        int percentProgress = 0;
        Worksheet _firstSheet = null;
        Usual_Excel_Helper uEHelper = null;
        MSG msg = new MSG();
        int validMaxColIndex = 33;      //默认读取到第33列
        int validMaxRowIndex = 133;      //默认读取到第133行
        public FrmImportEachOneQuantitiesOfTheLine()
        {
            InitializeComponent();
            readDataToDB_bgWorker.DoWork += readDataToDB_bgWorker_DoWork_Handler;
            readDataToDB_bgWorker.ProgressChanged += readDataToDB_bgWorker_ProcessChanged_Handler;
            readDataToDB_bgWorker.RunWorkerCompleted += readDataToDB_bgWorker_RunWorkerCompleted_Handler;
            readDataToDB_bgWorker.WorkerReportsProgress = true;
        }
        /// <summary>
        /// 导入成衣成本。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnImportProductsCost_Click(object sender, EventArgs e)
        {
            this.btnImportExcelToDB.Enabled = false;
            lblResult.Text = "";
            lblResult.BackColor = this.BackColor;
            lblResult.Visible = true;
            this.pb.Visible = true;
            this.pb.Value = 0;
            //判断是否存在Excel进程.
            if (CmdHelper.ifExistsTheProcessByName("EXCEL") || CmdHelper.ifExistsTheProcessByName("et"))
            {
                Tools.FrmPrompt frmPrompt = new Tools.FrmPrompt("excel.exe|et.exe");
                frmPrompt.ShowDialog();
            }
            dgv.DataSource = null;
            tbPath.Clear();
            xlsFilePath = FileNameDialog.getSelectedFilePathWithDefaultDir("请选择小组产量表：", "*.xls|*.xlsx", defaultDir);
            string dir = DirectoryHelper.getDirOfFile(xlsFilePath);
            if (string.IsNullOrEmpty(dir))
            {
                btnImportExcelToDB.Enabled = true;
                return;
            }
            //获取该目录下的所有xls,xlsx文档的全路径；
            xlsFilePathList= DirectoryHelper.getXlsFileUnderThePrescribedDir(dir);
            MessageBox.Show("准备导入","提示：",MessageBoxButtons.OK,MessageBoxIcon.Information);
            tbPath.Text = xlsFilePath;
            //开启异步线程
            readDataToDB_bgWorker.RunWorkerAsync();
        }
        /// <summary>
        /// 完成之后触发 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void readDataToDB_bgWorker_RunWorkerCompleted_Handler(object sender, RunWorkerCompletedEventArgs e)
        {
            this.pb.Visible = false;
            this.pb.Value = 0;
            btnImportExcelToDB.Enabled = true;
            ShowResult.show(lblResult, msg.Msg, msg.Flag);
            timerRestoreLblResult.Start();
        }
        /// <summary>
        /// 更新UI
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void readDataToDB_bgWorker_ProcessChanged_Handler(object sender, ProgressChangedEventArgs e)
        {
            int percentProgress = e.ProgressPercentage;
            //先显示进度。
            pb.Value = percentProgress;
            //消息为空退出
            if (e.UserState == null) return;
            MSG msg = (MSG)e.UserState;
            ShowResult.show(lblResult, msg.Msg, msg.Flag);
        }
        /// <summary>
        /// 后台处理
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void readDataToDB_bgWorker_DoWork_Handler(object sender, DoWorkEventArgs e)
        {
            this.myExcel= new MyExcel(xlsFilePath);
            myExcel.open(false);
            this.percentProgress= 0;
            //开始读取Excel中的内容。
            //1. 产量记录从第三行，第六列开始。
            //2. 产量记录到第几列结束了？
             this._firstSheet= myExcel.getFirstWorkSheetAfterOpen();
             this.uEHelper= new Usual_Excel_Helper(_firstSheet);
            //获取最大列
            this.validMaxColIndex= uEHelper.getColIndexOfSpecificContentInSpecificRow(2,1,uEHelper.getMaxColIndex(),"终止标识")-1;
            //获取最大行从第三行起为序号行,当第1列，第一次出现为空的行时，即最大行。
            this.validMaxRowIndex = uEHelper.getMaxRowIndexBeforeBlankCell(1);
            string pn, year_and_month_str, lineName, teamName;
            //判断是否已经存在该线体的月报表
            string contentOfA1 = uEHelper.getCellContentByRowAndColIndex(1, 1);
            //1.判断产品名_组_月份格式是否正确。
            bool flag = StringHelper.checkPN_Team_Month(contentOfA1, out pn, out year_and_month_str, out lineName, out teamName);
            if (!flag)
            {
                msg.Flag = false;
                msg.Msg = "报表中A1单元格内容格式应为：产品名_衬衣1组_3月";
                this.readDataToDB_bgWorker.ReportProgress(0, msg);
                myExcel.close();
                return;
            }
            //2.判断该组,在某月，某线体，所作的某产品 在数据库中是否已经有记录？
            System.Data.DataTable dt = Line_Each_One_Quantities.getAllQuantitiesOfTheLine_month_team_report(pn, year_and_month_str, lineName, teamName);
            if (dt.Rows.Count > 0) {
                msg.Flag = false;
                msg.Msg = string.Format(@"{0}: 线体(地点):{1},组名：{2},月份: {3}  已经存在！",pn,lineName,teamName,year_and_month_str);
                this.readDataToDB_bgWorker.ReportProgress(0, msg);
                myExcel.close();
                return;
            }
            //3.先检查工序列有没有工序为空的
            msg = checkValidityOfAllProcesses();
            if (!msg.Flag) {
                this.readDataToDB_bgWorker.ReportProgress(0, msg);
                myExcel.close();
                return;
            }
            //4.检查金额列有无空或者为0.00的数值
            msg = checkValidityOfAmountOfMoneyOfAllProcesses();
            if (!msg.Flag)
            {
                this.readDataToDB_bgWorker.ReportProgress(0, msg);
                myExcel.close();
                return;
            }
            List<NameAndRealTeam> nameAndRealTeamList = null;
            //5. 检查所有的姓名是否符合格式
            msg = checkValidityOfAllNameOfLine_Yields_Report(out nameAndRealTeamList);
            if (!msg.Flag) {
                this.readDataToDB_bgWorker.ReportProgress(0, msg);
                myExcel.close();
                return;
            }
            List<Line_Each_One_Quantities> line_each_one_quantities_list = new List<Line_Each_One_Quantities>();
            int maxmium = (validMaxRowIndex - 3 + 1) * (validMaxColIndex - 6 + 1);
            int count = 0;
            msg.Flag = true;
            msg.Msg = "准备读取数据...";
            readDataToDB_bgWorker.ReportProgress(0, msg);
            //自第(3,6)开始
            for (int currColIndex = 6; currColIndex <= validMaxColIndex; currColIndex++) {
                for (int currRowIndex = 3; currRowIndex <= validMaxRowIndex; currRowIndex++) {
                    count++;
                    string contentStr = uEHelper.getCellContentByRowAndColIndex(currRowIndex,currColIndex);
                    //为空，定位到下一个单元格。
                    if (string.IsNullOrEmpty(contentStr)) {
                        readDataToDB_bgWorker.ReportProgress((count * 100 / maxmium) );
                        continue;
                    }
                    //判断是否为数字
                    int quantities = 0;
                    flag = int.TryParse(contentStr, out quantities);
                    //若不为数字
                    if (!flag) {
                        msg.Flag = false;
                        msg.Msg = string.Format(@"第{0}行，第{1}列,应为整数!",currRowIndex,currColIndex);
                        readDataToDB_bgWorker.ReportProgress((count / maxmium) * 100, msg);
                        myExcel.close();
                        return;
                    }
                    //判断是否为整数
                    Line_Each_One_Quantities each_One_Quantities = new Line_Each_One_Quantities();
                    each_One_Quantities.Line_Name = lineName;
                    each_One_Quantities.Team_name = teamName;
                    each_One_Quantities.Products_name = pn;
                    each_One_Quantities.Year_and_month_str = year_and_month_str;
                    each_One_Quantities.Quantities = quantities;
                    //第二列为部位
                    each_One_Quantities.Summary_process = uEHelper.getCellContentByRowAndColIndex(currRowIndex, 2);
                    //第三列为工序
                    each_One_Quantities.Specific_process = uEHelper.getCellContentByRowAndColIndex(currRowIndex, 3);
                    each_One_Quantities.Man_hour = int.Parse( uEHelper.getCellContentByRowAndColIndex(currRowIndex, 4));
                    each_One_Quantities.Amount_of_money = decimal.Parse(uEHelper.getCellContentByRowAndColIndex(currRowIndex, 5));
                    //记录姓名,姓名,自第6列开始。
                    string realTeamName = nameAndRealTeamList[currColIndex - 6].Real_team_name;
                    if (!string.IsNullOrEmpty(realTeamName))
                    {
                        each_One_Quantities.Real_team_name = realTeamName;
                    }
                    else {
                        each_One_Quantities.Real_team_name = teamName;
                    }
                    each_One_Quantities.Emp_name = nameAndRealTeamList[currColIndex - 6].Emp_name;
                    line_each_one_quantities_list.Add(each_One_Quantities);
                    readDataToDB_bgWorker.ReportProgress((count *100 / maxmium));
                }
            }
            msg.Flag = true;
            msg.Msg = "提交数据中...";
            readDataToDB_bgWorker.ReportProgress(0, msg);
            count = 0;
            //开始提交数据.
            maxmium = line_each_one_quantities_list.Count;
            for (int i = 0; i < maxmium; i++) {
                count++;
                readDataToDB_bgWorker.ReportProgress((count * 100 / maxmium));
                line_each_one_quantities_list[i].save();
            }
            msg.Msg = "提交完成。";
            readDataToDB_bgWorker.ReportProgress((count * 100 / maxmium),msg);
            myExcel.close();
        }
        private MSG checkValidityOfAllNameOfLine_Yields_Report(out List<NameAndRealTeam> nameAndTeamList)
        {
            MSG msg = new MSG();
            List<NameAndRealTeam> theNameAndTeamList = new List<NameAndRealTeam>();
            //姓名从(2,6)开始
            for (int currColIndex = 6; currColIndex <= validMaxColIndex; currColIndex++) {
                string nameStr = uEHelper.getCellContentByRowAndColIndex(2, currColIndex);
                string realTeamName, empName;
                bool flag = StringHelper.checkNameOfLine_Yields_Report(nameStr, out realTeamName, out empName);
                if (!flag) {
                    msg.Msg = string.Format(@"第2行，{0}列，姓名格式不一致!",currColIndex);
                    nameAndTeamList = null;
                    return msg;
                }
                NameAndRealTeam nameAndOtherTeam = new NameAndRealTeam();
                nameAndOtherTeam.Real_team_name = realTeamName;
                nameAndOtherTeam.Emp_name = empName;
                theNameAndTeamList.Add(nameAndOtherTeam);
            }
            nameAndTeamList = theNameAndTeamList;
            msg.Flag = true;
            return msg;
        }

        /// <summary>
        /// 检查金额列是否有为0，或为空的单元格 (3,5) --> (validMaxRowIndex,5)
        /// </summary>
        /// <returns></returns>
        private MSG checkValidityOfAmountOfMoneyOfAllProcesses()
        {
            MSG msg = new MSG();
            for (int currRowIndex = 3; currRowIndex <=validMaxRowIndex; currRowIndex++)
            {
                string content = uEHelper.getCellContentByRowAndColIndex(currRowIndex, 5);
                if (String.IsNullOrEmpty(content))
                {
                    msg.Flag = false;
                    msg.Msg = string.Format(@"第{0}行,第5列,金额不应为空，请检查!", currRowIndex);
                    return msg;
                }
                //判断是否为数字
                double resultOfAmountOfMoney;
                bool flag = double.TryParse(content, out resultOfAmountOfMoney);
                if (!flag) {
                    msg.Flag = false;
                    msg.Msg = string.Format(@"第{0}行,第5列, 不为数字，请检查!", currRowIndex);
                    return msg;
                }
                //为数字，判断是否为0
                if (0.Equals(resultOfAmountOfMoney)) {
                    msg.Flag = false;
                    msg.Msg = string.Format(@"第{0}行,第5列, 金额不应为0，请检查!", currRowIndex);
                    return msg;
                }
            }
            msg.Flag = true;
            return msg;
        }

        /// <summary>
        /// (工序从(3,3) -->(validMaxRowIndex,3)
        /// </summary>
        /// <returns></returns>
        private MSG checkValidityOfAllProcesses()
        {
            MSG msg = new MSG();
            for (int currRowIndex = 3; currRowIndex <= validMaxRowIndex; currRowIndex++)
            {
                string content = uEHelper.getCellContentByRowAndColIndex(currRowIndex, 3);
                if (String.IsNullOrEmpty(content)) {
                    msg.Flag = false;
                    msg.Msg = string.Format(@"第{0}行,第3列,工序不应为空，请检查!",currRowIndex);
                    return msg;
                }
            }
            msg.Flag = true;
            return msg;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void timerRestoreLblResult_Tick(object sender, EventArgs e)
        {
            timerRestoreLblResult.Stop();
            lblResult.Text = "";
            lblResult.BackColor = Color.SkyBlue;
        }
    }
}
