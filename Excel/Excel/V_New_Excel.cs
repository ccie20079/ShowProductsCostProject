using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Interop.Excel;
using Tools;
namespace Excel
{
    /// <summary>
    /// Excel视图类。
    /// </summary>
    public class V_New_Excel
    {
        private Application _app;
        private Workbook _wB;
        private Worksheet _wS;  //新增的WorkSheet
        private int _hwndOfApp;
        private string _xlsSavePath;    //Excel的保存路径。
        public Application App
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

        public Workbook WB
        {
            get
            {
                return _wB;
            }

            set
            {
                _wB = value;
            }
        }

        public int HwndOfApp
        {
            get
            {
                return _hwndOfApp;
            }

            set
            {
                _hwndOfApp = value;
            }
        }

        public string XlsFilePath
        {
            get
            {
                return _xlsSavePath;
            }

            set
            {
                _xlsSavePath = value;
            }
        }

        public Worksheet WS
        {
            get
            {
                return _wS;
            }

            set
            {
                _wS = value;
            }
        }


        #region 关闭App
        public void closeTheApp() {
            CmdHelper.killProcessByHwnd(HwndOfApp);
        }
        #endregion
        #region 保存前的初始化.
        private void formatForExcel() {
            int rowMaxCount = WS.UsedRange.Rows.Count;
            int colMaxCount = WS.UsedRange.Columns.Count;
            Range range = WS.get_Range(WS.Cells[1, 1], WS.Cells[rowMaxCount, colMaxCount]);
            //设置单元格为文本。
            range.NumberFormatLocal = "@";
            //水平对齐方式
            range.HorizontalAlignment = XlHAlign.xlHAlignCenter;
        }
        #endregion
        #region 新建一个Excel,保存时需要路径.
        /// <summary>
        /// 新建一个Excel文档
        /// </summary>
        /// <param name="xlsSavePath"></param>
        public V_New_Excel(string xlsSavePath) {
            _app = new ApplicationClass();
            _app.Visible = false;
            //Workbook wBook = workbooks.Add(Microsoft.Office.Interop.Excel.XlWBATemplate.xlWBATWorksheet);
            _wB = _app.Workbooks.Add(true);
            this._xlsSavePath = xlsSavePath;
            this.WS= (Worksheet)_wB.Worksheets[1];
            _hwndOfApp = _app.Hwnd;
            
        }
        #endregion
        #region 显示这个Excel;
        public void showExcel()
        {
            _app.Visible = true;
        }
        #endregion
        #region 新建一个Excel,保存时需要路径.
        public V_New_Excel(Application app,string xlsSavePath)
        {
            _app = app;
            _app.Visible = false;
            //Workbook wBook = workbooks.Add(Microsoft.Office.Interop.Excel.XlWBATemplate.xlWBATWorksheet);
            _wB = _app.Workbooks.Add(true);
            this._xlsSavePath = xlsSavePath;
            this.WS = (Worksheet)_wB.Worksheets[1];
            _hwndOfApp = _app.Hwnd;
        }
        #endregion
        /// <summary>
        /// 默认不显示弹出的  询问提出框。
        /// </summary>
        /// <param name="flat"></param>
        public void displayAlert(bool flat = false) {
            //设置禁止弹出保存和覆盖的询问提示框
            _app.DisplayAlerts = flat;
            _app.AlertBeforeOverwriting = flat;
        }
        #region 用于新建的Excel保存.
        public void save(string xlsFilePath) {
            Range range = WS.UsedRange;
            //自动调整列宽
            range.EntireColumn.AutoFit();
            //设置禁止弹出保存和覆盖的询问提示框
            _app.DisplayAlerts = false;
            _app.AlertBeforeOverwriting = false;
            string dir = DirectoryHelper.getDirOfFile(xlsFilePath);
            //先建立目录.
            DirectoryHelper.createDirecotry(dir);
            //保存excel文档并关闭
            _wB.SaveAs(_xlsSavePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            _wB.Close(true, _xlsSavePath, Type.Missing);
            //退出Excel程序
            _app.Quit();
        }
        #endregion
        #region 用于新建的Excel保存.
        public void saveWithoutAutoFit()
        {
            Range range = WS.UsedRange;
            //自动调整列宽
            //range.EntireColumn.AutoFit();
            //设置禁止弹出保存和覆盖的询问提示框
            _app.DisplayAlerts = false;
            _app.AlertBeforeOverwriting = false;
            string dir = DirectoryHelper.getDirOfFile(this._xlsSavePath);
            //先建立目录.
            DirectoryHelper.createDirecotry(dir);
            //保存excel文档并关闭
            _wB.SaveAs(_xlsSavePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            _wB.Close(true, _xlsSavePath, Type.Missing);
            //退出Excel程序
            _app.Quit();
        }
        #endregion
    }
}
