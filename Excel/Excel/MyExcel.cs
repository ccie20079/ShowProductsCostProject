using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Windows.Forms;
using Tools;
using Microsoft.Office.Interop.Excel;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace Excel
{
    /// <summary>
    /// 
    /// </summary>
    public class MyExcel
    {
        #region Version Info
        //=====================================================================
        // Project Name        :    Excel  
        // Project Description : 
        // Class Name          :    test
        // File Name           :    test
        // Namespace           :    Excel 
        // Class Version       :    v1.0.0.0
        // Class Description   : 
        // CLR                 :    4.0.30319.42000  
        // Author              :    董   魁  (ccie20079@126.com)
        // Addr                :    中国  陕西 咸阳    
        // Create Time         :    2019-10-22 14:54:21
        // Modifier:     
        // Update Time         :    2019-10-22 14:54:21
        //======================================================================
        // Copyright © DGCZ  2019 . All rights reserved.
        // =====================================================================
        #endregion

        private string _path;
        Microsoft.Office.Interop.Excel.ApplicationClass _app = null;
        Microsoft.Office.Interop.Excel.Workbook _wBook = null;
        private Worksheet _firstWS = null;
        private Worksheet _secondWS = null;
        private Worksheet _thirdWS = null;
        private int _HwndOfApp;

        /// <summary>
        /// 
        /// </summary>
        public static int GWL_STYLE = -16;
        /// <summary>
        /// 
        /// </summary>
        public static uint WS_VISIBLE = 0x80;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="hwnd"></param>
        /// <param name="nIndex"></param>
        /// <returns></returns>
        [DllImport("User32.dll", EntryPoint = "GetWindowLong", SetLastError = true)]
        public static extern int GetWindowLong(int hwnd, int nIndex);
        //Declare Function IsWindowVisible Lib "user32" Alias "IsWindowVisible" (ByVal hwnd As Long) As Long
        [DllImport("User32.dll",EntryPoint = "IsWindowVisible",SetLastError =true)]
        public static extern int IsWindowVisible(int hwnd);

        /// <summary>
        /// 
        /// </summary>
        /// 
        public string Path
        {
            get
            {
                return _path;
            }

            set
            {
                _path = value;
            }
        }
       public int HwndOfApp
        {
            get
            {
                return _app.Hwnd;
            }
        }

        public ApplicationClass App
        {
            get
            {
                return _app;
            }

            set
            {
                _app = value;
            }
        }

        public Worksheet FirstWS
        {
            get
            {
                return _firstWS;
            }

            set
            {
                _firstWS = value;
            }
        }

        public Workbook WBook
        {
            get
            {
                return _wBook;
            }

            set
            {
                _wBook = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="path"></param>
        public MyExcel(string path) {
            this._path = path;
        }
        /// <summary>
        /// 创建一个Excel文件
        /// </summary>
        /// <param name="isVisible"></param>
        /// <returns></returns>
        public bool create(bool isVisible = false)
        {
            App = new Microsoft.Office.Interop.Excel.ApplicationClass();
            App.Visible = isVisible;
            this._HwndOfApp = App.Hwnd;
            try
            {
                _wBook = App.Workbooks.Add();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                if (_wBook != null)
                {
                    _wBook.Close(true, _path, Type.Missing);
                }
                //退出excel
                App.Quit();
                //释放资源
                if (_wBook != null) System.Runtime.InteropServices.Marshal.ReleaseComObject(WBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(App);
                //调用GC的垃圾回收方法
                GC.Collect();
                GC.WaitForPendingFinalizers();
                return false;
            }
            App.DisplayAlerts = false;
            App.AlertBeforeOverwriting = false;
            //保存工作簿
            WBook.SaveAs(this._path, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            WBook.Close(true, _path, Type.Missing);
            //退出excel
            App.Quit();
            return true;
        }
        /// <summary>
        /// 
        /// </summary>
        public int open(bool isVisible = false) {
            if (!File.Exists(_path)){
                MessageBox.Show("此Excel不存在！", "提示：",MessageBoxButtons.OK,MessageBoxIcon.Information);
                return 0;
            }
            _app = new Microsoft.Office.Interop.Excel.ApplicationClass();
            _app.Visible = isVisible;
            try
            {
                _wBook = _app.Workbooks.Open(this._path, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                if (_wBook != null)
                {
                    _wBook.Close(true, _path, Type.Missing);
                }
                //退出excel
                _app.Quit();
                //释放资源
                if (WBook != null) System.Runtime.InteropServices.Marshal.ReleaseComObject(WBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(_app);
                //调用GC的垃圾回收方法
                GC.Collect();
                GC.WaitForPendingFinalizers();
                return 0;
            }
            _HwndOfApp = _app.Hwnd;
            AppManagement.add(_HwndOfApp);
            return _app.Hwnd;
        }
        /// <summary>
        /// 
        /// </summary>
        public int openWithoutAlerts(bool isVisible = false)
        {
            if (!File.Exists(_path))
            {
                MessageBox.Show("此Excel不存在！", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return 0;
            }
            _app = new Microsoft.Office.Interop.Excel.ApplicationClass();
            _app.Visible = isVisible;
            _app.DisplayAlerts = false;
            try
            {
                WBook = _app.Workbooks.Open(this._path, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                if (WBook != null)
                {
                    WBook.Close(true, _path, Type.Missing);
                }
                //退出excel
                _app.Quit();
                //释放资源
                if (WBook != null) System.Runtime.InteropServices.Marshal.ReleaseComObject(WBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(_app);
                //调用GC的垃圾回收方法
                GC.Collect();
                GC.WaitForPendingFinalizers();
                return 0;
            }
            _HwndOfApp = _app.Hwnd;
            return _app.Hwnd;
        }
        /// <summary>
        /// 
        /// </summary>
        public void saveWithoutAutoFit()
        {
            App.DisplayAlerts = false;
            App.AlertBeforeOverwriting = false;
            //保存工作簿
            WBook.SaveAs(_path, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            WBook.Close(true, _path, Type.Missing);
            //退出excel
            App.Quit();
            //释放资源
        }
        /// <summary>
        /// 列宽自适应
        /// </summary>
        public void save()
        {
            //自动调整列宽
            _firstWS.UsedRange.EntireColumn.AutoFit();
            App.DisplayAlerts = false;
            App.AlertBeforeOverwriting = false;
            //保存工作簿
            WBook.SaveAs(_path, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            WBook.Close(true, _path, Type.Missing);
            //退出excel
            App.Quit();
        }
            //释放资源 
        /// <summary>
        /// 
        /// </summary>
        public void saveAndColumnsAutoFit(Range range =null)
        {
            if (range != null) {
                //自动调整列宽
                range.EntireColumn.AutoFit();
            }
            App.DisplayAlerts = false;
            App.AlertBeforeOverwriting = false;
            //保存工作簿
            WBook.SaveAs(_path, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            WBook.Close(true, _path, Type.Missing);
            //退出excel
            App.Quit();
            //释放资源
        }
        /// <summary>
        /// 关闭该Excel.
        /// </summary>X
        public void close() {
            CmdHelper.killProcessByHwnd(this._HwndOfApp);
        }
        /// <summary>
        /// 获取Sheet1表的名称。
        /// </summary>
        public string getSheetNameOfSheet1() {
            if (!File.Exists(_path))
            {
                MessageBox.Show("此Excel不存在！", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return "";
            }
            App = new Microsoft.Office.Interop.Excel.ApplicationClass();
            App.Visible = false;
            try
            {
                WBook = App.Workbooks.Open(this._path, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                if (WBook != null)
                {
                    WBook.Close(true, _path, Type.Missing);
                }
                //退出excel
                App.Quit();
                //释放资源
                if (WBook != null) System.Runtime.InteropServices.Marshal.ReleaseComObject(WBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(App);
                //调用GC的垃圾回收方法
                GC.Collect();
                GC.WaitForPendingFinalizers();
                return "";
            }
            string name = ((Worksheet)WBook.Sheets[1]).Name;
            WBook.Close(true, _path, Type.Missing);
            //退出excel
            App.Quit();
            //释放资源
            System.Runtime.InteropServices.Marshal.ReleaseComObject(WBook);
            System.Runtime.InteropServices.Marshal.ReleaseComObject(App);
            //调用GC的垃圾回收方法
            GC.Collect();
            GC.WaitForPendingFinalizers();
            return name;
        }
        /// <summary>
        /// 获取第一个Worksheet
        /// </summary>
        /// <returns></returns>
        public Worksheet getFirstWorkSheetAfterOpen()
        {
            if (null == WBook) {
                open();
            }
            Worksheet wS = ((Worksheet)WBook.Sheets[1]);
            _firstWS = wS;
            return wS;
        }
        /// <summary>
        /// 依据索引获取Worksheet
        /// </summary>
        /// <returns></returns>
        public Worksheet getWorksheetByIndex(int i)
        {
            if (null == WBook)
            {
                open();
            }
            Worksheet wS = ((Worksheet)WBook.Sheets[i]);
            return wS;
        }
        public Worksheet getSecondWorksheetAfterOpen() {
            if (null == WBook) {
                open();
            }
            Worksheet wS = ((Worksheet)(WBook.Sheets[2]));
            _secondWS = wS;
            return wS;
        }
        public Worksheet getThirdWorksheetAfterOpen() {
            if (null == WBook) {
                open();
            }
            Worksheet wS = ((Worksheet)(WBook.Sheets[3]));
            _thirdWS = wS;
            return wS;
        }
        /// <summary>
        /// 返回 可以看见的Worksheet List
        /// </summary>
        /// <returns></returns>
        public List<Worksheet> getVisualWS()
        {
            List<Worksheet> wSList = new List<Worksheet>();
            int count = this.WBook.Sheets.Count;
            for (int i = 1; i <= count; i++)
            {
               Worksheet sheet = (Worksheet)WBook.Sheets[i];
                if (sheet.Visible == XlSheetVisibility.xlSheetVisible)  //如果可见,没有隐藏
                       wSList.Add(sheet);
            }
            return wSList;
        }
        /// <summary>
        /// 默认新增到第一个索引未知。
        /// </summary>
        public Worksheet addSheetToFirstIndex() {
            //   Sheets.Add After:=Sheets(Sheets.Count)
            WBook.Sheets.Add();
            return (Worksheet)(WBook.Sheets[1]);
        }
        public Worksheet AddSheetToLastIndex(string sheetName)
        {
            Worksheet lastSheet = (Worksheet)WBook.Sheets[WBook.Sheets.Count];
            Worksheet xSt1 = (Microsoft.Office.Interop.Excel.Worksheet)WBook.Sheets.Add(Type.Missing, lastSheet, 1, Type.Missing);
            xSt1.Name = sheetName;
            xSt1.Activate();
            return xSt1;
        }
        //删除掉某个表格
        public void delTheSheet(int sheetIndex) {
            Worksheet sheet =(Worksheet)WBook.Sheets[sheetIndex];
            sheet.Delete();
        }
        /// <summary>
        /// 获取所有表格的数量。
        /// </summary>
        /// <returns></returns>
        public int getCountsOfAllSheet() {
            return WBook.Sheets.Count;
        }
        /// <summary>
        /// 从源sheet 复制所有内容 到 目的sheet中
        /// </summary>
        /// <param name="srcSheet"></param>
        /// <param name="destSheet"></param>
        public void copyRangeFromOneToAnotherSheet(Worksheet srcSheet, Worksheet destSheet)
        {
            //复制源表格整体内容
            srcSheet.Cells.Copy();
            Range range = (Range)(destSheet.Cells[1, 1]);
            destSheet.Cells.PasteSpecial();
            destSheet.Cells.NumberFormatLocal = "@";
            /*
              Cells.Select
                Selection.copy
                Sheets.Add After:=Sheets(Sheets.Count)
                ActiveSheet.Paste
                Cells.Select
                Application.CutCopyMode = False
                Selection.NumberFormatLocal = "@"
            */
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        object openEt()
        {
            object[] args = new object[1];
            Type wpsAppName;
            string progID = "KET.Application";// "Excel.Application" 换成这个就是office了
            wpsAppName = Type.GetTypeFromProgID(progID);
            object wpsApp = Activator.CreateInstance(wpsAppName);
            args[0] = true;
            return wpsApp;
        }
        /// <summary>
        /// 关闭隐藏的Excel进程。
        /// </summary>
        public static void killHidedExcelProcess() {

            ///待写
        }
    }
}
