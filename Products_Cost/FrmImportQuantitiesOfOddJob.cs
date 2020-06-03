using Excel;
using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;
using Tools;
namespace Products_Cost
{
    public partial class FrmImportQuantitiesOfOddJob : Form
    {
        String defaultDir = System.Windows.Forms.Application.StartupPath;
        //选定文档所在目录下的所有xls,xlsx文档的全路径。
        List<string> xlsFilePathList = null;
        //选定的Excel全路径
        String xlsFilePath = null;
        BackgroundWorker readDataToDB_bgWorker = new BackgroundWorker();
        MyExcel myExcel = null;
        int count = 0;
        int maxmium = 1;
        //(100 * count / maxmium);
        Worksheet _firstSheet = null;
        Usual_Excel_Helper uEHelper = null;
        MSG msg = new MSG();
        int validMaxColIndex = 33;      //默认读取到第33列
        int validMaxRowIndex = 133;      //默认读取到第133行
        public FrmImportQuantitiesOfOddJob()
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
            defaultDir += "\\模板\\";
            xlsFilePath = FileNameDialog.getSelectedFilePathWithDefaultDir("请选择零活产量表：", "Excel 2003 (*.xls)|*.xls|Excel 2007+ (*.xlsx)|*.xlsx", defaultDir);
            string dir = DirectoryHelper.getDirOfFile(xlsFilePath);
            if (string.IsNullOrEmpty(dir))
            {
                btnImportExcelToDB.Enabled = true;
                return;
            }
            //获取该目录下的所有xls,xlsx文档的全路径；
            xlsFilePathList = DirectoryHelper.getXlsFileUnderThePrescribedDir(dir);
            MessageBox.Show("准备导入", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
        /// 所有UI的操作，不再这里处理！！！
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void readDataToDB_bgWorker_DoWork_Handler(object sender, DoWorkEventArgs e)
        {
            this.myExcel = new MyExcel(xlsFilePath);
            myExcel.open(false);
            readDataToDB_bgWorker.ReportProgress(0, new MSG("准备读取数据...", true));     
            //开始读取Excel中的内容。
            //1. 产量记录从第三行，第六列开始。
            //2. 产量记录到第几列结束了？
            this._firstSheet = myExcel.getFirstWorkSheetAfterOpen();
            this.uEHelper = new Usual_Excel_Helper(_firstSheet);
            //班组	姓名	地点	事由	时间	件数	金额	日期	备注：必填项目

            //1.检查姓名是否为空？
            //2.检查事由是否为空？
            //3.检查金额是否为空？
            if (!(msg = checkNameIsNullOfTheExcel()).Flag) {
                readDataToDB_bgWorker.ReportProgress(0, msg);
                myExcel.close();
            }
            if (!(msg = checkParticularsIsNullOfTheExcel()).Flag)
            {
                readDataToDB_bgWorker.ReportProgress(0, msg);
                myExcel.close();
            }
            if (!(msg = checkAmountOfMoneyIsNullOfTheExcel()).Flag)
            {
                readDataToDB_bgWorker.ReportProgress(0, msg);
                myExcel.close();
            }
            //4.检查是否存在 某日 某员工  某事由  某金额的数据，防止重复导入。
            List<OddJob> oddJobList = new List<OddJob>();
            //自第二行开始。
            // 班组 姓名 地点  事由 工时  件数 金额  日期 备注：必填项目
            for (int currIndex = 2; currIndex<uEHelper.getMaxRowIndex();currIndex++) {
                OddJob oddJob = new OddJob();
                oddJob.Team_name = uEHelper.getCellContentByRowAndColIndex(currIndex, 1);
                oddJob.Emp_name = uEHelper.getCellContentByRowAndColIndex(currIndex, 2);
                oddJob.Place = uEHelper.getCellContentByRowAndColIndex(currIndex, 3);
                oddJob.Particulars = uEHelper.getCellContentByRowAndColIndex(currIndex, 4);
                oddJob.Labor_hours = uEHelper.getCellContentByRowAndColIndex(currIndex, 5);
                oddJob.Quantities = uEHelper.getCellContentByRowAndColIndex(currIndex, 6);
                oddJob.Amount_of_money = uEHelper.getCellContentByRowAndColIndex(currIndex, 7);
                oddJob.Year_month_day_str = uEHelper.getCellContentByRowAndColIndex(currIndex, 8);
                oddJobList.Add(oddJob);
            }
            for (int i = 0; i < oddJobList.Count; i++) {
                oddJobList[i].insert_odd_job(); 
            }
            myExcel.close();
            readDataToDB_bgWorker.ReportProgress(100, msg = new MSG("导入完成!", true));
        }
        private MSG checkAmountOfMoneyIsNullOfTheExcel()
        {
            //班组	姓名	地点	事由	时间	件数	金额	日期	备注：必填项目
            //姓名从 第(2,2)列开始
            for (int currRowIndex = 2; currRowIndex <= uEHelper.getMaxRowIndex(); currRowIndex++) {
                string contentOfName = uEHelper.getCellContentByRowAndColIndex(currRowIndex, 2);
                if (string.IsNullOrEmpty(contentOfName)) {
                    msg.Flag = false;
                    msg.Msg = string.Format(@"第{0}行,第2列, 姓名不能为空", currRowIndex);
                    return msg;
                }
            }
            msg.Flag = true;
            return msg;
        }
        private MSG checkParticularsIsNullOfTheExcel()
        {
            //班组	姓名	地点	事由	时间	件数	金额	日期	备注：必填项目
            //姓名从 第(2,4)列开始
            for (int currRowIndex = 2; currRowIndex <= uEHelper.getMaxRowIndex(); currRowIndex++)
            {
                string contentOfPariticular = uEHelper.getCellContentByRowAndColIndex(currRowIndex, 4);
                if (string.IsNullOrEmpty(contentOfPariticular))
                {
                    msg.Flag = false;
                    msg.Msg = string.Format(@"第{0}行,第4列, 事由不能为空", currRowIndex);
                    return msg;
                }
            }
            msg.Flag = true;
            return msg;
        }
        private MSG checkNameIsNullOfTheExcel()
        {
            //班组	姓名	地点	事由	时间	件数	金额	日期	备注：必填项目
            //姓名从 第(2,4)列开始
            for (int currRowIndex = 2; currRowIndex <= uEHelper.getMaxRowIndex(); currRowIndex++)
            {
                string contentOfAmountOfMoney = uEHelper.getCellContentByRowAndColIndex(currRowIndex, 7);
                if (string.IsNullOrEmpty(contentOfAmountOfMoney))
                {
                    msg.Flag = false;
                    msg.Msg = string.Format(@"第{0}行,第7列,金额不能为空", currRowIndex);
                    return msg;
                }
                //判断是否为decimal类型
                decimal amountOfMoney;
                bool flag = decimal.TryParse(contentOfAmountOfMoney, out amountOfMoney);
                if (!flag) {
                    msg.Flag = false;
                    msg.Msg = string.Format(@"第{0}行,第7列,金额非数字类型", currRowIndex);
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
