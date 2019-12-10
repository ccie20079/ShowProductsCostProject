using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Tools;
using System.IO;
using Excel;
using Oracle.DataAccess.Client;
using System.Data.OleDb;
using Products_Cost.Interface;
using Products_Cost.ImplClass;
using Microsoft.Office.Interop.Excel;
using Products_Cost.Helper;
namespace Products_Cost
{
    public partial class FrmImportProductsCost : Form
    {
        string defaultDir = System.Windows.Forms.Application.StartupPath + "\\待导入成本数据\\";
        private delegate void DelegateImportProductsCost();
        public FrmImportProductsCost()
        {
            InitializeComponent();
        }
        /// <summary>
        /// 导入成衣成本。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnImportProductsCost_Click(object sender, EventArgs e)
        {
            DelegateImportProductsCost importProductsCost = new DelegateImportProductsCost(import_P_C_Record_Of_First_Sheet);
            //导入
            importProductsCost();
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
        /// <summary>
        /// 导入成本记录。
        /// </summary>
        private void importProductsCostRecord() {
            string xlsFilePath = FileNameDialog.getSelectedFilePathWithDefaultDir("请选择考勤记录：", "*.xls|*.xls", defaultDir);
            if (string.IsNullOrEmpty(xlsFilePath))
            {
                return;
            }
            if (!File.Exists(xlsFilePath)) return;
            tbPath.Text = xlsFilePath;
            MyExcel myExcel = new MyExcel(xlsFilePath);
            myExcel.open();
            Tools.AppManagement.add(myExcel.HwndOfApp);
            Worksheet wS = myExcel.getFirstWorkSheetAfterOpen();
            Usual_Excel_Helper uEHelper = new Usual_Excel_Helper(wS);
            string PN = uEHelper.getSpecificCellValue("A1");
            if ("请在此填写成品名称".Equals(PN))
            {
                MessageBox.Show("请填写成品名称！", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            string sqlStr = string.Format(@"SELECT 1 FROM Products_Cost_Header WHERE Product_Name = '{0}'",PN);
            System.Data.DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            if (dt.Rows.Count>0) {
                sqlStr = string.Format(@"DELETE FROM Products_Cost_Header WHERE Product_Name = '{0}'", PN);
                OracleDaoHelper.executeSQL(sqlStr);
            }
            //判断是否存在该成品的记录
            sqlStr = string.Format(@"SELECT 1 FROM Products_Cost WHERE Product_Name = '{0}'",PN);
            dt = OracleDaoHelper.getDTBySql(sqlStr);
            if (dt.Rows.Count > 0) {
                //删除文档
                sqlStr = string.Format(@"DELETE FROM Products_Cost where Product_Name = '{0}'",PN);
                OracleDaoHelper.executeSQL(sqlStr);
            }
            //先导入概要工序。
            int rowStartIndex = 3;
            int rowMaxIndex = wS.UsedRange.Rows.Count;
            string summary_process = string.Empty;
            string specific_process = string.Empty;
            //summary_process不允许空开。
            //先检查第1至4列.
            pb.Visible = true;
            lblResult.Visible = false;
            pb.Maximum = 4 * (rowMaxIndex - rowStartIndex + 1);
            pb.Value = 0;
            for (int rowIndex = rowStartIndex;rowIndex< rowMaxIndex;rowIndex++) {
                string seq_p_c_record = uEHelper.getSpecificCellValue("A" + rowIndex);
                string man_hour = uEHelper.getSpecificCellValue("C" + rowIndex);
                string temp = uEHelper.getSpecificCellValue("B" + rowIndex);
                if (string.IsNullOrEmpty(seq_p_c_record)) break;
                if (string.IsNullOrEmpty(temp)) {
                    //左边到头。
                    break;
                }
                if (string.IsNullOrEmpty(man_hour) || "0".Equals(man_hour)) {
                    //为该要工序.
                    //开始保存
                    //则process为概要工序
                    summary_process = uEHelper.getSpecificCellValue("B" + rowIndex);
                    pb.Value++;
                    continue;
                }
                //具体工序时先保存概要工序。
                sqlStr = string.Format(@"insert into Products_Cost_Header(SEQ,Product_Name,Summary_Process)
                                                values('{0}','{1}','{2}')", seq_p_c_record, PN, summary_process);
                OracleDaoHelper.executeSQL(sqlStr);
                pb.Value++;
            }
            //再检查第6至第9列  F,G,H,I
            for (int rowIndex = rowStartIndex; rowIndex < rowMaxIndex; rowIndex++) {
                string seq_p_c_record = uEHelper.getSpecificCellValue("F" + rowIndex);
                string man_hour = uEHelper.getSpecificCellValue("H" + rowIndex);
                string temp = uEHelper.getSpecificCellValue("G" + rowIndex);
                if (string.IsNullOrEmpty(seq_p_c_record)) break;
                if (string.IsNullOrEmpty(temp))
                {
                    //右边到头
                    break;
                }
                if (string.IsNullOrEmpty(man_hour) || "0".Equals(man_hour))
                {
                    //为该要工序.
                    //开始保存
                    //则process为概要工序
                    summary_process = uEHelper.getSpecificCellValue("G" + rowIndex);
                    pb.Value++;
                    continue;
                }
                //具体工序时先保存概要工序。
                sqlStr = string.Format(@"insert into Products_Cost_Header(SEQ,Product_Name,Summary_Process)
                                                values('{0}','{1}','{2}')", seq_p_c_record, PN, summary_process);
                OracleDaoHelper.executeSQL(sqlStr);
                pb.Value++;
            }
            #region 开始保存 第1至第4列的数据。
            for (int rowIndex = rowStartIndex; rowIndex < rowMaxIndex; rowIndex++)
            {
                string seq_p_c_record = uEHelper.getSpecificCellValue("A" + rowIndex);
                string temp = uEHelper.getSpecificCellValue("B" + rowIndex);
                string man_hours = uEHelper.getSpecificCellValue("C" + rowIndex);
                string labour_cost = uEHelper.getSpecificCellValue("D" + rowIndex);
                if (string.IsNullOrEmpty(seq_p_c_record)) break;
                if (string.IsNullOrEmpty(temp))
                {
                    //右边到头
                    break;
                }
                if (!string.IsNullOrEmpty(man_hours) && !"0".Equals(man_hours))
                {
                    //为该要工序.
                    //开始保存
                    //则temp为具体工序。
                    specific_process = temp;
                    sqlStr = string.Format(@"INSERT INTO PRODUCTS_Cost(
                                                                       SEQ,
                                                                       SEQ_P_C_Record,    
                                                                       Product_Name,
                                                                       Summary_Process,
                                                                       Specific_Process,
                                                                       Man_Hours,
                                                                       Labour_Cost,
                                                                       Supplier,
                                                                       UPDATE_Time
                                                                )
                                                                SELECT  SEQ_PRODUCTS_COST.Nextval,
                                                                        '{1}',      --- Seq_P_C_Record
                                                                        '{0}',
                                                                        Summary_Process,
                                                                        '{2}',     --- specific_process
                                                                        '{3}',     --- man_hours
                                                                        '{4}',      --- labour_cost
                                                                        '{5}',      --- supplier
                                                                        SYSDATE
                                                                FROM Products_Cost_Header
                                                                WHERE Product_Name = '{0}'
                                                                AND SEQ = '{1}'", PN,
                                                                seq_p_c_record,
                                                                specific_process,
                                                                man_hours,
                                                                labour_cost,
                                                                Program._userInfo.User_Name
                                                                );
                    OracleDaoHelper.executeSQL(sqlStr);
                    pb.Value++;
                }
            }
            #endregion
            #region 开始保存 第6至第9列的数据。
            for (int rowIndex = rowStartIndex; rowIndex < rowMaxIndex; rowIndex++)
            {
                string seq_p_c_record = uEHelper.getSpecificCellValue("F" + rowIndex);
                string temp = uEHelper.getSpecificCellValue("G" + rowIndex);
                string man_hours = uEHelper.getSpecificCellValue("H" + rowIndex);
                string labour_cost = uEHelper.getSpecificCellValue("I" + rowIndex);
                if (string.IsNullOrEmpty(seq_p_c_record)) break;
                if (string.IsNullOrEmpty(temp))
                {
                    //右边到头
                    break;
                }
                if (!string.IsNullOrEmpty(man_hours) && !"0".Equals(man_hours))
                {
                    //为该要工序.
                    //开始保存
                    //则temp为具体工序。
                    specific_process = temp;
                    sqlStr = string.Format(@"INSERT INTO PRODUCTS_Cost(
                                                                       SEQ,
                                                                        SEQ_P_C_Record,
                                                                       Product_Name,
                                                                       Summary_Process,
                                                                       Specific_Process,
                                                                       Man_Hours,
                                                                       Labour_Cost,
                                                                       Supplier,
                                                                       UPDATE_Time
                                                                )
                                                                SELECT  SEQ_PRODUCTS_COST.Nextval,
                                                                        '{1}',      ---  SEQ_P_C_Record
                                                                        '{0}',
                                                                        Summary_Process,
                                                                        '{2}',     --- specific_process
                                                                        '{3}',     --- man_hours
                                                                        '{4}',      --- labour_cost
                                                                        '{5}',      --- supplier
                                                                        SYSDATE
                                                                FROM Products_Cost_Header
                                                                WHERE Product_Name = '{0}'
                                                                AND SEQ = '{1}'", PN,
                                                                seq_p_c_record,
                                                                specific_process,
                                                                man_hours,
                                                                labour_cost,
                                                                Program._userInfo.User_Name);
                    OracleDaoHelper.executeSQL(sqlStr);
                    pb.Value++;
                }
            }
            #endregion
            myExcel.close();
            IShowProductsCostDetail showProductsCostDetailImpl = new ShowProductsCostDetailImpl();
            this.dgv.DataSource = showProductsCostDetailImpl.getProductsDetail(PN);
            DGVHelper.AutoSizeForDGV(dgv);
            pb.Visible = false;
            lblResult.Visible = true;
        }
        /// <summary>
        /// 导入
        /// </summary>
        public void import_P_C_Record_Of_First_Sheet()
        {
            //确认关闭已经打开的Excel
            if (CmdHelper.ifExistsTheProcessByName("EXCEL")) {
                FrmCloseExcel frmCloseExcel = new FrmCloseExcel();
                frmCloseExcel.ShowDialog();
            }
            string xlsFilePath = FileNameDialog.getSelectedFilePathWithDefaultDir("请选择成衣成本记录：", "*.xls,*.xlsx|*.xls;*.xlsx", defaultDir);
            if (string.IsNullOrEmpty(xlsFilePath))
            {
                return;
            }
            if (!File.Exists(xlsFilePath)) return;
            tbPath.Text = xlsFilePath;
            MyExcel myExcel = new MyExcel(xlsFilePath);
            myExcel.open();
            Tools.AppManagement.add(myExcel.HwndOfApp);
            Worksheet firstWS = myExcel.getFirstWorkSheetAfterOpen();
            MSG msg = null;
            //非成本文件，则忽略。
            if (!(msg = isProductsCostRecord(firstWS)).Flag)
            {
                lblPromptForPB.Visible = false;
                ShowResult.show(lblResult, msg.Msg, false);
                myExcel.close();
                return;
            }
            Usual_Excel_Helper uEHelper = new Usual_Excel_Helper(firstWS);
            string PN = uEHelper.getSpecificCellValue("A1");
            if ("请在此填写成品名称".Equals(PN))
            {
                MessageBox.Show(firstWS.Index + "." + firstWS.Name + ":  请填写成品名称！", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                myExcel.close();
                return;
            }
            if (string.IsNullOrEmpty(PN))
            {
                MessageBox.Show(firstWS.Index + "." + firstWS.Name + ": 产品名称不能为空！", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                myExcel.close();
                return;
            }
            //判断是否存在该成品的记录
            string sqlStr = string.Format(@"SELECT 1 FROM Products_Cost WHERE Product_Name = '{0}'", PN);
            System.Data.DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            if (dt.Rows.Count > 0)
            {
                //删除文档
                sqlStr = string.Format(@"DELETE FROM Products_Cost where Product_Name = '{0}'", PN);
                OracleDaoHelper.executeSQL(sqlStr);
            }
            //先导入概要工序。
            //最大行，取
            //从第二行开始，取第三列连续出现工序的最大行
            int rowMaxIndex = uEHelper.getTheMaxRowIndexUntilBlankCellOfTheSpecificCol(2,3);
            //int rowMaxIndex = firstWS.UsedRange.RofirstWS.Count;
            string seq_p_c_record = string.Empty;
            string summary_process = string.Empty;
            string specific_process = string.Empty;
            string man_hours = string.Empty;
            string labour_cost = string.Empty;
            pb.Maximum = rowMaxIndex - 2;
            pb.Value = 0;
            pb.Visible = true;
            lblResult.Visible = false;
            OracleConnection theConnForTransaction = new OracleConnection(OracleDaoHelper.conn_str);
            theConnForTransaction.Open();
            OracleTransaction tran = theConnForTransaction.BeginTransaction();
            //先删除Check_Products_Cost_Doc中的所有记录。
            CheckProductsCostDoc.deleteAllRecord();
            //检查工时数据，成本数据是否正确。
            for (int rowIndex = 3; rowIndex <= rowMaxIndex; rowIndex++)
            {
                seq_p_c_record = uEHelper.getSpecificCellValue("A" + rowIndex);
                string prepared_Summary_process = uEHelper.getSpecificCellValue("B" + rowIndex).Trim();
                specific_process = uEHelper.getSpecificCellValue("C" + rowIndex);
                man_hours = uEHelper.getSpecificCellValue("D" + rowIndex);
                labour_cost = uEHelper.getSpecificCellValue("E" + rowIndex);
                if (string.IsNullOrEmpty(seq_p_c_record))
                {
                    break;
                }
                if (string.IsNullOrEmpty(specific_process)) break; ;
                if (string.IsNullOrEmpty(man_hours)) break; ;
                if (string.IsNullOrEmpty(labour_cost)) break;
                //判断man_hours是否为decimal;
                decimal _man_hours_d;
                decimal _labour_cost_d;
                if (!decimal.TryParse(man_hours, out _man_hours_d))
                {
                    lblPromptForPB.Visible = false;
                    pb.Visible = false;
                    ShowResult.show(lblResult, string.Format(@"第{0}行第4列，非工时数据,请检查！", rowIndex), false);
                    timerRestoreLblResult.Enabled = true;
                    myExcel.close();
                    return;
                }
                if (!decimal.TryParse(labour_cost, out _labour_cost_d))
                {
                    lblPromptForPB.Visible = false;
                    pb.Visible = false;
                    ShowResult.show(lblResult, string.Format(@"第{0}行第5列，非单价数据，请检查！", rowIndex), false);
                    timerRestoreLblResult.Enabled = true;
                    myExcel.close();
                    return;
                }
                //若主工序不为空
                if (!"".Equals(prepared_Summary_process))
                {
                    summary_process = prepared_Summary_process;
                }
                CheckProductsCostDoc checkProductsCostDoc = new CheckProductsCostDoc(rowIndex, summary_process, specific_process);
                msg = checkProductsCostDoc.ifExistsSameProcess();
                if (msg.Flag)
                {
                    lblPromptForPB.Visible = false;
                    pb.Visible = false;
                    ShowResult.show(lblResult, string.Format(@"序号:{0}行与{1}，工序相同，请检查。", seq_p_c_record, msg.Msg), false);
                    timerRestoreLblResult.Enabled = true;
                    myExcel.close();
                    return;
                }
                checkProductsCostDoc.addProcess();
                lblPromptForPB.Visible = true;
                lblPromptForPB.Text = firstWS.Index + "." + firstWS.Name + " 检查中: ";
                pb.Value++;
            }
            pb.Value = 0;
            //保存工序数据到后台。
            for (int rowIndex = 3; rowIndex <= rowMaxIndex; rowIndex++)
            {
                seq_p_c_record = uEHelper.getSpecificCellValue("A" + rowIndex);
                string prepared_Summary_process = uEHelper.getSpecificCellValue("B" + rowIndex).Trim();
                specific_process = uEHelper.getSpecificCellValue("C" + rowIndex);
                man_hours = uEHelper.getSpecificCellValue("D" + rowIndex);
                labour_cost = uEHelper.getSpecificCellValue("E" + rowIndex);
                if (string.IsNullOrEmpty(seq_p_c_record))
                {
                    break;
                }
                if (string.IsNullOrEmpty(specific_process)) break; ;
                if (string.IsNullOrEmpty(man_hours)) break; ;
                if (string.IsNullOrEmpty(labour_cost)) break;
                //若主工序不为空
                if (!"".Equals(prepared_Summary_process))
                {
                    summary_process = prepared_Summary_process;
                }
                //插入该大类中的第一行数据。
                sqlStr = string.Format(@"INSERT INTO Products_Cost(SEQ,SEQ_P_C_RECORD,Product_Name,Summary_Process,Specific_Process,Man_hours,Labour_cost,Supplier)
                                        VALUES(SEQ_Products_Cost.nextVal,'{0}','{1}','{2}','{3}','{4}','{5}','{6}')",
                                                                            seq_p_c_record,
                                                                            PN,
                                                                            summary_process,
                                                                            specific_process,
                                                                            man_hours,
                                                                            labour_cost,
                                                                            Program._userInfo.User_Name);
                try
                {
                    OracleDaoHelper.executeSQLThrowExceptioin(sqlStr, theConnForTransaction);
                }
                catch (Exception ex)
                {
                    if (ex.ToString().Contains("ORA-00001"))
                    {
                        MessageBox.Show(firstWS.Index + "." + firstWS.Name + ": 第" + rowIndex + "行为重复工序,请检查成本表格，请重新导入 . ", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        tran.Rollback();
                        theConnForTransaction.Close();
                        lblPromptForPB.Visible = false;
                        pb.Visible = false;
                        myExcel.close();
                        return;
                    }
                    MessageBox.Show(firstWS.Index + "." + firstWS.Name + ": 第" + rowIndex + "行，数据导入时发生异常，请检查成本表格,重新导入。" + ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    tran.Rollback();
                    theConnForTransaction.Close();
                    lblPromptForPB.Visible = false;
                    pb.Visible = false;
                    myExcel.close();
                    return;
                }
                lblPromptForPB.Visible = true;
                lblPromptForPB.Text = firstWS.Index + "." + firstWS.Name + " 导入中: ";
                pb.Value++;
                continue;
            }
            tran.Commit();
            theConnForTransaction.Close();
            pb.Visible = false;
            lblPromptForPB.Visible = false;
            lblPromptForPB.Text = "";
            lblResult.Visible = true;
            IShowProductsCostDetail showProductsCostDetailImpl = new ShowProductsCostDetailImpl();
            this.dgv.DataSource = showProductsCostDetailImpl.getProductsDetail(PN);
            DGVHelper.AutoSizeForDGV(dgv);

            myExcel.close();
            ShowResult.show(lblResult, "已经提交！", true);
            timerRestoreLblResult.Enabled = true;
            lblPromptForPB.Visible = false;
            //默认提交 pictures下的 waiting.jpg图片。
            //保存或更新其对应的图片。
            if (!FrmProductsCostSummary.ifExistsRecordOfProducts_Picture(PN))
            {
                FrmProductsCostSummary.addPictureOfProduct(PN, System.Windows.Forms.Application.StartupPath + "\\pictures\\waiting.jpg");
            }
            else {
                FrmProductsCostSummary.updatePictureOfProduct(PN, System.Windows.Forms.Application.StartupPath + "\\pictures\\waiting.jpg");
            }
        }
        /// <summary>
        /// 导入
        /// </summary>
        public void import_P_C_Record_Template_previous() {
            string xlsFilePath = FileNameDialog.getSelectedFilePathWithDefaultDir("请选择成衣成本记录：", "*.xls,*.xlsx|*.xls;*.xlsx", defaultDir);
            if (string.IsNullOrEmpty(xlsFilePath))
            {
                return;
            }
            if (!File.Exists(xlsFilePath)) return;
            tbPath.Text = xlsFilePath;
            MyExcel myExcel = new MyExcel(xlsFilePath);
            myExcel.open();
            Tools.AppManagement.add(myExcel.HwndOfApp);
            List<Worksheet> wSList = myExcel.getVisualWS();
            int notProductsCostFile_Count = 0;
            for (int i=0;i<=wSList.Count-1;i++) {
                Worksheet wS = wSList[i];
                MSG msg = null;
                //非成本文件，则忽略。
                if (!(msg = isProductsCostRecord(wS)).Flag)
                {
                    notProductsCostFile_Count++;
                    continue;
                }
                Usual_Excel_Helper uEHelper = new Usual_Excel_Helper(wS);
                string PN = uEHelper.getSpecificCellValue("A1");
                if ("请在此填写成品名称".Equals(PN))
                {
                    MessageBox.Show(wS.Index + "." + wS.Name + ":  请填写成品名称！", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    continue;
                }
                if (string.IsNullOrEmpty(PN))
                {
                    MessageBox.Show(wS.Index + "." + wS.Name + ": 产品名称不能为空！", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    continue;
                }
                //判断是否存在该成品的记录
                string sqlStr = string.Format(@"SELECT 1 FROM Products_Cost WHERE Product_Name = '{0}'", PN);
                System.Data.DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
                if (dt.Rows.Count > 0)
                {
                    //删除文档
                    sqlStr = string.Format(@"DELETE FROM Products_Cost where Product_Name = '{0}'", PN);
                    OracleDaoHelper.executeSQL(sqlStr);
                }
                //先导入概要工序。
                int rowMaxIndex = uEHelper.getTheMaxRowIndexUntilBlankRow();
                //int rowMaxIndex = wS.UsedRange.Rows.Count;
                string seq_p_c_record = string.Empty;
                string summary_process = string.Empty;
                string specific_process = string.Empty;
                string man_hours = string.Empty;
                string labour_cost = string.Empty;
                pb.Maximum = rowMaxIndex - 2;
                pb.Value = 0;
                pb.Visible = true;
                lblResult.Visible = false;
                OracleConnection theConnForTransaction = new OracleConnection(OracleDaoHelper.conn_str);
                theConnForTransaction.Open();
                OracleTransaction tran = theConnForTransaction.BeginTransaction();
                for (int rowIndex = 3; rowIndex <= rowMaxIndex; rowIndex++)
                {
                    seq_p_c_record = uEHelper.getSpecificCellValue("A" + rowIndex);
                    string prepared_Summary_process = uEHelper.getSpecificCellValue("B" + rowIndex).Trim();
                    specific_process = uEHelper.getSpecificCellValue("C" + rowIndex);
                    man_hours = uEHelper.getSpecificCellValue("D" + rowIndex);
                    labour_cost = uEHelper.getSpecificCellValue("E" + rowIndex);
                    if (string.IsNullOrEmpty(seq_p_c_record))
                    {
                        break;
                    }
                    if (string.IsNullOrEmpty(specific_process)) break; ;
                    if (string.IsNullOrEmpty(man_hours)) break; ;
                    if (string.IsNullOrEmpty(labour_cost)) break; ;
                    //若主工序不为空
                    if (!"".Equals(prepared_Summary_process))
                    {
                        summary_process = prepared_Summary_process;
                    }
                    //插入该大类中的第一行数据。
                    sqlStr = string.Format(@"INSERT INTO Products_Cost(SEQ,SEQ_P_C_RECORD,Product_Name,Summary_Process,Specific_Process,Man_hours,Labour_cost,Supplier)
                                            VALUES(SEQ_Products_Cost.nextVal,'{0}','{1}','{2}','{3}','{4}','{5}','{6}')",
                                                                                seq_p_c_record,
                                                                                PN,
                                                                                summary_process,
                                                                                specific_process,
                                                                                man_hours,
                                                                                labour_cost,
                                                                                Program._userInfo.User_Name);
                    try
                    {
                        OracleDaoHelper.executeSQLThrowExceptioin(sqlStr, theConnForTransaction);
                    }
                    catch (Exception ex)
                    {
                        if (ex.ToString().Contains("ORA-00001"))
                        {
                            MessageBox.Show(wS.Index + "." + wS.Name + ": 第" + rowIndex + "行为重复工序,请检查成本表格，请重新导入 . ", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            tran.Rollback();
                            theConnForTransaction.Close();
                            lblPromptForPB.Visible = false;
                            pb.Visible = false;
                            myExcel.close();
                            break;
                        }
                        MessageBox.Show(wS.Index + "." + wS.Name +  ": 第" + rowIndex + "行，数据导入时发生异常，请检查成本表格,重新导入。" + ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        tran.Rollback();
                        theConnForTransaction.Close();
                        lblPromptForPB.Visible = false;
                        pb.Visible = false;
                        myExcel.close();
                        break;
                    }
                    lblPromptForPB.Visible = true;
                    lblPromptForPB.Text = wS.Index + "." + wS.Name + ": ";
                    pb.Value++;
                    continue;
                  
                }
                tran.Commit();
                theConnForTransaction.Close();
                pb.Visible = false;
                lblPromptForPB.Visible = false;
                lblPromptForPB.Text = "";
                lblResult.Visible = true;
                IShowProductsCostDetail showProductsCostDetailImpl = new ShowProductsCostDetailImpl();
                this.dgv.DataSource = showProductsCostDetailImpl.getProductsDetail(PN);
                DGVHelper.AutoSizeForDGV(dgv);
            }
            myExcel.close();
            if (notProductsCostFile_Count == wSList.Count) {
                ShowResult.show(lblResult, "   共"+wSList.Count + "个表格均非成衣成本文件！依据：第3行4列和第3行5列均非数字！", false);
                timerRestoreLblResult.Enabled = true;
                lblPromptForPB.Visible = false;
            } 
        }
        /// <summary>
        /// 导入
        /// </summary>
        public void import_P_C_Record_Template()
        {
            string xlsFilePath = FileNameDialog.getSelectedFilePathWithDefaultDir("请选择成衣成本记录：", "*.xls,*.xlsx|*.xls;*.xlsx", defaultDir);
            if (string.IsNullOrEmpty(xlsFilePath))
            {
                return;
            }
            if (!File.Exists(xlsFilePath)) return;
            tbPath.Text = xlsFilePath;
            MyExcel myExcel = new MyExcel(xlsFilePath);
            myExcel.open();
            Tools.AppManagement.add(myExcel.HwndOfApp);
            Worksheet firstWS = myExcel.getFirstWorkSheetAfterOpen();
            int notProductsCostFile_Count = 0;
            //非成本文件，则忽略。
            if (!isProductsCostRecordOfGroup1(firstWS))
            {
                notProductsCostFile_Count++;
                lblPromptForPB.Visible = false;
                ShowResult.show(lblResult, "   第1个表格非成衣成本文件！依据：第4行3列和第4行4列均非数字！", false);
                myExcel.close();
                return;
            }
            Usual_Excel_Helper uEHelper = new Usual_Excel_Helper(firstWS);
            string PN = uEHelper.getSpecificCellValue("A1");
            if ("请在此填写成品名称".Equals(PN))
            {
                MessageBox.Show(firstWS.Index + "." + firstWS.Name + ":  请填写成品名称！", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (string.IsNullOrEmpty(PN))
            {
                MessageBox.Show(firstWS.Index + "." + firstWS.Name + ": 产品名称不能为空！", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            //判断是否存在该成品的记录
            string sqlStr = string.Format(@"SELECT 1 FROM Products_Cost WHERE Product_Name = '{0}'", PN);
            System.Data.DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            if (dt.Rows.Count > 0)
            {
                //删除文档
                sqlStr = string.Format(@"DELETE FROM Products_Cost where Product_Name = '{0}'", PN);
                OracleDaoHelper.executeSQL(sqlStr);
            }
            //先导入概要工序。
            int rowMaxIndexOfGroup1 = uEHelper.getTheMaxRowIndexUntilBlankCellOfTheSpecificCol(1);
            int rowMaxIndexOfGroup2 = 0;
            //判断是否存在=
            bool ifExistsGroup2 = isProductsCostRecordOfGroup2(firstWS);
            if (ifExistsGroup2) {
                rowMaxIndexOfGroup2 = uEHelper.getTheMaxRowIndexUntilBlankCellOfTheSpecificCol(6);
            }
            //获取第3行
            //int rowMaxIndex = firstWS.UsedRange.RofirstWS.Count;
            pb.Maximum = rowMaxIndexOfGroup1-2 + rowMaxIndexOfGroup2 - 2;
            pb.Value = 0;
            pb.Visible = true;
            lblResult.Visible = false;
            OracleConnection theConnForTransaction = new OracleConnection(OracleDaoHelper.conn_str);
            theConnForTransaction.Open();
            OracleTransaction tran = theConnForTransaction.BeginTransaction();
            string prepared_Summary_process = string.Empty;
            //先读取第4列的内容。
            for (int rowIndex = 3; rowIndex <= rowMaxIndexOfGroup1; rowIndex++)
            {
                string  seq_p_c_record = uEHelper.getSpecificCellValue("A" + rowIndex);
                //序号为空跳出循环。
                if (string.IsNullOrEmpty(seq_p_c_record))
                {
                    break;
                }
                string content_B_Col = uEHelper.getSpecificCellValue("B" + rowIndex).Trim();
                //1.读取C列内容，如果为空，说明是主工序。
                string content_C_Col  = uEHelper.getSpecificCellValue("C" + rowIndex);
                if (string.IsNullOrEmpty(content_C_Col)) {
                    //执行下一次循环。
                    prepared_Summary_process = content_B_Col;
                    continue;
                }
                string specific_process = content_B_Col;
                //2. C列不为空。
                string man_hours = content_C_Col;
                string labour_cost = uEHelper.getSpecificCellValue("D" + rowIndex);

                if (string.IsNullOrEmpty(specific_process)) break; ;
                if (string.IsNullOrEmpty(man_hours)) break; ;
                if (string.IsNullOrEmpty(labour_cost)) break; ;
                //插入该大类中的第一行数据。
                sqlStr = string.Format(@"INSERT INTO Products_Cost(SEQ,SEQ_P_C_RECORD,Product_Name,Summary_Process,Specific_Process,Man_hours,Labour_cost,Supplier)
                                        VALUES(SEQ_Products_Cost.nextVal,'{0}','{1}','{2}','{3}','{4}','{5}','{6}')",
                                                                            seq_p_c_record,
                                                                            PN,
                                                                            prepared_Summary_process,
                                                                            specific_process,
                                                                            man_hours,
                                                                            labour_cost,
                                                                            Program._userInfo.User_Name);
                try
                {
                    OracleDaoHelper.executeSQLThrowExceptioin(sqlStr, theConnForTransaction);
                }
                catch (Exception ex)
                {
                    if (ex.ToString().Contains("ORA-00001"))
                    {
                        MessageBox.Show(firstWS.Index + "." + firstWS.Name + ": 第" + rowIndex + "行为重复工序,请检查成本表格，请重新导入 . ", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        tran.Rollback();
                        theConnForTransaction.Close();
                        lblPromptForPB.Visible = false;
                        pb.Visible = false;
                        myExcel.close();
                        return;
                    }
                    MessageBox.Show(firstWS.Index + "." + firstWS.Name + ": 第" + rowIndex + "行，数据导入时发生异常，请检查成本表格,重新导入。" + ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    tran.Rollback();
                    theConnForTransaction.Close();
                    lblPromptForPB.Visible = false;
                    pb.Visible = false;
                    myExcel.close();
                    return;
                }
                lblPromptForPB.Visible = true;
                lblPromptForPB.Text = firstWS.Index + "." + firstWS.Name + ": ";
                pb.Value++;
                continue;
            }
            //先读取第9列的内容。
            for (int rowIndex = 3; rowIndex <= rowMaxIndexOfGroup2; rowIndex++)
            {
                string seq_p_c_record = uEHelper.getSpecificCellValue("F" + rowIndex);
                //序号为空跳出循环。
                if (string.IsNullOrEmpty(seq_p_c_record))
                {
                    break;
                }
                string content_G_Col = uEHelper.getSpecificCellValue("G" + rowIndex).Trim();
                //1.读取C列内容，如果为空，说明是主工序。
                string content_H_Col = uEHelper.getSpecificCellValue("H" + rowIndex);
                if (string.IsNullOrEmpty(content_H_Col))
                {
                    //执行下一次循环。
                    prepared_Summary_process = content_G_Col;
                    continue;
                }
                string specific_process = content_G_Col;
                //2. C列不为空。
                string man_hours = content_H_Col;
                string labour_cost = uEHelper.getSpecificCellValue("I" + rowIndex);

                if (string.IsNullOrEmpty(specific_process)) break; ;
                if (string.IsNullOrEmpty(man_hours)) break; ;
                if (string.IsNullOrEmpty(labour_cost)) break; ;
                //插入该大类中的第一行数据。
                sqlStr = string.Format(@"INSERT INTO Products_Cost(SEQ,SEQ_P_C_RECORD,Product_Name,Summary_Process,Specific_Process,Man_hours,Labour_cost,Supplier)
                                        VALUES(SEQ_Products_Cost.nextVal,'{0}','{1}','{2}','{3}','{4}','{5}','{6}')",
                                                                            seq_p_c_record,
                                                                            PN,
                                                                            prepared_Summary_process,
                                                                            specific_process,
                                                                            man_hours,
                                                                            labour_cost,
                                                                            Program._userInfo.User_Name);
                try
                {
                    OracleDaoHelper.executeSQLThrowExceptioin(sqlStr, theConnForTransaction);
                }
                catch (Exception ex)
                {
                    if (ex.ToString().Contains("ORA-00001"))
                    {
                        MessageBox.Show(firstWS.Index + "." + firstWS.Name + ": 第" + rowIndex + "行为重复工序,请检查成本表格，请重新导入 . ", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        tran.Rollback();
                        theConnForTransaction.Close();
                        lblPromptForPB.Visible = false;
                        pb.Visible = false;
                        myExcel.close();
                        return;
                    }
                    MessageBox.Show(firstWS.Index + "." + firstWS.Name + ": 第" + rowIndex + "行，数据导入时发生异常，请检查成本表格,重新导入。" + ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    tran.Rollback();
                    theConnForTransaction.Close();
                    lblPromptForPB.Visible = false;
                    pb.Visible = false;
                    myExcel.close();
                    return;
                }
                lblPromptForPB.Visible = true;
                lblPromptForPB.Text = firstWS.Index + "." + firstWS.Name + ": ";
                pb.Value++;
                continue;
            }
            tran.Commit();
            theConnForTransaction.Close();

            pb.Visible = false;
            lblPromptForPB.Visible = false;
            lblPromptForPB.Text = "";
            lblResult.Visible = true;
            IShowProductsCostDetail showProductsCostDetailImpl = new ShowProductsCostDetailImpl();
            this.dgv.DataSource = showProductsCostDetailImpl.getProductsDetail(PN);
            DGVHelper.AutoSizeForDGV(dgv);
            myExcel.close();
            //ShowResult.show(lblResult, "   第1个表格非成衣成本文件！依据：第3行4列和第3行5列均非数字！", false);
            ShowResult.show(lblResult, "   导入完成！", true);
            timerRestoreLblResult.Enabled = true;
          
        }
        /// <summary>
        /// 判断某个Excel 第4行，第4，5列内容是否为数字。
        /// </summary>
        /// <param name="ws"></param>
        /// <returns></returns>
        private MSG isProductsCostRecord(Worksheet ws)
        {
            MSG msg = new MSG();
            //判断第3行，第4，5列 内容 是否为 数字
            string man_hours_3r_4c = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[3, 4]).Text.ToString();
            string labours_cost_3r_5c = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[3, 5]).Text.ToString();
            int result = 0;
            if (!int.TryParse(man_hours_3r_4c, out result)) {
                msg.Msg = "第3行第4列: " + man_hours_3r_4c +  "非数字";
                return msg;
            }
            float labours_cost_3r_5c_f = 0.0f;
            if (!float.TryParse(labours_cost_3r_5c, out labours_cost_3r_5c_f)) {
                msg.Msg = "第3行第5列：" + labours_cost_3r_5c + "非浮点数。";
                return msg;
            }
            msg.Flag = true;
            msg.Msg = "检查通过！";
            return msg;
        }
        /// <summary>
        /// 判断某个Excel 第4行，第4，5列内容是否为数字。
        /// </summary>
        /// <param name="ws"></param>
        /// <returns></returns>
        private bool isProductsCostRecordOfGroup1(Worksheet ws) {
            //判断第4行，第4，5列 内容 是否为 数字
            string man_hours_4r_3c = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[4, 3]).Text.ToString();
            string labours_cost_4r_4c = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[4, 4]).Text.ToString();
            int result = 0;
            if (!int.TryParse(man_hours_4r_3c, out result)) return false;
            float labours_cost_4r_4c_f = 0.0f;
            if (!float.TryParse(labours_cost_4r_4c, out labours_cost_4r_4c_f)) return false;
            return true;
        }
        /// <summary>
        /// 判断某个Excel 第4行，第4，5列内容是否为数字。
        /// </summary>
        /// <param name="ws"></param>
        /// <returns></returns>
        private bool isProductsCostRecordOfGroup2(Worksheet ws)
        {
            //判断第4行，第4，5列 内容 是否为 数字
            string man_hours_4r_8c = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[4, 8]).Text.ToString();
            string labours_cost_4r_9c = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[4, 9]).Text.ToString();
            int result = 0;
            if (!int.TryParse(man_hours_4r_8c, out result)) return false;
            float labours_cost_4r_4c_f = 0.0f;
            if (!float.TryParse(labours_cost_4r_9c, out labours_cost_4r_4c_f)) return false;
            return true;
        }
   
    }
}
