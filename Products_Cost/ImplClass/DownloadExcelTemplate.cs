using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Excel;
using Products_Cost.Interface;
using Tools;
using System.Data;
using System.Windows.Forms;
using Microsoft.Office.Interop.Excel;
namespace Products_Cost.ImplClass
{
    public class DownloadExcelTemplate : IDownloadTemplate
    {
        public static string path = string.Empty;
        /// <summary>
        /// 获取模板
        /// </summary>
        /// <returns></returns>
        public MyExcel getTemplate()
        {
            System.Data.DataTable dtToExcel = new System.Data.DataTable("成衣报价");
            dtToExcel.TableName = "请在此设置成衣名称";

            DataColumn dtSeq = new DataColumn("序号", Type.GetType("System.String"));
            DataColumn dcSummaryProcess = new DataColumn("概要工序", Type.GetType("System.String"));
            DataColumn dcSpecificProcess = new DataColumn("具体工序",Type.GetType("System.String"));
            DataColumn dcManHours = new DataColumn("工时",Type.GetType("System.String"));
            DataColumn dcLabourCost = new DataColumn("工价",Type.GetType("System.String"));
            dtToExcel.Columns.Add(dtSeq);
            dtToExcel.Columns.Add(dcSummaryProcess);
            dtToExcel.Columns.Add(dcSpecificProcess);
            dtToExcel.Columns.Add(dcManHours);
            dtToExcel.Columns.Add(dcLabourCost);

            string path = System.Windows.Forms.Application.StartupPath + "\\Template\\成衣报价.xls";
            ExcelHelper.saveDtToExcel(dtToExcel, path);
            return new  MyExcel(path);
        }
        /// <summary>
        /// 写模板 
        /// </summary>
        /// <returns></returns>
        public MyExcel writeTemplate()
        {
            path = System.Windows.Forms.Application.StartupPath + "\\Template\\成衣报价.xls";
            V_New_Excel v_New_Excel = new V_New_Excel(path);
            Worksheet wS = v_New_Excel.WS;
            Usual_Excel_Helper uEHelper = new Usual_Excel_Helper(wS);
            uEHelper.setSpecificCellValue("A1", "请在此填写成品名称",18);
            uEHelper.setSpecificCellValue("A2", "序号",16);
            uEHelper.setSpecificCellValue("B2", "工序",16);
            uEHelper.setSpecificCellValue("F2", "序号",16);
            uEHelper.setSpecificCellValue("G2", "工序",16);
            uEHelper.merge("A1", "I1");
            //设置列宽
            uEHelper.setColumnWidth("A", 5.5M);
            uEHelper.setColumnWidth("B", 32.75M);
            uEHelper.setColumnWidth("C", 4.15M);
            uEHelper.setColumnWidth("D", 5.38M);
            uEHelper.setColumnWidth("E", 0.15M);
            uEHelper.setColumnWidth("F", 5.5M);
            uEHelper.setColumnWidth("G", 32.75M);
            uEHelper.setColumnWidth("H", 4.15M);
            uEHelper.setColumnWidth("I", 5.38M);

            v_New_Excel.saveWithoutAutoFit();
            v_New_Excel.closeTheApp();
            return new MyExcel(path);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public MyExcel write_Template_For_Record_P_C()
        {
            
            path = System.Windows.Forms.Application.StartupPath + "\\模板\\成衣报价.xls";
            string default_dir = System.Windows.Forms.Application.StartupPath + "\\模板";
            DirectoryHelper.createDirecotry(default_dir);
            System.Data.DataTable dt = OracleDaoHelper.getDTBySql("select * from v_p_c_template");
            ExcelHelper.saveDtToExcel(dt, path);
            MyExcel myExcel = new MyExcel(path);
            myExcel.open();
            Worksheet wS = myExcel.getFirstWorkSheetAfterOpen();
            Usual_Excel_Helper uEHelper = new Usual_Excel_Helper(wS);
            uEHelper.insertAboveTheSpecificRow(1);
            uEHelper.setSpecificCellValue("A1", "请在此填写成品名称", 18);
            uEHelper.merge("A1", "E1");
            uEHelper.setSpecificCellValue("A3", "1", 12, true);
            myExcel.save();
            myExcel.close();
            return myExcel;
            /*V_New_Excel v_New_Excel = new V_New_Excel(path);
            Worksheet wS = v_New_Excel.WS;
            Usual_Excel_Helper uEHelper = new Usual_Excel_Helper(wS);
            uEHelper.setSpecificCellValue("A1", "请在此填写成品名称", 18);
            uEHelper.setSpecificCellValue("A2", "序号", 16);
            uEHelper.setSpecificCellValue("B2", "工序", 16);
            uEHelper.setSpecificCellValue("F2", "序号", 16);
            uEHelper.setSpecificCellValue("G2", "工序", 16);
            uEHelper.merge("A1", "I1");
            //设置列宽
            uEHelper.setColumnWidth("A", 5.5M);
            uEHelper.setColumnWidth("B", 32.75M);
            uEHelper.setColumnWidth("C", 4.15M);
            uEHelper.setColumnWidth("D", 5.38M);
            uEHelper.setColumnWidth("E", 0.15M);
            uEHelper.setColumnWidth("F", 5.5M);
            uEHelper.setColumnWidth("G", 32.75M);
            uEHelper.setColumnWidth("H", 4.15M);
            uEHelper.setColumnWidth("I", 5.38M);

            v_New_Excel.saveWithoutAutoFit();
            v_New_Excel.closeTheApp();
            return new MyExcel(path);
            */
        }
    }
}
