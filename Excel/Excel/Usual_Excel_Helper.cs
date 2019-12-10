using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Interop.Excel;
using System.Windows.Forms;
using Tools;
using System.Net.Sockets;
namespace Excel
{
    /// <summary>
    ///
    /// </summary>
    public class Usual_Excel_Helper
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

        private Worksheet _wS;
        private string _excelName;
        private System.Windows.Forms.Label _lblPrompt;
        private ProgressBar _pb;

        private int _rowMaxCount;
        private int _colMaxCount;

        /*
        ActiveCell.FormulaR1C1 = "=SUM(RC[-4]:RC[-3])"
            */

        public string ExcelName
        {
            get
            {
                return _excelName;
            }

            set
            {
                _excelName = value;
            }
        }

        public int RowMaxCount
        {
            get
            {
                return _rowMaxCount;
            }

            set
            {
                _rowMaxCount = value;
            }
        }

        public int ColMaxCount
        {
            get
            {
                return _colMaxCount;
            }

            set
            {
                _colMaxCount = value;
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

        public Usual_Excel_Helper(Worksheet wS) {
            this.WS = wS;
            initWS();
        }

       public Usual_Excel_Helper(Worksheet wS, System.Windows.Forms.Label lblPrompt, ProgressBar pb)
        {
            this.WS = wS;
            this._lblPrompt = lblPrompt;
            this._pb = pb;
        }
        private string getXlsName() {
            return ((Workbook)(WS.Parent)).Name;
        }
        public void insertAboveTheSpecificRow(int rowIndex) {
            Range range = (Range)WS.Rows[rowIndex, Type.Missing];
            range.Insert(XlInsertShiftDirection.xlShiftDown, Type.Missing);
        }
        #region 合并某行中的几列
        /// <summary>
        /// 
        /// </summary>
        /// <param name="startCellIndicate">起始单元格标示</param>
        /// <param name="endCellIndicate"></param>
        /// <param name="rowNum"></param>
        public void merge(string startCellIndicate,string endCellIndicate) {
            Range range = WS.Range[startCellIndicate, endCellIndicate];
            range.HorizontalAlignment = XlHAlign.xlHAlignCenter;
            range.WrapText = false;
            range.Orientation = 0;
            range.AddIndent = false;
            range.IndentLevel = 0;
            range.ShrinkToFit = false;
            //range.ReadingOrder = xlContext;
            range.MergeCells = false;
            range.Merge();
        }
        /// <summary>
        /// 暂时请勿删除。
        /// </summary>
        /// <param name="v"></param>
        /// <returns></returns>
        public static Dictionary<int, string> getSheetNameList(string v)
        {
            throw new NotImplementedException();
        }
        #endregion
        #region 设置某个范围为文本格式。
        public void ChangeFormatToText(Range range){
            range.NumberFormatLocal = "@";
        }
        #endregion
        #region 标题合并。
        /// <summary>
        /// 标题合并
        /// </summary>
        /// <param name="rowNum">第几行</param>
        public void caption_Merge(int rowNum) {
            int colMaxCount = WS.UsedRange.Columns.Count;
            Range range = WS.Range[WS.Cells[rowNum,1],WS.Cells[rowNum,colMaxCount]];
            range.HorizontalAlignment = XlHAlign.xlHAlignCenter;
            range.WrapText = false;
            range.Orientation = 0;
            range.AddIndent = false;
            range.IndentLevel = 0;
            range.ShrinkToFit = false;
            //range.ReadingOrder = xlContext;
            range.MergeCells = false;
            range.Merge();
        }
        #endregion
        #region  这个方法提供：　可以获取文件名中的月份，返回一个年月的字符串
        public static DateTime getImportDate(string excelName)
        {
            string result = String.Empty;
            int year = DateTime.Now.Year;
            //声明一个当前日期.
            DateTime dtCurrentDate = DateTime.Now.Date;
            int month = getMonth(excelName);
            //上一年
            DateTime dtLastYear = new DateTime(year - 1, month, 1);
            //当年当月
            DateTime dtCurrentYear = new DateTime(year, month, 1);
            TimeSpan tsLastYear = (dtCurrentDate - dtLastYear);
            TimeSpan tsCurrentYear = (dtCurrentDate - dtCurrentYear);
            int days1 = Math.Abs((Int32)tsLastYear.TotalDays);
            int days2 = Math.Abs((int)tsCurrentYear.TotalDays);
            if (days2 > days1)
            {
                //该月份接近于去年。
                year = year - 1;
                return new DateTime(year, month, 1);
            }
            //接近于今年
            return new DateTime(year, month, 1);
        }
        #endregion
        public static int getMonth(string excelName)
        {
            if (!excelName.Contains("月"))
            {
                return 0;
            }
            //获取月的索引
            int index = excelName.IndexOf("月");
            if (index == 0) return 0;
            int startIndex = index - 2;
            //月份: 10,11,12
            string temp = excelName.Substring(startIndex, 1);
            int i = 0;
            //若是整数。
            if (Int32.TryParse(temp, out i))
            {
                //若是整数。
                int j = 0;
                string temp1 = excelName.Substring(startIndex + 1, 1);
                if (Int32.TryParse(temp1, out j))
                {
                    return i + j;
                }
            }
            //月份<10.
            int k = 0;
            string temp2 = excelName.Substring(startIndex + 1, 1);
            if (Int32.TryParse(temp2, out k))
            {
                return k;
            }
            return 0;
        }
        #region  这个方法提供：　可以获取文件名中的月份
        /// <summary>
        /// 这个方法提供：　可以获取文件名中的月份
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string getMonthFromStr(string str)
        {
            if (!str.Contains("月"))
            {
                return "";
            }
            //获取月的索引
            int index = str.IndexOf("月");
            if (index == 0) return "";
            int startIndex = index - 2;

            string temp = str.Substring(startIndex, 1);
            int i = 0;
            //若是整数。
            if (Int32.TryParse(temp, out i))
            {
                //若是整数。
                int j = 0;
                string temp1 = str.Substring(startIndex + 1, 1);
                if (Int32.TryParse(temp1, out j))
                {
                    return i.ToString() + j.ToString();
                }
            }
            //若是整数。
            int k = 0;
            string temp2 = str.Substring(startIndex + 1, 1);
            if (Int32.TryParse(temp2, out k))
            {
                return k.ToString();
            }
            return "";
        }
        #endregion
        #region 获取某个excel路径中,Excel的名称。
        /// <summary>
        /// 获取某个excel路径中,Excel的名称。  将其迁移到AppHelper中.
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string getExcelName(string str)
        {
            string result = string.Empty;
            //判断后缀名是否含有xls.
            if (!str.Contains(".xls"))
                return "";
            //获取 \的索引
            int index = str.LastIndexOf("\\");
            if (index < 0)
            {
                return "";
            }
            result = str.Substring(index + 1, str.Length - (index + 1));
            result = result.Remove(result.LastIndexOf('.'));
            return result;
        }
        #endregion
      
        #region  依据sheetName获得 SheetIndex
        /// <summary>
        /// 返回０，表示没有找到。
        /// </summary>
        /// <param name="wBook"></param>
        /// <param name="sheetName"></param>
        /// <returns></returns>
        public static int getSheetIndexByName(Workbook wBook, string sheetName)
        {
            int count = wBook.Sheets.Count;
            Worksheet sheet = null;
            for (int i = 1; i <= count; i++)
            {
                sheet = (Worksheet)wBook.Sheets[i];
                if (sheet.Visible == XlSheetVisibility.xlSheetVisible)
                {
                    if (sheetName.Equals(sheet.Name)) return i;
                }
            }
            return 0;
        }
        #endregion
        /// <summary>
        /// 判断某个文件是否有 指定的内容！
        /// </summary>
        /// <param name="xlsFilePath"></param>
        /// <param name="sheetIndex"></param>
        /// <param name="specificContent"></param>
        /// <returns></returns>
        public static bool IfContainsSpecificContent(string xlsFilePath, int sheetIndex, string specificContent)
        {
            bool result = false;
            //在前9行9列里，检查有没有：  工序时间，单序时间 字样。
            int rowsMaxCount = 1000;
            int columnsMaxCount = 1000;
            Microsoft.Office.Interop.Excel.ApplicationClass app = new Microsoft.Office.Interop.Excel.ApplicationClass();
            app.Visible = false;
            Microsoft.Office.Interop.Excel.Workbook wBook = null;
            try
            {
                wBook = app.Workbooks.Open(xlsFilePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                if (wBook != null)
                {
                    wBook.Close(true, xlsFilePath, Type.Missing);
                }
                //退出excel
                app.Quit();
                //释放资源
                if (wBook != null) System.Runtime.InteropServices.Marshal.ReleaseComObject(wBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(app);
                //调用GC的垃圾回收方法
                GC.Collect();
                GC.WaitForPendingFinalizers();
                return result;
            }
            Microsoft.Office.Interop.Excel.Worksheet wSheet = (Microsoft.Office.Interop.Excel.Worksheet)wBook.Sheets.Item[sheetIndex];
            //最大行数
            Range usedRowsRange = wSheet.UsedRange.Rows;
            Range usedColsRange = wSheet.UsedRange.Columns;
            rowsMaxCount = usedRowsRange.Count;
            //最大列数
            columnsMaxCount = usedColsRange.Count;
            bool flag = false;
            for (int rowIndex = 1; rowIndex <= rowsMaxCount; rowIndex++)
            {
                if (flag) break;
                for (int colIndex = 1; colIndex <= columnsMaxCount; colIndex++)
                {
                    string cellContent = ((Microsoft.Office.Interop.Excel.Range)wSheet.Cells[rowIndex, colIndex]).Text.ToString().Trim();
                    if (cellContent != "" && specificContent.Equals(cellContent))
                    {
                        result = true;
                        //跳出循环。
                        flag = true;
                        break;
                    }
                }
            }
            wBook.Close(true, xlsFilePath, Type.Missing);
            //退出excel
            app.Quit();
            //释放资源
            System.Runtime.InteropServices.Marshal.ReleaseComObject(usedRowsRange);
            System.Runtime.InteropServices.Marshal.ReleaseComObject(usedColsRange);
            System.Runtime.InteropServices.Marshal.ReleaseComObject(wSheet);
            System.Runtime.InteropServices.Marshal.ReleaseComObject(wBook);
            System.Runtime.InteropServices.Marshal.ReleaseComObject(app);
            //调用GC的垃圾回收方法
            GC.Collect();
            GC.WaitForPendingFinalizers();
            return result;
        }
        /// <summary>
        /// 获取匹配上的Sheet信息。
        /// </summary>
        /// <param name="dic"></param>
        /// <returns></returns>
        public static string getMatchedSheetInfo(Dictionary<int, string> dic)
        {
            string temp = String.Empty;
            foreach (KeyValuePair<int, string> o in dic)
            {
                temp += temp + "\r\n" + o.Value;
            }
            return temp.Remove(0, 2);
        }
        /// <summary>
        /// 获取某个sheet中 
        /// </summary>
        /// <param name="wSheet"></param>
        /// <param name="searchStr"></param>
        /// <returns></returns>
        public static int getStartRowIndex(Microsoft.Office.Interop.Excel.Range range, string searchStr)
        {
            int startRowIndex = 0;
            //最大行数
            int rowsMaxCount = range.Rows.Count;
            //最大列数
            int columnsMaxCount = range.Columns.Count;
            #region  获取单价横坐标。
            bool flag = false;
            for (int rowIndex = 1; rowIndex <= rowsMaxCount; rowIndex++)
            {
                if (flag) break;
                for (int colIndex = 1; colIndex <= columnsMaxCount; colIndex++)
                {
                    string cellContent = ((Microsoft.Office.Interop.Excel.Range)range[rowIndex, colIndex]).Text.ToString().Trim();
                    if (cellContent != "" && searchStr.Equals(cellContent))
                    {
                        //跳出循环。
                        startRowIndex = rowIndex;
                        flag = true;
                        break;
                    }
                }
            }
            System.Runtime.InteropServices.Marshal.ReleaseComObject(range.Rows);
            System.Runtime.InteropServices.Marshal.ReleaseComObject(range.Columns);
            return startRowIndex;
            #endregion
        }
        /// <summary>
        ///  通过字母获取列的索引,只允许传入两位26个英文字母.
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        public static int getColIndexByStr(string c)
        {
            int result = 0;
            if (c.Length > 2) return 0;
            Char[] charArray = c.ToCharArray();
            char cTemp;
            int resultTemp;
            if (c.Length ==1) {

                cTemp = c.ToCharArray()[0];
                resultTemp = (Int32)(cTemp) - 64;
                if (resultTemp < 1 || resultTemp > 26)
                {
                    MessageBox.Show("请键入英文字符!", "提示:", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return 0;
                }
                return resultTemp;
            }
                cTemp = Char.ToUpper(charArray[0]);
                resultTemp = (Int32)(cTemp) - 64;
                if (resultTemp < 1 || resultTemp > 26)
                {
                    MessageBox.Show("请键入英文字符!", "提示:", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return 0;
                }
                result = resultTemp * 26;
                cTemp = Char.ToUpper(charArray[1]);
                resultTemp = (Int32)(cTemp) - 64;
                if (resultTemp < 1 || resultTemp > 26)
                {
                    MessageBox.Show("请键入英文字符!", "提示:", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return 0;
                }
                result += resultTemp;
                return result;
        }
        //
        /// <summary>
        /// 获取某单元格的值，A1-AZ1;
        /// </summary>
        /// <param name="cellIndicate"></param>
        /// <returns></returns>
        public  string getSpecificCellValue(string cellIndicate)
        {
            string result = String.Empty;
            if (!CheckPattern.checkExcelCellIndicate(cellIndicate)) return result;
            //判断是否为A1形式
            char[] charArray = cellIndicate.ToCharArray();
            int rowIndex = 0;
            int colIndex = 0;
            //第二位为数字。
            if ((charArray[1] >= 49 && charArray[1] <= 57))
            {

                int.TryParse(cellIndicate.Substring(1), out rowIndex);
                colIndex = (int)charArray[0] - 64;
                return ((Range)WS.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace("\r", "").Replace("\n", "").Replace(" ", "");
            }
            //第二个字符为字母。
            int.TryParse(cellIndicate.Substring(2), out rowIndex);
            colIndex = ((int)charArray[0] - 64) * 26 + (int)charArray[1] - 64;
            return ((Range)WS.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace("\r", "").Replace("\n", "").Replace(" ", "");
        }
      /// <summary>
      /// 如A1,AA1
      /// </summary>
      /// <param name="cellIndicate"></param>
      /// <param name="specificContent"></param>
      /// <param name="size"> 字体大小</param>
      /// <returns></returns>
        public bool setSpecificCellValue(string cellIndicate, string specificContent,int size = 11,bool isBold = false)
        {
            string result = String.Empty;
            if (!CheckPattern.checkExcelCellIndicate(cellIndicate))
                return false;
            //判断是否为A1形式
            char[] charArray = cellIndicate.ToCharArray();
            int rowIndex = 0;
            int colIndex = 0;
            Range range = null;
            //第二位为数字。
            if ((charArray[1] >= 49 && charArray[1] <= 57))
            {

                int.TryParse(cellIndicate.Substring(1), out rowIndex);
                colIndex = (int)charArray[0] - 64;
                WS.Cells[rowIndex, colIndex] = specificContent;
                range = WS.Range[WS.Cells[rowIndex, colIndex], WS.Cells[rowIndex, colIndex]];
                range.Font.Size = size;
                range.Font.Bold = isBold;
                return true;
            }
            //第二个字符为字母。
            int.TryParse(cellIndicate.Substring(2), out rowIndex);
            colIndex = ((int)charArray[0] - 64) * 26 + (int)charArray[1] - 64;
            WS.Cells[rowIndex, colIndex] = specificContent;
            range = WS.Range[WS.Cells[rowIndex, colIndex], WS.Cells[rowIndex, colIndex]];
            range.Font.Size = size;
            range.Font.Bold = isBold;
            return true;
        }
            /// <summary>
        /// 在某行某列 写入数据。
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="colIndex"></param>
        /// <param name="specificContent"></param>
        public void setSpecificCellValue(int rowIndex,int colIndex, string specificContent,int size = 11, bool isBold = false)
        {
            WS.Cells[rowIndex, colIndex] = specificContent;
            Range range = WS.Range[WS.Cells[rowIndex, colIndex], WS.Cells[rowIndex, colIndex]];
            range.Font.Bold = isBold;
            range.Font.Size = size;
        }
        #region 判断在所有已知单元格是否有 某个指定的字符串.
        public static bool ifExistsSpecificStr(Worksheet ws, string specificStr)
        {
            specificStr = specificStr.Replace(" ", "");
            int rowMaxCount = ws.UsedRange.Rows.Count;
            int colMaxCount = ws.UsedRange.Columns.Count;
            for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
            {
                for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                {
                    string cellContent = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace(" ", "");
                    if (cellContent != "" && cellContent.Contains(specificStr)) 
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        #endregion
        #region 判断在所有已知单元格是否有 某个指定的字符串.
        public static bool ifExistsSpecificStr(Worksheet ws, string[] specificStrArray,System.Windows.Forms.Label lblPrompt,ProgressBar pb)
        {
            int length = specificStrArray.Length;
            string specificStr = string.Empty;

            int rowMaxCount = ws.UsedRange.Rows.Count;
            int colMaxCount = ws.UsedRange.Columns.Count;
            int count = 0;
            pb.Visible = true;
            pb.Value = 0;
            pb.Maximum = rowMaxCount * colMaxCount;
            lblPrompt.Visible = true;
            //处理当前在消息队列中的所有Windows消息。
            System.Windows.Forms.Application.DoEvents();
            lblPrompt.Text = ws.Index + " " + ws.Name + "　分析中...";
            for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
            {
                for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                {
                    string cellContent = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace(" ", "");

                    for (int i = 0; i <= specificStrArray.Length - 1; i++)
                    {
                        specificStr = specificStrArray[i].Replace(" ", "");
                        if (cellContent != "" && cellContent.Contains(specificStr))
                        {
                            count++;
                        }
                    }
                    pb.Value++;
                    if (count == length) {
                        pb.Value = 0;
                        pb.Visible = false;
                        lblPrompt.Text += " 分析中...";
                        lblPrompt.Visible = false; ;
                        return true;
                    }
                }
            }
            pb.Value = 0;
            pb.Visible = false;
            lblPrompt.Text = "";
            lblPrompt.Visible = false;
            return false;
        }
        #endregion
     
        #region 判断在所有已知单元格是否有 某个指定的字符串.
        public static bool ifExistsSpecificStr(Worksheet ws, string specificStr,System.Windows.Forms.Label lblPrompt,ProgressBar pb)
        {
            specificStr = specificStr.Replace(" ", "");
            lblPrompt.Visible = true;
            lblPrompt.Text = ws.Index + ". " + ws.Name + "正在分析...";
            int rowMaxCount = ws.UsedRange.Rows.Count;
            int colMaxCount = ws.UsedRange.Columns.Count;
            pb.Visible = true;
            pb.Maximum = rowMaxCount * colMaxCount;
            pb.Value = 0;
            for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
            {
                for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                {
                    string cellContent = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace(" ", "");
                    if (cellContent != "" && cellContent.Contains(specificStr))
                    {
                        lblPrompt.Visible = false;
                        pb.Visible = false;
                        return true;
                    }
                    pb.Value++;
                }
            }
            lblPrompt.Visible = false;
            pb.Visible = false;
            return false;
        }
        #endregion
        #region 判断在所有已知单元格是否有 某个指定的字符串.
        public static bool ifExistsSpecificStr(Worksheet ws, string specificStr, System.Windows.Forms.Label lblPrompt, ProgressBar pb,bool rowAsc,bool colAsc)
        {
            specificStr = specificStr.Replace(" ", "");
            lblPrompt.Visible = true;
            lblPrompt.Text = ws.Index + ". " + ws.Name + "正在分析...";
            int rowMaxCount = ws.UsedRange.Rows.Count;
            int colMaxCount = ws.UsedRange.Columns.Count;
            pb.Visible = true;
            pb.Maximum = rowMaxCount * colMaxCount;
            pb.Value = 0;
            if (rowAsc && colAsc)
            {
                for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
                {
                    for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                    {
                        string cellContent = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace(" ", "");
                        if (cellContent != "" && cellContent.Contains(specificStr))
                        {
                            lblPrompt.Visible = false;
                            pb.Visible = false;
                            return true;
                        }
                        pb.Value++;
                    }
                }
            }
            else if (!rowAsc && colAsc)
            {
                for (int rowIndex = rowMaxCount; rowIndex >= 1; rowIndex--)
                {
                    for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                    {
                        string cellContent = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace(" ", "");
                        if (cellContent != "" && cellContent.Contains(specificStr))
                        {
                            lblPrompt.Visible = false;
                            pb.Visible = false;
                            return true;
                        }
                        pb.Value++;
                    }
                }
            }
            else if (rowAsc && !colAsc)
            {
                for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
                {
                    for (int colIndex = colMaxCount; colIndex >=1; colIndex--)
                    {
                        string cellContent = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace(" ", "");
                        if (cellContent != "" && cellContent.Contains(specificStr))
                        {
                            lblPrompt.Visible = false;
                            pb.Visible = false;
                            return true;
                        }
                        pb.Value++;
                    }
                }
            }
            else {
                for (int rowIndex = rowMaxCount; rowIndex >=1; rowIndex--)
                {
                    for (int colIndex = colMaxCount; colIndex >=1; colIndex--)
                    {
                        string cellContent = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace(" ", "");
                        if (cellContent != "" && cellContent.Contains(specificStr))
                        {
                            lblPrompt.Visible = false;
                            pb.Visible = false;
                            return true;
                        }
                        pb.Value++;
                    }
                }
            }
            lblPrompt.Visible = false;
            pb.Visible = false;
            return false;
        }
        #endregion
        #region 判断在所有已知单元格是否有 某个指定的字符串.
        public static bool ifExistsSpecificStr(Worksheet ws, string specificStr,  bool rowAsc, bool colAsc)
        {
            specificStr = specificStr.Replace(" ", "");
            int rowMaxCount = ws.UsedRange.Rows.Count;
            int colMaxCount = ws.UsedRange.Columns.Count;
           if (rowAsc && colAsc)
            {
                for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
                {
                    for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                    {
                        string cellContent = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace(" ", "");
                        if (cellContent != "" && cellContent.Contains(specificStr))
                        {
                            return true;
                        }
                   }
                }
            }
            else if (!rowAsc && colAsc)
            {
                for (int rowIndex = rowMaxCount; rowIndex >= 1; rowIndex--)
                {
                    for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                    {
                        string cellContent = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace(" ", "");
                        if (cellContent != "" && cellContent.Contains(specificStr))
                        {
                            return true;
                        }
                    }
                }
            }
            else if (rowAsc && !colAsc)
            {
                for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
                {
                    for (int colIndex = colMaxCount; colIndex >= 1; colIndex--)
                    {
                        string cellContent = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace(" ", "");
                        if (cellContent != "" && cellContent.Contains(specificStr))
                        {
                            return true;
                        }
                    }
                }
            }
            else
            {
                for (int rowIndex = rowMaxCount; rowIndex >= 1; rowIndex--)
                {
                    for (int colIndex = colMaxCount; colIndex >= 1; colIndex--)
                    {
                        string cellContent = ((Microsoft.Office.Interop.Excel.Range)ws.Cells[rowIndex, colIndex]).Text.ToString().Trim().Replace(" ", "");
                        if (cellContent != "" && cellContent.Contains(specificStr))
                        {
                            return true;
                        }
                    }
                }
            }
            return false;
        }
        #endregion
        #region 获取某内容的纵坐标。
        public static int getColIndexByContent(Worksheet wS, string specificContent)
        {
            int rowMaxCount = wS.UsedRange.Rows.Count;
            int colMaxCount = wS.UsedRange.Columns.Count;
            for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
            {
                for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                {
                    string cellContent = ((Microsoft.Office.Interop.Excel.Range)wS.Cells[rowIndex, colIndex]).Text.ToString().Trim();
                    if (cellContent != "" && specificContent.Equals(cellContent.Trim()))
                    {
                        return colIndex;
                    }
                }
            }
            return 0;
        }
        #endregion
        /// <summary>
        /// 获取 某行中  某内容 最后一次 出现时的 列索引.
        /// 从第三行，第5列开始。
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="searchContent"></param>
        /// <returns></returns>
        public int getLastColIndex(int rowIndex, string searchContent) {
            //查找某行中，某内容，最后的列索引。
            int colMaxIndex = WS.UsedRange.Columns.Count;
            Stack<int> colIndexStack = new Stack<int>();
            for (int colIndex=5;colIndex<=colMaxIndex;) {
                string content =WS.Range[WS.Cells[rowIndex, colIndex], WS.Cells[rowIndex, colIndex]].Text.ToString();
                if (searchContent.Equals(content)) {
                    colIndexStack.Push(colIndex);
                }
                colIndex = colIndex + 2;
            }
            return colIndexStack.Pop();
        }
        /// <summary>
        /// 返回搜索内容的横坐标。
        /// </summary>
        /// <param name="colIndex"></param>
        /// <param name="searchContent"></param>
        /// <returns></returns>
        public int getLastRowIndex(int colIndex, string searchContent)
        {
            //查找某行中，某内容，最后的列索引。
            int rowMaxIndex = WS.UsedRange.Rows.Count;
            Stack<int> rowIndexStack = new Stack<int>();
            for (int rowIndex = 1; rowIndex <= rowMaxIndex; rowIndex++)
            {
                string content = WS.Range[WS.Cells[rowIndex, colIndex], WS.Cells[rowIndex, colIndex]].Text.ToString();
                if (searchContent.Equals(content))
                {
                    rowIndexStack.Push(rowIndex);
                }
            }
            return rowIndexStack.Pop();
        }
        /// <summary>
        /// 获取某列的空白内容。
        /// </summary>
        /// <param name="colIndex"></param>
        /// <param name="searchContent"></param>
        /// <returns></returns>
        public int getTheRowIndexOfEmptyContent(int colIndex)
        {
            //查找某行中，某内容，最后的列索引。
            int rowMaxIndex = WS.UsedRange.Rows.Count;
            for (int rowIndex = 1; rowIndex <= rowMaxIndex; rowIndex++)
            {
                string content = WS.Range[WS.Cells[rowIndex, colIndex], WS.Cells[rowIndex, colIndex]].Text.ToString();
                if (!string.IsNullOrEmpty(content)) continue;
                return rowIndex;
            }
            return 0;
        }
        #region 获取某内容的纵坐标。
        public  int getColIndexByContent(string specificContent)
        {
            int rowMaxCount = this.WS.UsedRange.Rows.Count;
            int colMaxCount = WS.UsedRange.Columns.Count;
            for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
            {
                for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                {
                    string cellContent = ((Microsoft.Office.Interop.Excel.Range)WS.Cells[rowIndex, colIndex]).Text.ToString().Trim();
                    if (cellContent != "" && specificContent.Equals(cellContent.Trim()))
                    {
                        return colIndex;
                    }
                }
            }
            return 0;
        }
        #endregion
        /// <summary>
        /// 在 指定行,从 起始列  到  终止列,搜索 某字符串,返回第一次出现时的 索引 .
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="startColIndex"></param>
        /// <param name="endColIndex"></param>
        /// <param name="specificContent"></param>
        /// <returns></returns>
        public int getColIndexOfSpecificContentInSpecificRow(int rowIndex,int startColIndex,int endColIndex,string specificContent) {
            for (int colIndex = startColIndex; colIndex <= endColIndex; colIndex++)
            {
                 string cellContent = ((Microsoft.Office.Interop.Excel.Range)WS.Cells[rowIndex, colIndex]).Text.ToString().Trim();
                 if (cellContent != "" && specificContent.Equals(cellContent.Trim()))
                    {
                        return colIndex;
                    }
                }
              return 0;
        }
        /// <summary>
        /// 在指定列获取  某指定字符 所在 的行号.
        /// </summary>
        /// <param name="colIndex"></param>
        /// <param name="startRowIndex"></param>
        /// <param name="endRowIndex"></param>
        /// <param name="specificContent"></param>
        /// <returns></returns>
        public int getRowIndexOfSpecificContentInSpecificCol(int colIndex, int startRowIndex, int endRowIndex, string specificContent)
        {
            for (int rowIndex = startRowIndex; rowIndex <= endRowIndex; rowIndex++)
            {
                string cellContent = ((Microsoft.Office.Interop.Excel.Range)WS.Cells[rowIndex, colIndex]).Text.ToString().Trim();
                if (cellContent != "" && specificContent.Equals(cellContent.Trim()))
                {
                    return rowIndex;
                }
            }
            return 0;
        }
        #region 获取某内容的横坐标.
        public static int getRowIndexByContent(Worksheet wS, string specificContent)
        {
            int rowMaxCount = wS.UsedRange.Rows.Count;
            int colMaxCount = wS.UsedRange.Columns.Count;
            for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
            {
                for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                {
                    string cellContent = ((Microsoft.Office.Interop.Excel.Range)wS.Cells[rowIndex, colIndex]).Text.ToString().Trim();
                    if (cellContent != "" && specificContent.Equals(cellContent.Trim()))
                    {
                        return rowIndex;
                    }
                }
            }
            return 0;
        }
        #endregion
        #region 获取某内容的横坐标.
        public  int getRowIndexByContent( string specificContent)
        {
            int rowMaxCount = WS.UsedRange.Rows.Count;
            int colMaxCount = WS.UsedRange.Columns.Count;
            for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
            {
                for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                {
                    string cellContent = ((Microsoft.Office.Interop.Excel.Range)WS.Cells[rowIndex, colIndex]).Text.ToString().Trim();
                    if (cellContent != "" && specificContent.Equals(cellContent.Trim()))
                    {
                        return rowIndex;
                    }
                }
            }
            return 0;
        }
        #endregion
        #region 获取某内容的横坐标.
        public int getRowIndexWhichContainContent(string specificContent)
        {
            int rowMaxCount = WS.UsedRange.Rows.Count;
            int colMaxCount = WS.UsedRange.Columns.Count;
            for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
            {
                for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                {
                    string cellContent = ((Microsoft.Office.Interop.Excel.Range)WS.Cells[rowIndex, colIndex]).Text.ToString().Trim();
                    if (cellContent != "" && cellContent.Contains(specificContent))
                    {
                        return rowIndex;
                    }
                }
            }
            return 0;
        }
        #endregion
        #region 获取表格中包含某内容的行索引。
        public HashSet<int> getRowIndexArrayWhichContainContent(string specificContent)
        {
            HashSet<int> hSetRowIndex = new HashSet<int>();
            int rowMaxCount = WS.UsedRange.Rows.Count;
            int colMaxCount = WS.UsedRange.Columns.Count;
            for (int rowIndex = 1; rowIndex <= rowMaxCount; rowIndex++)
            {
                for (int colIndex = 1; colIndex <= colMaxCount; colIndex++)
                {
                    string cellContent = ((Microsoft.Office.Interop.Excel.Range)WS.Cells[rowIndex, colIndex]).Text.ToString().Trim();
                    if (cellContent != "" && cellContent.Contains(specificContent))
                    {
                        hSetRowIndex.Add(rowIndex);
                    }
                }
            }
            return hSetRowIndex;
        }
        #endregion
        #region 获取某内容的横坐标.
        public int[] getRowIndexArrayWhichContainContent_New(string specificContent)
        {
            List<int> rowIndexList = new List<int>();
            for (int rowIndex = 1; rowIndex <= _rowMaxCount; rowIndex++)
            {
                for (int colIndex = 1; colIndex <= _colMaxCount; colIndex++)
                {
                    string cellContent = ((Microsoft.Office.Interop.Excel.Range)WS.Cells[rowIndex, colIndex]).Text.ToString().Trim();
                    if (cellContent != "" && cellContent.Contains(specificContent))
                    {
                        rowIndexList.Add(rowIndex);
                    }
                }
            }
            return rowIndexList.ToArray<int>();
        }
        #endregion
        #region 依据列数，返回列的标示如  第3列，返回C;
        /// <summary>
        /// 这是一个没有完成的方法！
        /// </summary>
        /// <param name="colIndex"></param>
        /// <returns></returns>
        public static string getColIndicateByIndex(int colIndex)
        {
            string tempStr = String.Empty;
            if (colIndex > 676)
            {
                return "";
            }
            int quotient = colIndex / 26;
            int remainder = colIndex % 26;
            char c1;
            char c2;
            c1 = (char)(quotient + 65);
            c2 = (char)(remainder + 65 - 1);
            if (quotient == 0)
            {
                tempStr = c2.ToString();
                return tempStr;
            }
            tempStr = c1.ToString() + c2.ToString();
            return tempStr;
        }
        #endregion
        #region 写标题字段。
        /// <summary>
        /// 标题字段以"|"间隔。
        /// </summary>
        /// <param name="Caption"></param>
        /// <param name="rowNum"></param>
        public  void WriteCaptionField( string Caption, int rowNum)
        {
            string[] strArray = Caption.Split('|');
            for (int i = 1; i <= strArray.Length; i++)
            {
                string cellIndicateStr = getColIndicateByIndex(i) + rowNum.ToString();
                setSpecificCellValue(cellIndicateStr, strArray[i - 1].ToString());
            }
        }
        #endregion
        #region 写标题字段。从某单元格开始。
        /// <summary>
        /// 标题字段以"|"间隔。
        /// </summary>
        /// <param name="startCellIndicate">从某指定字段开始</param>
        /// <param name="Caption"></param>
        public void WriteCaptionFieldFromSpecificCellIndicate(string startCellIndicate,string Caption)
        {
            int colIndex = getColIndex(startCellIndicate);
            int rowIndex = getRowIndex(startCellIndicate);
            string[] strArray = Caption.Split('|');
           
            for (int i = 0; i <= strArray.Length-1; i++)
            {
                WS.Cells[rowIndex, colIndex + i] = strArray[i];
            }
        }
        #region 写标题字段。从某单元格开始。
        /// <summary>
        /// 标题字段以"|"间隔。
        /// </summary>
        /// <param name="startCellIndicate">列的最大索引+1，开始书写。并返回起始列索引。</param>
        /// <param name="Caption"></param>
        public void WriteCaptionFieldFromSpecificRowIdex(int rowIndex, string Caption,out int startColIndex)
        {
            int colIndex = WS.UsedRange.Columns.Count;
            startColIndex = colIndex + 1;
            string[] strArray = Caption.Split('|');
            for (int i = 0; i <= strArray.Length-1; i++)
            {
                WS.Cells[rowIndex, startColIndex +i] = strArray[i];
            }
        }
        #endregion
        /// <summary>
        /// 获取列索引。
        /// </summary>
        /// <param name="cellIndicate"></param>
        /// <returns></returns>
        private int getColIndex(string cellIndicate)
        {
            if (!CheckPattern.checkExcelCellIndicate(cellIndicate))
            {
                MessageBox.Show(cellIndicate + ": 不是单元格标示!", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return 0;
            }
            char[] charArray = cellIndicate.ToCharArray();
            string Alphabetic_Str = string.Empty;
            int n = 0;
            bool isNum = false;
            int indexOfStartInteger;
            for (indexOfStartInteger = 0; indexOfStartInteger <= charArray.Length - 1; indexOfStartInteger++)
            {
                isNum = int.TryParse(charArray[indexOfStartInteger].ToString(), out n);
                if (isNum)
                {
                    break;
                }
            }
            Alphabetic_Str = cellIndicate.Substring(0, indexOfStartInteger);
            return getColIndexByStr(Alphabetic_Str);
        }
        /// <summary>
        /// 获取行索引。
        /// </summary>
        /// <param name="cellIndicate"></param>
        /// <returns></returns>
        private int getRowIndex(string cellIndicate)
        {
            if (!CheckPattern.checkExcelCellIndicate(cellIndicate)) {
                MessageBox.Show(cellIndicate + ": 不是单元格标示!","提示：",MessageBoxButtons.OK,MessageBoxIcon.Information);
                return 0;
            }
            char[] charArray = cellIndicate.ToCharArray();
            int n = 0;
            bool isNum = false;
            int indexOfStartInteger;
            for (indexOfStartInteger = 0; indexOfStartInteger <= charArray.Length-1; indexOfStartInteger++) {
                isNum = int.TryParse(charArray[indexOfStartInteger].ToString(), out n);
                if (isNum) {
                    break;
                }
            }
            return int.Parse(cellIndicate.Substring(indexOfStartInteger));
        }
        #endregion
        #region 复制某个Range到另一个Range中.
        public void copySrcToDest(string srcStartCellIndicate,string srcEndCellIndicate,string descStartCellIndicate,string descEndCellIndicate) {
            //先判断是否为Excel单元格的标示：
            if (!CheckPattern.checkExcelCellIndicate(srcStartCellIndicate)) {
                MessageBox.Show("起始标示不符合单元格标示", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (!CheckPattern.checkExcelCellIndicate(descStartCellIndicate)) {
                MessageBox.Show("结束标示不符合单元格标示", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            //1.需从单元格标示： A2中区分出字母或者数字。
            char[] srcStartCharArray = srcStartCellIndicate.ToCharArray();
            char[] srcEndCharArray = srcEndCellIndicate.ToCharArray();
            int startRowNum = 0;
            int startColNum = 0;
            int endRowNum = 0;
            int endColNum = 0;
            int n = 0;
            char cTemp;
            bool isNum;
            int index = 0;
            for (index = 0; index <= srcStartCharArray.Length-1; index++) {
                cTemp = srcStartCharArray[index];
                isNum = int.TryParse(cTemp.ToString(), out n);
                if (isNum) break;
            }

            startColNum = getColIndexByStr(srcStartCellIndicate.Substring(0, index));
            startRowNum = int.Parse(srcStartCellIndicate.Substring(index));

            for (index = 0; index <= srcEndCharArray.Length - 1; index++)
            {
                cTemp = srcEndCharArray[index];
                isNum = int.TryParse(cTemp.ToString(), out n);
                if (isNum) break;
            }

            endColNum = getColIndexByStr(srcEndCellIndicate.Substring(0, index));
            endRowNum = int.Parse(srcEndCellIndicate.Substring(index));

            Range srcRange = WS.Range[WS.Cells[startRowNum, startColNum], WS.Cells[endRowNum, endColNum]];

            char[] descStartCharArray = descStartCellIndicate.ToCharArray();
            char[] descEndCharArray = descEndCellIndicate.ToCharArray();
          
            for (index = 0; index <= descStartCharArray.Length - 1; index++)
            {
                cTemp = descStartCharArray[index];
                isNum = int.TryParse(cTemp.ToString(), out n);
                if (isNum) break;
            }

            startColNum = getColIndexByStr(descStartCellIndicate.Substring(0, index));
            startRowNum = int.Parse(descStartCellIndicate.Substring(index));

            for (index = 0; index <= descEndCharArray.Length - 1; index++)
            {
                cTemp = descEndCharArray[index];
                isNum = int.TryParse(cTemp.ToString(), out n);
                if (isNum) break;
            }

            endColNum = getColIndexByStr(descEndCellIndicate.Substring(0, index));
            endRowNum = int.Parse(descEndCellIndicate.Substring(index));

            Range descRange = WS.Range[WS.Cells[startRowNum, startColNum], WS.Cells[endRowNum, endColNum]];

            srcRange.Cells.Copy();
            descRange.PasteSpecial();
        }
        #endregion
        #region 返回某个范围
        public Range getRange(string startCellIndicate, string endCellIndicate) {
            Range rangeResult;
            //先判断是否为Excel单元格的标示：
            if (!CheckPattern.checkExcelCellIndicate(startCellIndicate))
            {
                MessageBox.Show("起始标示不符合单元格标示", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return null;
            }
            if (!CheckPattern.checkExcelCellIndicate(endCellIndicate))
            {
                MessageBox.Show("结束标示不符合单元格标示", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return null;
            }
            //1.需从单元格标示： A2中区分出字母或者数字。
            char[] startCharArray = startCellIndicate.ToCharArray();
            char[] endCharArray = endCellIndicate.ToCharArray();
            int startRowNum = 0;
            int startColNum = 0;
            int endRowNum = 0;
            int endColNum = 0;
            int n = 0;
            char cTemp;
            bool isNum;
            int index = 0;
            for (index = 0; index <= startCharArray.Length - 1; index++)
            {
                cTemp = startCharArray[index];
                isNum = int.TryParse(cTemp.ToString(), out n);
                if (isNum) break;
            }

            startColNum = getColIndexByStr(startCellIndicate.Substring(0, index));
            startRowNum = int.Parse(startCellIndicate.Substring(index));

            for (index = 0; index <= endCharArray.Length - 1; index++)
            {
                cTemp = endCharArray[index];
                isNum = int.TryParse(cTemp.ToString(), out n);
                if (isNum) break;
            }

            endColNum = getColIndexByStr(endCellIndicate.Substring(0, index));
            endRowNum = int.Parse(endCellIndicate.Substring(index));

            rangeResult = WS.Range[WS.Cells[startRowNum, startColNum], WS.Cells[endRowNum, endColNum]];
            return rangeResult;
        }
        #endregion
        /// <summary>
        /// 判断某个范围是否都是整数.
        /// </summary>
        /// <param name="range"></param>
        /// <returns></returns>
        public bool ifTheRangeIsInteger(Range range) {
            bool result = false;
            int i = 0;
            string tempStr = string.Empty;
            foreach( Range r in range)
            {
                tempStr = r.Text.ToString();
                if (string.IsNullOrEmpty(tempStr)){
                    continue;
                }
                result = int.TryParse(tempStr, out i);
                if (!result) return false;
            }
            return true;
        }

        /// <summary>
        /// 设置所有列的列宽
        /// </summary>
        /// <param name="columnWidth"></param>
        public void setAllColumnsWidth(decimal columnWidth) {
            WS.UsedRange.ColumnWidth = columnWidth;
        }
        /// <summary>
        /// 设置列宽
        /// </summary>
        /// <param name="cellIndicate"></param>
        /// <param name="columnWidth"></param>
        /// <returns></returns>
        public bool setColumnWidth(string columnIndicate, decimal columnWidth)
        {
            string result = String.Empty;
            if (!CheckPattern.checkColumnIndicate(columnIndicate))
                return false;
            //判断是否为A1形式
            char[] charArray = columnIndicate.ToCharArray();
            int rowIndex = 1;
            int colIndex = 0;
            Range range = null;
            //如果
            if (charArray.Length ==1)
            {
                colIndex = (int)charArray[0] - 64;
                range = WS.Range[WS.Cells[rowIndex, colIndex], WS.Cells[rowIndex, colIndex]];
                range.ColumnWidth = columnWidth;
                return true;
            }
            //第二个字符为字母。
            colIndex = ((int)charArray[0] - 64) * 26 + (int)charArray[1] - 64;
            range = WS.Range[WS.Cells[rowIndex, colIndex], WS.Cells[rowIndex, colIndex]];
           
            range.ColumnWidth = columnWidth;
            return true;
        }
        /// <summary>
        /// 设置列宽。
        /// </summary>
        /// <param name="columnIndex"></param>
        /// <param name="columnWidth"></param>
        /// <returns></returns>
        public bool setColumnWidthByColumnIndex(int columnIndex, decimal columnWidth)
        {
            Range range = null;
            range = WS.Range[WS.Cells[1, columnIndex], WS.Cells[1, columnIndex]];
            range.ColumnWidth = columnWidth;
            return true;
        }
        /// <summary>
        /// 设置行高。
        /// </summary>
        /// <param name="rowIndicate"></param>
        /// <param name="rowHeight"></param>
        /// <returns></returns>
        public bool setRowHeight(int rowIndex, decimal rowHeight) {
            Range range = WS.Range[WS.Cells[rowIndex, 1], WS.Cells[rowIndex, rowIndex]];
            range.RowHeight = rowHeight;
            return true;
        }
        public void setAllTheBoxLine()
        {
            Range range = WS.UsedRange;
            range.Borders.LineStyle = 1;
            range.Borders.Item[XlBordersIndex.xlEdgeLeft].LineStyle = XlLineStyle.xlContinuous;

            range.Borders.LineStyle = 1;
            range.Borders.Item[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous;

            range.Borders.LineStyle = 1;
            range.Borders.Item[XlBordersIndex.xlEdgeBottom].LineStyle = XlLineStyle.xlContinuous;

            range.Borders.LineStyle = 1;
            range.Borders.Item[XlBordersIndex.xlEdgeRight].LineStyle = XlLineStyle.xlContinuous;

            range.Borders.LineStyle = 1;
            range.Borders.Item[XlBordersIndex.xlInsideVertical].LineStyle = XlLineStyle.xlContinuous;

            range.Borders.LineStyle = 1;
            range.Borders.Item[XlBordersIndex.xlInsideHorizontal].LineStyle = XlLineStyle.xlContinuous;
        }
          /// <summary>
          /// 设置某个区域的边框线为实线
          /// </summary>
          /// <param name="range"></param>
        public void setAllTheBoxLine(Range range)
        {
            range.Borders.LineStyle = 1;
            range.Borders.Item[XlBordersIndex.xlEdgeLeft].LineStyle = XlLineStyle.xlContinuous;

            range.Borders.LineStyle = 1;
            range.Borders.Item[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous;

            range.Borders.LineStyle = 1;
            range.Borders.Item[XlBordersIndex.xlEdgeBottom].LineStyle = XlLineStyle.xlContinuous;

            range.Borders.LineStyle = 1;
            range.Borders.Item[XlBordersIndex.xlEdgeRight].LineStyle = XlLineStyle.xlContinuous;

            range.Borders.LineStyle = 1;
            range.Borders.Item[XlBordersIndex.xlInsideVertical].LineStyle = XlLineStyle.xlContinuous;

            range.Borders.LineStyle = 1;
            range.Borders.Item[XlBordersIndex.xlInsideHorizontal].LineStyle = XlLineStyle.xlContinuous;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="columnIndex"></param>
        public void MergeTheSpecificColumn(int columnIndex) {
            int rowIndex = 1;
            int rowMaxIndex = WS.UsedRange.Rows.Count;
            string content = getSpecificCellValue(((char)(64 + columnIndex)).ToString()+"1");
            int count = 1;  //同一列，连续单元格相同时的数目。
            int startRowIndexOfIdenticalCells = 1; //连续相同单元格的起始索引。
            int endRowIndexOfIdenticalCells = 0;        //连续相同单元格的终止索引。
            for (rowIndex =2;rowIndex<= rowMaxIndex;rowIndex ++) {
                string temp = getSpecificCellValue(((char)(64 + columnIndex)).ToString() + rowIndex);
                //
                if (content.Equals(temp))
                {
                    endRowIndexOfIdenticalCells = rowIndex;
                    count++;
                    //如果到最后一行。
                    if (rowIndex == rowMaxIndex) {
                        //开始合并。
                        merge(((char)(64 + columnIndex)).ToString() + startRowIndexOfIdenticalCells, ((char)(64 + columnIndex)).ToString() + endRowIndexOfIdenticalCells);
                        return;
                    }
                }
                else {
                    content = temp;
                    //判断count是否>0;
                    if (count > 1)
                    {
                        //开始合并。
                        merge(((char)(64 + columnIndex)).ToString() + startRowIndexOfIdenticalCells, ((char)(64 + columnIndex)).ToString() + endRowIndexOfIdenticalCells);
                        startRowIndexOfIdenticalCells = rowIndex;
                        count = 1;
                        content = temp;
                        continue;
                    }
                    //count !=0;
                    startRowIndexOfIdenticalCells = rowIndex;
                    //不同。
                }
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="columnIndex"></param>
        public void MergeTheSpecificColumnWithoutBlankContent(int columnIndex)
        {
            int rowIndex = 1;
            int rowMaxIndex = WS.UsedRange.Rows.Count;
            string content = getSpecificCellValue(((char)(64 + columnIndex)).ToString() + "1");
            int count = 1;  //同一列，连续单元格相同时的数目。
            int startRowIndexOfIdenticalCells = 1; //连续相同单元格的起始索引。
            int endRowIndexOfIdenticalCells = 0;        //连续相同单元格的终止索引。
            for (rowIndex = 2; rowIndex <= rowMaxIndex; rowIndex++)
            {
                string temp = getSpecificCellValue(((char)(64 + columnIndex)).ToString() + rowIndex);
                if (string.IsNullOrEmpty(temp)) continue;
                //
                if (content.Equals(temp))
                {
                    endRowIndexOfIdenticalCells = rowIndex;
                    count++;
                    //如果到最后一行。
                    if (rowIndex == rowMaxIndex)
                    {
                        //开始合并。
                        merge(((char)(64 + columnIndex)).ToString() + startRowIndexOfIdenticalCells, ((char)(64 + columnIndex)).ToString() + endRowIndexOfIdenticalCells);
                        return;
                    }
                }
                else
                {
                    content = temp;
                    //判断count是否>0;
                    if (count > 1)
                    {
                        //开始合并。
                        merge(((char)(64 + columnIndex)).ToString() + startRowIndexOfIdenticalCells, ((char)(64 + columnIndex)).ToString() + endRowIndexOfIdenticalCells);
                        startRowIndexOfIdenticalCells = rowIndex;
                        count = 1;
                        content = temp;
                        continue;
                    }
                    //count !=0;
                    startRowIndexOfIdenticalCells = rowIndex;
                    //不同。
                }
            }
        }
        //文字靠右
        public void textAlighRight(Range range) {
                range.HorizontalAlignment = HorizontalAlignment.Right;
        }
        public void delTheSpecificContentShiftToLeft(Range range) {
            range.Delete(XlDeleteShiftDirection.xlShiftToLeft);
        }
        /// <summary>
        /// 删除某指定行。
        /// </summary>
        /// <param name="rowIndex"></param>
        public void delTheSpecificRowShiftToUp(int rowIndex) {
             Range range= (Microsoft.Office.Interop.Excel.Range)WS.Rows[rowIndex, System.Type.Missing];
             range.Delete(XlDeleteShiftDirection.xlShiftUp);
        }
        public void AutoFit() {
            this.WS.UsedRange.EntireColumn.AutoFit();
        }
        /// <summary>
        /// 是否为空行
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <returns></returns>
        public bool isBlankRow(int rowIndex) {
            int colMaxIndex = WS.UsedRange.Columns.Count;
            int rowMaxIndex = WS.UsedRange.Rows.Count;
            if (rowIndex > rowMaxIndex) return true;
            string content;
            for (int colIndex = 1;colIndex<=colMaxIndex;colIndex++) {
                content = ((Microsoft.Office.Interop.Excel.Range)(WS.Cells[rowIndex, colIndex])).Text.ToString();
                if (!string.IsNullOrEmpty(content)) {
                    return false;
                }
            }
            return true;
        }
        /// <summary>
        ///  判断 此行中,从起始列到终止列  是否有 自然数.
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="startColIndex"></param>
        /// <param name="endColIndex"></param>
        /// <returns></returns>
        public bool ifHaveTheNaturalNumber(int rowIndex, int startColIndex, int endColIndex) {
            string content;
            for (int colIndex = startColIndex; colIndex <=endColIndex; colIndex++) {
                content = ((Microsoft.Office.Interop.Excel.Range)(WS.Cells[rowIndex, colIndex])).Text.ToString();
                int quantities = 0;
                bool result = int.TryParse(content, out quantities);
                if (result) {
                    //判断 quantities 是否 大于0.
                    if (quantities > 0) return true;
                }
            }
            return false;
        }
        /// <summary>
        /// 截至空白行,获取最大行索引.
        /// </summary>
        /// <returns></returns>
        public int getTheMaxRowIndexUntilBlankRow() {
            int MaxRowIndex = WS.UsedRange.Rows.Count;
            for (int rowIndex = 1;rowIndex<=MaxRowIndex;rowIndex ++) {
                if (!isBlankRow(rowIndex)) continue;
                return rowIndex - 1;
            }
            return MaxRowIndex;
        }
        /// <summary>
        /// 找出某列的最大行，第一次出现空为止。
        /// </summary>
        /// <param name="specificColIndex"></param>
        /// <returns></returns>
        public int getTheMaxRowIndexUntilBlankCellOfTheSpecificCol(int specificColIndex) {
            string content = string.Empty;
            int MaxRowIndex = WS.UsedRange.Rows.Count;
            for (int rowIndex = 1; rowIndex <= MaxRowIndex; rowIndex++)
            {
                content = ((Microsoft.Office.Interop.Excel.Range)(WS.Cells[rowIndex, specificColIndex])).Text.ToString().Trim();
                if (string.IsNullOrEmpty(content)) return rowIndex-1;
            }
            return MaxRowIndex;
        }
        /// <summary>
        /// 找出某列的最大行，第一次出现空为止。
        /// </summary>
        /// <param name="specificColIndex"></param>
        /// <returns></returns>
        public int getTheMaxRowIndexUntilBlankCellOfTheSpecificCol(int startRowIndex,int specificColIndex)
        {
            string content = string.Empty;
            int MaxRowIndex = WS.UsedRange.Rows.Count;
            for (int rowIndex = startRowIndex; rowIndex <= MaxRowIndex; rowIndex++)
            {
                content = ((Microsoft.Office.Interop.Excel.Range)(WS.Cells[rowIndex, specificColIndex])).Text.ToString().Trim();
                if (string.IsNullOrEmpty(content)) return rowIndex - 1;
            }
            return MaxRowIndex;
        }
        /// <summary>
        /// 从某行开始,某列,直至出现第一个空单元格的最大行索引.
        /// </summary>
        /// <param name="startRowIndex"></param>
        /// <param name="colIndex"></param>
        /// <returns></returns>
        public int  getMaxRowIndexBeforeBlankCell(int startRowIndex, int colIndex)
        {
            int rowMaxIndex = WS.UsedRange.Rows.Count;
            string content;
            for (int rowIndex = startRowIndex; rowIndex <= rowMaxIndex; rowIndex++)
            {
                content = ((Microsoft.Office.Interop.Excel.Range)(WS.Cells[rowIndex, colIndex])).Text.ToString().Trim();
                if (string.IsNullOrEmpty(content)) {
                    return rowIndex - 1;
                }
            }
            return rowMaxIndex;
        }
        /// <summary>
        /// 在指定行，当第一次出现为空内容时，返回空单元格之前的单元格列索引。
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <returns></returns>
        public int getMaxColIndexBeforeBlankCellInSepcificRow(int rowIndex)
        {
            int colMaxIndex = WS.UsedRange.Columns.Count;
            string content;
            for (int colIndex = 1; colIndex <= colMaxIndex; colIndex++)
            {
                content = ((Microsoft.Office.Interop.Excel.Range)(WS.Cells[rowIndex, colIndex])).Text.ToString().Trim();
                if (string.IsNullOrEmpty(content))
                {
                    return colIndex-1;
                }
            }
            return colMaxIndex;
        }
        /// <summary>
        /// 获取单元格内容,通过行,列索引
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="colIndex"></param>
        /// <returns></returns>
        public string getCellContentByRowAndColIndex(int rowIndex,int colIndex) {

            return((Microsoft.Office.Interop.Excel.Range)(WS.Cells[rowIndex, colIndex])).Text.ToString().Trim();
        }
        /// <summary>
        /// 清除某个区域
        /// </summary>
        /// <param name="range"></param>
        public void clearAllContents(Range range){
            range.ClearContents();
        }
        /// <summary>
        /// 转置粘贴
        /// </summary>
        public void pasteByTranspose(Range range_desc){
            /*
                Range("D2:D32").Select
                Selection.Copy
                Range("K5").Select
                Selection.PasteSpecial Paste:= xlPasteAll, Operation:= xlNone, SkipBlanks:= _
                    False, transpose:= True
                Cells.Select
                Cells.EntireColumn.AutoFit
                Range("O21").Select
            */
            range_desc.PasteSpecial(XlPasteType.xlPasteAll, XlPasteSpecialOperation.xlPasteSpecialOperationNone, false, true);
        }
        public void set_Value_By_Sum_With_Col_Offset(Range range,int start_col_index_RC,int end_col_index_RC) {
            //ActiveCell.FormulaR1C1 = "=SUM(RC[-4]:RC[-3])"
            range.FormulaR1C1 = string.Format(@"=SUM(RC[{0}]:RC[{1}])",start_col_index_RC,end_col_index_RC);
        }
        /// <summary>
        /// 相对偏移量　
        /// </summary>
        /// <param name="range"></param>
        /// <param name="startRowIndexByRC"></param>
        /// <param name="endRowIndexByRC"></param>
        public void setValueOfSumInSpecificCol(Range range,int startRowIndexByRC,int endRowIndexByRC) {
            range.FormulaR1C1 = string.Format(@"=SUM(R[{0}]C:R[{1}]C)",startRowIndexByRC,endRowIndexByRC);
        }
        /// <summary>
        /// RC偏移量
        /// </summary>
        /// <param name="range"></param>
        /// <param name="startRowIndexByRC"></param>
        /// <param name="endRowIndexByRC"></param>
        /// <param name="startColIndexByRC"></param>
        /// <param name="endColIndexByRC"></param>
        public void setValueOfSumByRC(Range range,int startRowIndexByRC,int endRowIndexByRC,int startColIndexByRC,int endColIndexByRC) {
            range.FormulaR1C1 = string.Format(@"=SUM(R[{0}]C[{1}]:R[{2}]C[{3}])", startRowIndexByRC, startColIndexByRC, endRowIndexByRC,endColIndexByRC);
        }
        /// <summary>
        /// 替换方法.
        /// </summary>
        /// <param name="range"></param>
        /// <param name="searchStr"></param>
        /// <param name="replacement"></param>
        public void replace_Str_in_the_range(Range range,string searchStr,string replacement) {
            /*Selection.Replace What:= "", Replacement:= "0", LookAt:= xlPart, _
            SearchOrder:= xlByRows, MatchCase:= False, SearchFormat:= False, _
            ReplaceFormat:= False
            */
             /*Range("A1:D4").Select
            Selection.replace What:="0", Replacement:="", LookAt:=xlPart, _
            SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
            ReplaceFormat:=False*/
            range.Replace(searchStr, replacement);
        }
        /// <summary>
        /// 替换文件中的字符。
        /// </summary>
        /// <param name="searchStr"></param>
        /// <param name="replacement"></param>
        public void replace_Str_In_All_Range(string searchStr,string replacement) {
            int maxColIndex = WS.UsedRange.Columns.Count;
            int maxRowIndex = WS.UsedRange.Rows.Count;
            for (int rowIndex = 1;rowIndex<= maxRowIndex;rowIndex ++) {
                for (int colIndex =1;colIndex<=maxColIndex;colIndex++) {
                    Range rangeTemp = ((Range)WS.Cells[rowIndex, colIndex]);
                    string temp = rangeTemp.Text.ToString().Trim();
                    if (temp.Equals(searchStr)) {
                        WS.Cells[rowIndex, colIndex] = replacement;
                    }
                }
            }
        }
        /// <summary>
        /// 替换指定区域的字符。
        /// </summary>
        /// <param name="startRowIndex"></param>
        /// <param name="startColIndex"></param>
        /// <param name="endRowIndex"></param>
        /// <param name="endColIndex"></param>
        /// <param name="searchStr"></param>
        /// <param name="replacement"></param>
        public void replace_str(int startRowIndex,int startColIndex,int endRowIndex,int endColIndex,string searchStr,string replacement) {
            for (int rowIndex =startRowIndex;rowIndex<=endRowIndex;rowIndex++) {
                for (int colIndex = startColIndex;colIndex<=endColIndex;colIndex++) {
                    Range rangeTemp = ((Range)WS.Cells[rowIndex, colIndex]);
                    string temp = rangeTemp.Text.ToString().Trim();
                    if (temp.Equals(searchStr))
                    {
                        WS.Cells[rowIndex, colIndex] = replacement;
                    }
                }
            }
       }
        /// <summary>
        /// 从源sheet 复制所有内容 到 目的sheet中
        /// </summary>
        /// <param name="srcSheet"></param>
        /// <param name="destSheet"></param>
        public void copyRangeFromOneToAnotherSheet(Worksheet srcSheet, Worksheet destSheet) {
            //复制源表格整体内容
            srcSheet.Cells.Copy();
            destSheet.Paste();
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
       /// 判断某行中，指定的起始列 至 终止列的值 是否为空。
       /// </summary>
       /// <param name="wS"></param>
       /// <param name="rowIndex"></param>
       /// <param name="startColIndex"></param>
       /// <param name="endColIndex"></param>
       /// <returns></returns>
        public bool isBlankRangeTheSpecificRow(int rowIndex,int startColIndex,int endColIndex) {
            Usual_Excel_Helper uEHelper = new Usual_Excel_Helper(WS);
            for (int colIndex=startColIndex;colIndex<=endColIndex;colIndex++) {
                string tempStr = uEHelper.getCellContentByRowAndColIndex(rowIndex, colIndex);
                if (!string.IsNullOrEmpty(tempStr)) return false;
            }
            return true;
        }
        /// <summary>
        /// 设置某个区域的公式.
        /// </summary>
        /// <param name="range"></param>
        /// <param name="formulaStr"></param>
        public void setFormulaR1C1ForRange(Range range,string formulaStr) {
            range.FormulaR1C1 = formulaStr;
        }
        /// <summary>
        /// 向某行写入数据。
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="startNum"></param>
        /// <param name="numbers"></param>
        public void writeToSpecificRow(int rowIndex,int startNum,int numbers) {
            for (int i=1;i<=numbers;i++) {
                WS.Cells[rowIndex, i] = i;
            }
        }
        /// <summary>
        /// 清除某一行。内容清空，但不删除
        /// </summary>
        public void clearTheSpecificRow(int theSpecificRowIndex) {
            /*
             Selection.ClearContents
             */
            //最大列数。
            int usedMaxCols = WS.UsedRange.Columns.Count;
            //引用指定行。
            Range range = WS.Range[WS.Cells[theSpecificRowIndex, 1], WS.Cells[theSpecificRowIndex, usedMaxCols]];
            range.ClearContents();
        }
        /// <summary>
        /// 依据搜索的内容获取与之匹配的第一个Cell
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public Range getFirstCellByContent(string content) {
            //最大列数。
            int usedMaxCols = WS.UsedRange.Columns.Count;
            int usedMaxRows = WS.UsedRange.Rows.Count;
            for (int rowIndex=1; rowIndex <= usedMaxRows;rowIndex ++) {
                for (int colIndex = 1;colIndex<=usedMaxCols;colIndex++) {
                    string tempStr = ((Range)WS.Cells[rowIndex, colIndex]).Text.ToString().Trim();
                    if (string.IsNullOrEmpty(tempStr)) continue;
                    if (!content.Equals(tempStr)) continue;
                    return ((Range)WS.Cells[rowIndex, colIndex]);
                }
            }
            //未找到返回null;
            return null;
        }
        /// <summary>
        /// 依据搜索的内容获取与之匹配的第一个Cell
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public Range getFirstCellWhichContainContent(string content)
        {
            //最大列数。
            int usedMaxCols = WS.UsedRange.Columns.Count;
            int usedMaxRows = WS.UsedRange.Rows.Count;
            for (int rowIndex = 1; rowIndex <= usedMaxRows; rowIndex++)
            {
                for (int colIndex = 1; colIndex <= usedMaxCols; colIndex++)
                {
                    string tempStr = ((Range)WS.Cells[rowIndex, colIndex]).Text.ToString().Trim();
                    if (string.IsNullOrEmpty(tempStr)) continue;
                    if (!tempStr.Contains(content)) continue;
                    return ((Range)WS.Cells[rowIndex, colIndex]);
                }
            }
            //未找到返回null;
            return null;
        }
        /// <summary>
        /// 将文档列印到一页范围内。
        /// </summary>
        public void toWholePage() {
            //ActiveSheet.VPageBreaks(1).DragOff Direction:= xlToRight, RegionIndex:= 1
            if (getTotalPagesOfVerticalPostion() == 0 || getTotalPagesOfVerticalPostion() ==1) return;
            
            hideTheColumnByIndex(_wS.UsedRange.Columns.Count + 1);
            this._wS.VPageBreaks[1].DragOff(XlDirection.xlToRight, 1);
        }
        /// <summary>
        /// 获取垂直方向的最大页码
        /// </summary>
        /// <returns></returns>
        public int getTotalPagesOfVerticalPostion() {
            /*
            ActiveWorkbook.Names.Add Name:= "ColFirst", RefersToR1C1:= _
        "=GET.DOCUMENT(61)" '判断打印顺序的设置类型
    ActiveWorkbook.Names.Add Name:= "lstRow", RefersToR1C1:= _
        "=GET.DOCUMENT(10)" '本工作表已用到的最大行数
    ActiveWorkbook.Names.Add Name:= "lstColumn", RefersToR1C1:= _
        "=GET.DOCUMENT(12)" '本工作表已用到的最大列数
    ActiveWorkbook.Names.Add Name:= "hNum", RefersToR1C1:= _
        "=IF(ISERROR(FREQUENCY(GET.DOCUMENT(64),Row())),0,FREQUENCY(GET.DOCUMENT(64),Row()))" 'hNum为本单元格上方的水平分页符个数
    ActiveWorkbook.Names.Add Name:= "vNum", RefersToR1C1:= _
                "=IF(ISERROR(FREQUENCY(GET.DOCUMENT(65),Column())),0,FREQUENCY(GET.DOCUMENT(65),Column()))" ''本单元格左边的垂直分页个数
    ActiveWorkbook.Names.Add Name:= "hSum", RefersToR1C1:= _
        "=IF(ISERROR(FREQUENCY(GET.DOCUMENT(64),lstRow)),0,FREQUENCY(GET.DOCUMENT(64),lstRow))" ''本工作表最后一个单元格上方的水平分页符个数
    ActiveWorkbook.Names.Add Name:= "vSum", RefersToR1C1:= _
                "=IF(ISERROR(FREQUENCY(GET.DOCUMENT(65),lstColumn)),0,FREQUENCY(GET.DOCUMENT(65),lstColumn))" ''本工作表最后一个单元格左边的垂直分页个数
    ActiveWorkbook.Names.Add Name:= "ThisPageNo", RefersToR1C1:= _
        "=IF(ColFirst,(hSum+1)*vNum+hNum+1,(vSum+1)*hNum+vNum+1)*ISNUMBER(NOW())" '单元格所在页码
    ActiveWorkbook.Names.Add Name:= "PagesCount", RefersToR1C1:= _
        "=GET.DOCUMENT(50)*ISNUMBER(NOW())" '本工作表的总页数
        */
            int colMaxIndex = this._wS.UsedRange.Columns.Count;
            _wS.Cells[1,colMaxIndex+1] = "=vNum";
            return int.Parse(((Range)_wS.Cells[1, colMaxIndex+1]).Text.ToString());
        }
        private void initWS() {
            //判断打印顺序的设置类型
            this._wS.Names.Add("ColFirst", "=GET.DOCUMENT(61)");
            //本工作表已用到的最大行数
            this._wS.Names.Add("lstRow", "=GET.DOCUMENT(10)");
            //本工作表已用到的最大行数
            this._wS.Names.Add("lstColumn", "=GET.DOCUMENT(12)");
            //hNum为本单元格上方的水平分页符个数
            this._wS.Names.Add("hNum", "=IF(ISERROR(FREQUENCY(GET.DOCUMENT(64),Row())),0,FREQUENCY(GET.DOCUMENT(64),Row()))");
            //本单元格左边的垂直分页个数
            this._wS.Names.Add("vNum", "=IF(ISERROR(FREQUENCY(GET.DOCUMENT(65),Column())),0,FREQUENCY(GET.DOCUMENT(65),Column()))");
            //本工作表最后一个单元格上方的水平分页符个数
            this._wS.Names.Add("hSum", "=IF(ISERROR(FREQUENCY(GET.DOCUMENT(64),lstRow)),0,FREQUENCY(GET.DOCUMENT(64),lstRow))");
            // 本工作表最后一个单元格左边的垂直分页个数
            this._wS.Names.Add("vSum", "=IF(ISERROR(FREQUENCY(GET.DOCUMENT(65),lstColumn)),0,FREQUENCY(GET.DOCUMENT(65),lstColumn))");
            //单元格所在页码 
            this._wS.Names.Add("ThisPageNo", "=IF(ColFirst,(hSum+1)*vNum+hNum+1,(vSum+1)*hNum+vNum+1)*ISNUMBER(NOW())");
            //本工作表的总页数
            this._wS.Names.Add("PagesCount", "=GET.DOCUMENT(50)*ISNUMBER(NOW())");
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="colIndex"></param>
        public void hideTheColumnByIndex(int colIndex) {
            //Columns("A:A")
            //range = WS.Range[WS.Cells[rowIndex, colIndex], WS.Cells[rowIndex, colIndex]];
            Range range = _wS.Range[_wS.Cells[1, colIndex], _wS.Cells[1, colIndex]];
            range.EntireColumn.Hidden = true;
                //Selection.EntireColumn.Hidden = True
        }
    }
}
