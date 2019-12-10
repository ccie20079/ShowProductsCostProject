using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Products_Cost.Interface;
using Excel;
using Microsoft.Office.Interop.Excel;
using System.Windows.Forms;
namespace Products_Cost.ImplClass
{
    public class CheckExcelImpl : ICheckExcel
    {
        /// <summary>
        /// 判断Products_Cost 原始数据中,具体工序是否为空！
        /// </summary>
        /// <param name="xlsPath"></param>
        /// <returns></returns>
        public bool check_P_C_Template(string xlsPath,out string msg)
        {
            MyExcel myExcel = new MyExcel(xlsPath);
            myExcel.open();
            Worksheet wS = myExcel.getFirstWorkSheetAfterOpen();
            Usual_Excel_Helper uEHelper = new Usual_Excel_Helper(wS);
            int rowMaxIndex = wS.UsedRange.Rows.Count;
            int colMaxIndex = wS.UsedRange.Columns.Count;
            //具体 工序在第四列
            string specificProcess = string.Empty;
            for (int rowIndex = rowMaxIndex;rowIndex>=1;rowIndex--) {
                specificProcess = uEHelper.getSpecificCellValue("D" + rowIndex);
                if (string.IsNullOrEmpty(specificProcess)) {
                    myExcel.close();
                    msg = "第" + rowIndex + "行，具体工序不能为空！";
                    return false;
                }
            }
            myExcel.close();
            msg = "";
            return true;
       }
    }
}
