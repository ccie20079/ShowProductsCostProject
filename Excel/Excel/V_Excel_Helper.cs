using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Interop.Excel;
using Tools;
namespace Excel
{
    /// <summary>
    /// 此类专用于写结果到Excel中.用于已存在的WorkSheet的处理。
    /// </summary>
    public class V_Excel_Helper
    {
        private Application _app;
        private Workbook _wB;
        private List<Worksheet> _wS_List = new List<Worksheet>();   //这里列表为可见的Sheet列表.
        private int _hwndOfApp;
        private string _xlsFilePath;
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

        public List<Worksheet> WS_List
        {
            get
            {
                return _wS_List;
            }

            set
            {
                _wS_List = value;
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
                return _xlsFilePath;
            }

            set
            {
                _xlsFilePath = value;
            }
        }

        #region 构造器.
        /// <summary>
        /// 打开一个Excel
        /// </summary>
        /// <param name="xlsFilePath"></param>
        public V_Excel_Helper(string xlsFilePath) {
            App = new ApplicationClass();
            App.Visible = false;
            WB = App.Workbooks.Open(xlsFilePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            int count = WB.Worksheets.Count;
            for (int i=1;i<=count;i++) {
                WS_List = new List<Worksheet>();
                Worksheet wS = (Worksheet)WB.Worksheets.Item[i];
                if (wS.Visible == XlSheetVisibility.xlSheetVisible) {
                    WS_List.Add(wS);
                }
            }
            HwndOfApp = App.Hwnd;
            this._xlsFilePath = XlsFilePath;
        }
        #endregion;
        #region 关闭App
        public void closeTheApp() {
            CmdHelper.killProcessByHwnd(HwndOfApp);
        }
        #endregion
        #region 依据workSheet的名称,获取某个WorkSheet;
        public Worksheet getWSByName(string _the_search_sheet_name) {
            Worksheet wS = null;
            for (int i=0;i<=_wS_List.Count-1;i++) {
                if (_the_search_sheet_name.Equals(_wS_List[i].Name)) {
                    return _wS_List[i];
                }
            }
            return wS;
        }
        #endregion
        #region 保存前的初始化.
        private void formatForExcel(Worksheet wS) {
            int rowMaxCount = wS.UsedRange.Rows.Count;
            int colMaxCount = wS.UsedRange.Columns.Count;
            Range range = wS.get_Range(wS.Cells[1, 1], wS.Cells[rowMaxCount, colMaxCount]);
            //设置单元格为文本。
            range.NumberFormatLocal = "@";
            //水平对齐方式
            range.HorizontalAlignment = XlHAlign.xlHAlignCenter;
        }
        #endregion
       
        #region 保存excel
        public void saveExcel() {
            _app.DisplayAlerts = false;
            _app.AlertBeforeOverwriting = false;
            //保存工作簿
            _wB.SaveAs(_xlsFilePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            _wB.Close(true, _xlsFilePath, Type.Missing);
            //退出excel
            _app.Quit();
            //释放资源
        }
        #endregion
      
    }
}
