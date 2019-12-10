using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Tools;
using Oracle.DataAccess.Client;
using Excel;
using Microsoft.Office.Interop.Excel;
namespace Products_Cost
{
    public partial class FrmDLProductsRecordTemplate : Form
    {
        public static string _action = "query";
        string _defaultDir = System.Windows.Forms.Application.StartupPath + "\\报工单\\";
        string _fileName = string.Empty;
        string xlsFilePath = string.Empty;
        public FrmDLProductsRecordTemplate()
        {
            InitializeComponent();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FrmDLTemplate_Load(object sender, EventArgs e)
        {
            #region 加载所有成衣名称。
            string sqlStr = string.Format(@"select distinct product_name 
                                              from (
                                                      select distinct product_name,update_time
                                                      from Products_Cost
                                                      where TRUNC(Update_Time,'YYYY') > = TRUNC(ADD_MONTHS(UPDATE_TIME,-36),'YYYY')
                                                      order by  update_time
                                              )temp");
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
            btnExport_Click(sender, e);
        }
        /// <summary>
        /// 导出到Excel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnExport_Click(object sender, EventArgs e)
        {
            OracleHelper oH = OracleHelper.getBaseDao();
            if (string.IsNullOrEmpty(cbPN.Text.Trim())) return;
            if (CmdHelper.ifExistsTheProcessByName("EXCEL"))
            {
                return;
            }
            //获取该成品对应的工序。
            System.Data.DataTable dt = null;
            OracleParameter paramPN = new OracleParameter("v_PN", OracleDbType.NVarchar2, 20);
            OracleParameter paramCur = new OracleParameter("retureCur", OracleDbType.RefCursor);
            paramPN.Direction = ParameterDirection.Input;
            paramCur.Direction = ParameterDirection.ReturnValue;
            paramPN.Value = cbPN.Text.Trim();
            OracleParameter[] parameters = new OracleParameter[2] { paramCur, paramPN };
            string procName = "Show_Products_Cost.get_P_C_Info_To_Piecework";
            dt = oH.getDT(procName, parameters);
            _fileName = cbPN.Text.Trim() + ".xls";
            DirectoryHelper.createDirecotry(_defaultDir);
            xlsFilePath = _defaultDir + _fileName;
            //获取一个Excel
            V_New_Excel v_Excel = new V_New_Excel(xlsFilePath);
            Worksheet wS = v_Excel.WS;
            Usual_Excel_Helper uEHelper = new Usual_Excel_Helper(wS);
            uEHelper.setSpecificCellValue(1, 1, cbPN.Text.Trim() + "报工单", 11, true);
            //写序号标题
            uEHelper.setSpecificCellValue(2, 3, "姓名");
            uEHelper.setSpecificCellValue(3, 1, "序号");
            uEHelper.setSpecificCellValue(3, 2, "部位");
            uEHelper.setSpecificCellValue(3, 3, "工序");
            //姓名占据两列
            //uEHelper.merge("C2", "D2");
            //uEHelper.merge("C3","D3");
            //Range range = wS.Range[wS.Cells[2, 3], wS.Cells[2, 4]];
            //uEHelper.textAlighRight(range);
            //工序名称，单据时间靠右
            //range = wS.Range[wS.Cells[3, 4], wS.Cells[3, 5]];
            //uEHelper.textAlighRight(range);
            //设置第三列宽度
            uEHelper.setColumnWidth("C", 42.25M);
            uEHelper.setColumnWidth("A", 5.13M);
            uEHelper.setRowHeight(1, 31);
            uEHelper.setRowHeight(2, 31);
            pb.Visible = true;
            pb.Value = 0;
            pb.Maximum = dt.Rows.Count;
            lblResult.Visible = false;
            lblPrompt.Visible = true;
            lblPrompt.Text = "请等待！";
            //开始写信息
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                uEHelper.setSpecificCellValue(i + 4, 1, dt.Rows[i]["row_num"].ToString());
                uEHelper.setSpecificCellValue(i + 4, 2, dt.Rows[i]["Summary_Process"].ToString());
                uEHelper.setSpecificCellValue(i + 4, 3, dt.Rows[i]["specific_Process"].ToString());
                pb.Value++;
            }
            pb.Visible = false;
            pb.Value = 0;
            lblResult.Visible = true;
            lblPrompt.Visible = false;
            lblPrompt.Text = "";
            for (int columnIndex = 4; columnIndex <= 30; columnIndex++)
            {
                uEHelper.setColumnWidthByColumnIndex(columnIndex, 4.5M);
            }
            Range range = wS.Range[wS.Cells[2 + dt.Rows.Count, 30], wS.Cells[2 + dt.Rows.Count, 30]];
            uEHelper.setAllTheBoxLine(range);
            uEHelper.merge("A1", "AD1");
            v_Excel.displayAlert();
            uEHelper.MergeTheSpecificColumnWithoutBlankContent(2);
            //设置边框。
            uEHelper.setAllTheBoxLine();
            v_Excel.saveWithoutAutoFit();
            v_Excel.closeTheApp();
            ShowResult.show(lblResult, cbPN.Text.Trim() + " 产量统计模板保存于: " + xlsFilePath, true);
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
