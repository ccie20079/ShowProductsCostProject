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
namespace Products_Cost
{
    public partial class FrmExportProductsCostDetail : Form
    {
        string defaultDir = System.Windows.Forms.Application.StartupPath + "\\成本汇总";
        string xlsFilePath = string.Empty;
        public FrmExportProductsCostDetail()
        {
            InitializeComponent();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FrmExportProductsCostDetail_Load(object sender, EventArgs e)
        {
            #region 加载所有成衣名称。
            string sqlStr = string.Format(@"SELECT DISTINCT product_name 
                                              FROM (
                                                      SELECT DISTINCT product_name,update_time
                                                      FROM Products_Cost
                                                      WHERE TRUNC(Update_Time,'YYYY') > = TRUNC(ADD_MONTHS(UPDATE_TIME,-60),'YYYY')
                                                   ) TEMP 
                                                ORDER BY NLSSORT(product_name,'NLS_SORT= SCHINESE_PINYIN_M') ASC");
            System.Data.DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            cbPN.SelectedIndexChanged -= new System.EventHandler(cbPN_SelectedIndexChanged);
            this.cbPN.DataSource = dt;
            cbPN.DisplayMember = "Product_Name";
            cbPN.ValueMember = "Product_Name";
            cbPN.SelectedIndexChanged += new System.EventHandler(cbPN_SelectedIndexChanged);
            #endregion
        }
        /// <summary>
        /// 获取当前Product_Name的成本详情。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cbPN_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(cbPN.Text.Trim())) return;
            IShowProductsCostSummary iShowProductsCostSummary = new ShowProductsCostSummaryImpl();
            System.Data.DataTable dt = iShowProductsCostSummary.get_P_C_Summary_To_Export(cbPN.Text.Trim());
            this.dgv.DataSource = dt;
            DGVHelper.AutoSizeForDGV(dgv);
            //dgv.Columns["Seq"].Visible = false;
            //显示照片
            FrmProductsCostSummary.getPictureByProductName(cbPN.Text.Trim(), pictureBox);
        }
        /// <summary>
        /// 导出到Excel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnExport_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(cbPN.Text.Trim())) {
                MessageBox.Show("您未选中成衣名称！", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            //加载图片
            cbPN_SelectedIndexChanged(sender, e);
            if (CmdHelper.ifExistsTheProcessByName("EXCEL"))
            {
                FrmCloseExcel frmCloseExcel = new FrmCloseExcel();
                frmCloseExcel.ShowDialog();
            }
            //导出到Excel中
            string _defaultDir = System.Windows.Forms.Application.StartupPath + "\\成本汇总";
            string _fileName = cbPN.Text.Trim() + "_成本汇总.xls";
            xlsFilePath = FileNameDialog.getSaveFileNameWithDefaultDir("成衣汇总：", "*.xls|*.xls", _defaultDir, _fileName);
            if (!xlsFilePath.Contains(@"\"))
            {
                return;
            }
            //将图片存于粘贴板中。
            Clipboard.SetImage(pictureBox.Image);
            System.Data.DataTable dt = (System.Data.DataTable)dgv.DataSource;
            string PN = dt.Rows[0]["成衣名称"].ToString();
            ExcelHelper.saveDtToExcelWithProgressBar((System.Data.DataTable)dgv.DataSource, xlsFilePath,pb);
            MyExcel myExcel = new MyExcel(xlsFilePath);
            myExcel.open();
            Worksheet wS = myExcel.getFirstWorkSheetAfterOpen();
           
            
            //获取第二个Sheet.
            myExcel.App.Visible = false;
            Usual_Excel_Helper uEHelper = new Usual_Excel_Helper(wS);
            int maxRowCount = wS.UsedRange.Rows.Count;
            uEHelper.insertAboveTheSpecificRow(1);
            uEHelper.setSpecificCellValue("A1", PN);
            Range range = (wS.Range)[wS.Cells[2,2], wS.Cells[maxRowCount,2]];
            uEHelper.delTheSpecificContentShiftToLeft(range);
            myExcel.App.DisplayAlerts = false; 
            uEHelper.merge("A1", "G1");
            uEHelper.MergeTheSpecificColumnWithoutBlankContent(2);

            //保存图片到I1.
            Range rangeI1 =uEHelper.getRange("I1", "I1");
            /*
                  ActiveSheet.Range("A1").PasteSpecial(
                 Excel.Enums.XlPasteType.xlPasteAll,
                 Excel.Enums.Xl‌​PasteSpecialOperation.xlPasteSpecialOperationNone,
                 false, false);
            */
            rangeI1.Select();
            wS.PasteSpecial();

            //sheet2中写入文件.
            IShowProductsCostSummary iShowProductsCostSummary = new ShowProductsCostSummaryImpl();
            dt = iShowProductsCostSummary.get_P_C_Each_Port(cbPN.Text.Trim());

            //序号, 成衣名称,  概要工序,  指定工序, 指定每部位工序, 工时, 件数, 单价, 最终单价.

            /*
                seq_p_c_record, 
                product_name, 
                summary_process, 
                specific_process, 
                specific_each_process, 
                man_hours, 
                amount, 
                each_cost, 
                final_labour_cost
            */
            //第二个表格.
            myExcel.AddSheetToLastIndex("每部件成本汇总");
            Worksheet secondWS = myExcel.getSecondWorksheetAfterOpen();

            //先写标题。
            secondWS.Cells[1, 1] = "序号";
            secondWS.Cells[1, 2] = "成衣名称";
            secondWS.Cells[1, 3] = "概要工序";
            secondWS.Cells[1, 4] = "指定工序";
            secondWS.Cells[1, 5] = "指定每部位工序";
            secondWS.Cells[1, 6] = "工时";
            secondWS.Cells[1, 7] = "件数";
            secondWS.Cells[1, 8] = "单价";
            secondWS.Cells[1, 9] = "工价";
            secondWS.Cells[1,10] = "最终工价";

            for (int i = 0;i<=dt.Rows.Count-1;i++) {
                secondWS.Cells[2 + i, 1] = dt.Rows[i]["seq_p_c_record"].ToString();
                secondWS.Cells[2 + i, 2] = dt.Rows[i]["product_name"].ToString();
                secondWS.Cells[2 + i, 3] = dt.Rows[i]["summary_process"].ToString();
                secondWS.Cells[2 + i, 4] = dt.Rows[i]["specific_process"].ToString();
                secondWS.Cells[2 + i, 5] = dt.Rows[i]["specific_each_process"].ToString();
                secondWS.Cells[2 + i, 6] = dt.Rows[i]["man_hours"].ToString();
                secondWS.Cells[2 + i, 7] = dt.Rows[i]["amount"].ToString();
                secondWS.Cells[2 + i, 8] = dt.Rows[i]["each_cost"].ToString();
                secondWS.Cells[2 + i, 9] = dt.Rows[i]["labour_cost"].ToString();
                secondWS.Cells[2 + i, 10] = dt.Rows[i]["final_labour_cost"].ToString();
            }
            //获取最终单价的区域.
            Range _range_final_labour_cost;

            uEHelper = new Usual_Excel_Helper(secondWS);
            _range_final_labour_cost = uEHelper.getRange("J2", "J" + secondWS.UsedRange.Rows.Count);
            uEHelper.setFormulaR1C1ForRange(_range_final_labour_cost, "=IF(OR(ISBLANK(RC[-3]),ISBLANK(RC[-2])),RC[-1],RC[-3]*RC[-2])");
            
            secondWS.UsedRange.EntireColumn.AutoFit();
            myExcel.save();
            myExcel.close();
            //((FrmMainOfProductsCost)this.ParentForm).notifyIcon.ShowBalloonTip(7000, "提示：","汇总保存于: " + xlsFilePath, ToolTipIcon.Info);
            ShowResult.show(lblResult, "汇总保存于: " + xlsFilePath, true);
            timerRestoreLblResult.Start();
         
        }
        private void timerRestoreLblResult_Tick(object sender, EventArgs e)
        {
            timerRestoreLblResult.Stop();
            lblResult.Text = "";
            lblResult.BackColor = Color.SkyBlue;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void lblResult_Click(object sender, EventArgs e)
        {
            //打开改文件
            MyExcel myExcel = new MyExcel(xlsFilePath);
            AppManagement.add(myExcel.open(true));
        }
    }
}
