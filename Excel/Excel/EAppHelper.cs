using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Tools;
using System.Threading;
namespace Excel
{
    /// <summary>
    /// 用来打开一个App.
    /// </summary>
    public class EAppHelper
    {
        private string _xlsFilePath;
        private int _hwndOfExcel;
        public EAppHelper(string xlsFilePath) {
            this._xlsFilePath = xlsFilePath;
        }
        #region 获取Excel中所有Sheet名称的列表
        /// <summary>
        /// 获取Excel中所有Sheet名称的列表
        /// </summary>
        /// <param name="xlsName"></param>
        /// <returns></returns>
        public  List<Worksheet> getVisualWS()
        {
            List<Worksheet> wSList = new List<Worksheet>();
            ApplicationClass app = new ApplicationClass();
            this._hwndOfExcel = app.Hwnd;
            app.Visible = false;
            Workbook wBook = null;
            try
            {
                wBook = app.Workbooks.Open(_xlsFilePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                if (wBook != null)
                {
                    wBook.Close(true, _xlsFilePath, Type.Missing);
                }
                //退出excel
                app.Quit();
                //释放资源
                if (wBook != null) System.Runtime.InteropServices.Marshal.ReleaseComObject(wBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(app);
                //调用GC的垃圾回收方法
                GC.Collect();
                GC.WaitForPendingFinalizers();
                return wSList;
            }
            int count = wBook.Sheets.Count;
            Worksheet sheet = null;
            for (int i = 1; i <= count; i++)
            {
                sheet = (Worksheet)wBook.Sheets[i];
                if (sheet.Visible == XlSheetVisibility.xlSheetVisible)  //如果可见,没有隐藏
                    wSList.Add(sheet);
            }
            return wSList;
        }
        #endregion
        public List<Worksheet> getVisualWS(out int hwndOfExcel)
        {
            List<Worksheet> wSList = new List<Worksheet>();
            ApplicationClass app = new ApplicationClass();
            this._hwndOfExcel = app.Hwnd;
            app.Visible = false;
            Workbook wBook = null;
            try
            {
                MultiThread.dowork("Microsoft Office Excel");
                wBook = app.Workbooks.Open(_xlsFilePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                hwndOfExcel = app.Hwnd;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                if (wBook != null)
                {
                    wBook.Close(true, _xlsFilePath, Type.Missing);
                }
                //退出excel
                app.Quit();
                //释放资源
                if (wBook != null) System.Runtime.InteropServices.Marshal.ReleaseComObject(wBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(app);
                //调用GC的垃圾回收方法
                GC.Collect();
                GC.WaitForPendingFinalizers();
                hwndOfExcel = 0;
                return wSList;
            }
           

            int count = wBook.Sheets.Count;
            Worksheet sheet = null;
            for (int i = 1; i <= count; i++)
            {
                sheet = (Worksheet)wBook.Sheets[i];
                if (sheet.Visible == XlSheetVisibility.xlSheetVisible)  //如果可见,没有隐藏
                    wSList.Add(sheet);
            }
            return wSList;
        }
        #region 关闭此App
        public void closeApp() {
            CmdHelper.killProcessByHwnd(_hwndOfExcel);
        }
        #endregion
    }
}
