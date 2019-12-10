using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Interop.Excel;
using System.Windows.Forms;

namespace Excel
{
    public class PictureToExcel
    {
        private Microsoft.Office.Interop.Excel.Application m_objExcel = null;
        private Workbooks m_objBooks = null;
        private _Workbook m_objBook = null;
        private Sheets m_objSheets = null;
        private _Worksheet m_objSheet = null;
        private Range m_objRange = null;
        private object m_objOpt = System.Reflection.Missing.Value;

        /// <summary>   
        /// 功能：实现Excel应用程序的打开   
        /// </summary>   
        /// <param name="TemplateFilePath">模板文件物理路径</param>   
        public void Open(string TemplateFilePath)
        {
            //打开对象
            m_objExcel = new Microsoft.Office.Interop.Excel.Application();
            m_objExcel.Visible = false;
            m_objExcel.DisplayAlerts = false;
            if (m_objExcel.Version != "11.0")
            {
                MessageBox.Show("您的Excel 版本不是11.0 （Office 2003），操作可能会出现问题。");
                m_objExcel.Quit();
                return;
            }
            m_objBooks = (Workbooks)m_objExcel.Workbooks;
            if (TemplateFilePath.Equals(String.Empty))
            {
                m_objBook = (_Workbook)(m_objBooks.Add(m_objOpt));
            }
            else
            {
                m_objBook = m_objBooks.Open(TemplateFilePath, m_objOpt, m_objOpt, m_objOpt, m_objOpt, m_objOpt, m_objOpt, m_objOpt, m_objOpt, m_objOpt, m_objOpt, m_objOpt, m_objOpt, m_objOpt, m_objOpt);
            }
            m_objSheets = (Sheets)m_objBook.Worksheets;
            m_objSheet = (_Worksheet)(m_objSheets.get_Item(1));
            m_objExcel.WorkbookBeforeClose += new AppEvents_WorkbookBeforeCloseEventHandler(m_objExcel_WorkbookBeforeClose);

        }
        private void m_objExcel_WorkbookBeforeClose(Workbook m_objBooks, ref bool _Cancel)
        {
            MessageBox.Show("保存完毕！");
        }

        public void InsertPicture(string RangeName, string PicturePath) {
            m_objRange = m_objSheet.Range[RangeName, m_objOpt];
            m_objRange.Select();
           



        }
    }
}
