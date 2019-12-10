using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Data;
using System.Data.OleDb;
using Microsoft.Office.Interop.Excel;
using Tools;
using System.ComponentModel;

namespace Excel
{
    public class ExcelHelper
    {
        private static Microsoft.Office.Interop.Excel.Application app = null;
        private static Microsoft.Office.Interop.Excel.Workbook wBook = null;
        /// <summary>
        /// 获取wBook;
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static Microsoft.Office.Interop.Excel.Workbook getWBook(string filePath)
        {
            ApplicationClass app = new ApplicationClass();
            app.Visible = false;
            Workbook wBook = app.Workbooks.Open(filePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            return wBook;
        }
        /// <summary>
        /// 关闭某个指定路径的wBook.
        /// </summary>
        /// <param name="xlsPath"></param>
        public static void closeBook(string xlsPath)
        {
            wBook.Close();
            //退出excel
            app.Quit();
            //释放资源
            System.Runtime.InteropServices.Marshal.ReleaseComObject(wBook);
            System.Runtime.InteropServices.Marshal.ReleaseComObject(app);
            //调用GC的垃圾回收方法
            GC.Collect();
            GC.WaitForPendingFinalizers();
        }
        /// <summary>
        /// 打开Excel后，返回excel的句柄。
        /// </summary>
        /// <param name="xlsFilePath"></param>
        /// <returns></returns>
        public static int openBook(string xlsFilePath)
        {
            if (!File.Exists(xlsFilePath))
            {
                GC.Collect();
                GC.WaitForPendingFinalizers();
                throw new Exception("文件不存在！");
            }
            ApplicationClass app = new ApplicationClass();
            app.Visible = true;
            try
            {
                Workbook wBook = app.Workbooks.Open(xlsFilePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return app.Hwnd;
        }
        #region public saveDtToExcel
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static bool saveDtToExcel(System.Data.DataTable dt, String filePath)
        {
            ApplicationClass app = new ApplicationClass();
            app.Visible = false;
            Workbook wBook = app.Workbooks.Add(true);
            Worksheet wSheet = (Worksheet)wBook.Worksheets[1];
            if (dt == null)
            {
                MessageBox.Show("数据源为空，无法导出。", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            //修改wSheet的名称。
            if (!String.IsNullOrEmpty(dt.TableName)) {
                wSheet.Name = dt.TableName;
            }
            int rowCount = dt.Rows.Count;
            int colCount = dt.Columns.Count;
            //写标题
            try
            {
                //每行格式设置，注意标题占一行。
                Range range = wSheet.get_Range(wSheet.Cells[1, 1], wSheet.Cells[rowCount + 1, colCount + 1]);
                //设置单元格为文本。
                range.NumberFormatLocal = "@";
                //水平对齐方式
                range.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                for (int j = 0; j < colCount; j++)
                {
                    wSheet.Cells[1, j + 1] = dt.Columns[j].ColumnName.ToString();
                }
                if (rowCount > 0)
                {
                    //逐行写数据。
                    for (int i = 0; i < rowCount; i++)
                    {
                        for (int j = 0; j < colCount; j++)
                        {
                            String str = dt.Rows[i][j].ToString();
                            wSheet.Cells[i + 2, j + 1] = str;
                        }
                    }
                }
                //自动调整列宽
                range.EntireColumn.AutoFit();
                //设置禁止弹出保存和覆盖的询问提示框
                app.DisplayAlerts = false;
                app.AlertBeforeOverwriting = false;
                //保存excel文档并关闭
                wBook.SaveAs(filePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                wBook.Close(true, filePath, Type.Missing);
                //退出Excel程序
                app.Quit();
                //释放资源
                System.Runtime.InteropServices.Marshal.ReleaseComObject(range);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wSheet);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(app);
                //调用GC的垃圾收集方法
                GC.Collect();
                GC.WaitForPendingFinalizers();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "提示消息:", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            finally
            {
            }
        }
        #endregion
        #region
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static bool saveDtToExcelWithPB(System.Data.DataTable dt, String filePath,ProgressBar  pb)
        {
            ApplicationClass app = new ApplicationClass();
            app.Visible = false;
            Workbook wBook = app.Workbooks.Add(true);
            Worksheet wSheet = (Worksheet)wBook.Worksheets[1];
            if (dt == null)
            {
                MessageBox.Show("数据源为空，无法导出。", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            //修改wSheet的名称。
            if (!String.IsNullOrEmpty(dt.TableName))
            {
                wSheet.Name = dt.TableName;
            }
            int rowCount = dt.Rows.Count;
            int colCount = dt.Columns.Count;
            //写标题
            try
            {
                //每行格式设置，注意标题占一行。
                Range range = wSheet.get_Range(wSheet.Cells[1, 1], wSheet.Cells[rowCount + 1, colCount + 1]);
                //设置单元格为文本。
                range.NumberFormatLocal = "@";
                //水平对齐方式
                range.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                for (int j = 0; j < colCount; j++)
                {
                    wSheet.Cells[1, j + 1] = dt.Columns[j].ColumnName.ToString();
                }
                pb.Visible = true;
                pb.Maximum = rowCount * colCount;
                pb.Value = 0;
                if (rowCount > 0)
                {
                    //逐行写数据。
                    for (int i = 0; i < rowCount; i++)
                    {
                        for (int j = 0; j < colCount; j++)
                        {
                            String str = dt.Rows[i][j].ToString();
                            wSheet.Cells[i + 2, j + 1] = str;

                            pb.Value++;
                            System.Windows.Forms.Application.DoEvents();
                        }
                    }
                }
                pb.Visible = false;
                pb.Maximum = 0;
                pb.Value = 0;
                //自动调整列宽
                range.EntireColumn.AutoFit();
                //设置禁止弹出保存和覆盖的询问提示框
                app.DisplayAlerts = false;
                app.AlertBeforeOverwriting = false;
                //保存excel文档并关闭
                wBook.SaveAs(filePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                wBook.Close(true, filePath, Type.Missing);
                //退出Excel程序
                app.Quit();
                //释放资源
                System.Runtime.InteropServices.Marshal.ReleaseComObject(range);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wSheet);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(app);
                //调用GC的垃圾收集方法
                GC.Collect();
                GC.WaitForPendingFinalizers();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "提示消息:", MessageBoxButtons.OK, MessageBoxIcon.Information);
                CmdHelper.killTheProcessByName("EXCEL");
                return false;
            }
            finally
            {
            }
        }

        public static bool saveDtToExcelWithBGWorker(System.Data.DataTable dtToExport2Excel, string xlsFilePath, BackgroundWorker bgWorker)
        {
            ApplicationClass app = new ApplicationClass();
            app.Visible = false;
            Workbook wBook = app.Workbooks.Add(true);
            Worksheet wSheet = (Worksheet)wBook.Worksheets[1];
            if (dtToExport2Excel == null)
            {
                MessageBox.Show("数据源为空，无法导出。", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            //修改wSheet的名称。
            if (!String.IsNullOrEmpty(dtToExport2Excel.TableName))
            {
                wSheet.Name = dtToExport2Excel.TableName;
            }
            int rowCount = dtToExport2Excel.Rows.Count;
            int colCount = dtToExport2Excel.Columns.Count;
            //写标题
            try
            {
                //每行格式设置，注意标题占一行。
                Range range = wSheet.get_Range(wSheet.Cells[1, 1], wSheet.Cells[rowCount + 1, colCount + 1]);
                //设置单元格为文本。
                range.NumberFormatLocal = "@";
                //水平对齐方式
                range.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                for (int j = 0; j < colCount; j++)
                {
                    wSheet.Cells[1, j + 1] = dtToExport2Excel.Columns[j].ColumnName.ToString();
                }
                if (rowCount > 0)
                {
                    //逐行写数据。
                    for (int i = 0; i < rowCount; i++)
                    {
                        for (int j = 0; j < colCount; j++)
                        {
                            String str = dtToExport2Excel.Rows[i][j].ToString();
                            wSheet.Cells[i + 2, j + 1] = str;
                            // Raises the System.ComponentModel.BackgroundWorker.ProgressChanged event.
                            bgWorker.ReportProgress(i*colCount + j);
                        }
                    }
                }
                //自动调整列宽
                range.EntireColumn.AutoFit();
                //设置禁止弹出保存和覆盖的询问提示框
                app.DisplayAlerts = false;
                app.AlertBeforeOverwriting = false;
                //保存excel文档并关闭
                wBook.SaveAs(xlsFilePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                wBook.Close(true, xlsFilePath, Type.Missing);
                //退出Excel程序
                app.Quit();
                //释放资源
                System.Runtime.InteropServices.Marshal.ReleaseComObject(range);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wSheet);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(app);
                //调用GC的垃圾收集方法
                GC.Collect();
                GC.WaitForPendingFinalizers();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "提示消息:", MessageBoxButtons.OK, MessageBoxIcon.Information);
                CmdHelper.killTheProcessByName("EXCEL");
                return false;
            }
            finally
            {
            }
        }
        #endregion
        #region saveDtToExcelWithProgressBar
        /// <summary>
        /// saveDtToExcelWithProgressBar
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="filePath"></param>
        /// <param name="pb"></param>
        /// <returns></returns>
        public static bool saveDtToExcelWithProgressBar(System.Data.DataTable dt, String filePath, ProgressBar pb)
        {
            ApplicationClass app = new ApplicationClass();
            app.Visible = false;
            Workbook wBook = app.Workbooks.Add(true);
            Worksheet wSheet = (Worksheet)wBook.Worksheets[1];
            int rowCount = dt.Rows.Count;
            int colCount = dt.Columns.Count;
            pb.Visible = true;
            pb.Value = 0;
            pb.Maximum = rowCount * colCount;
            //写标题
            try
            {
                //每行格式设置，注意标题占一行。
                Range range = wSheet.get_Range(wSheet.Cells[1, 1], wSheet.Cells[rowCount + 1, colCount + 1]);
                //设置单元格为文本。
                range.NumberFormatLocal = "@";
                //水平对齐方式
                range.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                for (int j = 0; j < colCount; j++)
                {
                    wSheet.Cells[1, j + 1] = dt.Columns[j].ColumnName.ToString();
                }
                if (rowCount > 0)
                {
                    //逐行写数据。
                    for (int i = 0; i < rowCount; i++)
                    {
                        for (int j = 0; j < colCount; j++)
                        {
                            String str = dt.Rows[i][j].ToString();
                            wSheet.Cells[i + 2, j + 1] = str;
                            pb.Value++;
                        }
                    }
                }
                //自动调整列宽
                range.EntireColumn.AutoFit();
                //设置禁止弹出保存和覆盖的询问提示框
                app.DisplayAlerts = false;
                app.AlertBeforeOverwriting = false;
                //保存excel文档并关闭
                wBook.SaveAs(filePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                wBook.Close(true, filePath, Type.Missing);
                //退出Excel程序
                app.Quit();
                //释放资源
                System.Runtime.InteropServices.Marshal.ReleaseComObject(range);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wSheet);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(app);
                //调用GC的垃圾收集方法
                GC.Collect();
                GC.WaitForPendingFinalizers();
                pb.Visible = false;
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "提示消息:", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            finally
            {
            }
        }
        #endregion
        #region saveDtToExcelWithProgressBar
        /// <summary>
        /// saveDtToExcelWithProgressBar
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="filePath"></param>
        /// <param name="pb"></param>
        /// <returns></returns>
        public static bool saveDtToExcelWithProgressBar(System.Data.DataTable dt,Worksheet wS, ProgressBar pb)
        {
            int rowCount = dt.Rows.Count;
            int colCount = dt.Columns.Count;
            pb.Visible = true;
            pb.Value = 0;
            pb.Maximum = rowCount * colCount;
            //写标题
            try
            {
                //每行格式设置，注意标题占一行。
                Range range = wS.get_Range(wS.Cells[1, 1], wS.Cells[rowCount + 1, colCount + 1]);
                //设置单元格为文本。
                range.NumberFormatLocal = "@";
                //水平对齐方式
                range.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                for (int j = 0; j < colCount; j++)
                {
                    wS.Cells[1, j + 1] = dt.Columns[j].ColumnName.ToString();
                }
                if (rowCount > 0)
                {
                    //逐行写数据。
                    for (int i = 0; i < rowCount; i++)
                    {
                        for (int j = 0; j < colCount; j++)
                        {
                            String str = dt.Rows[i][j].ToString();
                            wS.Cells[i + 2, j + 1] = str;
                            pb.Value++;
                        }
                    }
                }
                pb.Visible = false;
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "提示消息:", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            finally
            {
            }
        }
        #endregion
        #region public saveListToExcel
        /// <summary>
        /// 
        /// </summary>
        /// <param name="filePath"></param>
        /// <param name="list"></param>
        /// <param name="width">設置列寬。</param>
        /// <returns></returns>
        public static String saveListToExcel(List<String> list, String sheetName, String filePath, int columnWidth)
        {
            String result = "";
            ApplicationClass app = new ApplicationClass();
            app.Visible = false;
            //Workbook wBook = workbooks.Add(Microsoft.Office.Interop.Excel.XlWBATemplate.xlWBATWorksheet);
            Workbook wBook = app.Workbooks.Add(true);
            Worksheet wSheet = (Worksheet)wBook.Worksheets[1];
            wSheet.Name = sheetName;
            //每行格式设置，注意标题占一行。
            try
            {
                Range range = wSheet.get_Range(wSheet.Cells[1, 1], wSheet.Cells[60000, 10]);
                //设置单元格为文本。
                range.NumberFormatLocal = "@";
                //水平对齐方式
                range.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                for (int i = 0; i < list.Count; i++)
                {
                    wSheet.Cells[1, i + 1] = list[i];
                }
                //列寬自適應
                //range.EntireColumn.AutoFit();
                range.ColumnWidth = columnWidth;
                //设置禁止弹出保存和覆盖的询问提示框
                app.DisplayAlerts = false;
                app.AlertBeforeOverwriting = false;
                //保存工作簿
                wBook.SaveAs(filePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                wBook.Close(true, filePath, Type.Missing);
                //退出excel
                app.Quit();
                //释放资源
                System.Runtime.InteropServices.Marshal.ReleaseComObject(range);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wSheet);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(app);
                //调用GC的垃圾回收方法
                GC.Collect();
                GC.WaitForPendingFinalizers();

                result = "工单模板保存于：" + filePath;
                return result;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "提示消息:", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return result;
            }
            finally
            {
            }
        }
        #endregion
        #region public addSheetByList
        /// <summary>
        /// 追加sheet,可以用于保存到某個指定的excel
        /// </summary>
        /// <param name="filePath"></param>
        /// <param name="list"></param>
        /// <param name="sheetNum"></param>
        /// <param name="columnWidth">設置Excel列寬</param>
        /// <returns></returns>
        public static String addSheetByList(List<String> list, String sheetName, String filePath, int columnWidth)
        {
            String result = "";
            ApplicationClass app = new ApplicationClass();
            app.Visible = false;
            Workbook wBook = app.Workbooks.Open(filePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            Worksheet wSheet = (Worksheet)wBook.Worksheets.Add(Type.Missing, wBook.Worksheets[wBook.Worksheets.Count], 1, XlSheetType.xlWorksheet);
            wSheet.Name = sheetName;
            //每行格式设置，注意标题占一行。
            try
            {
                Range range = wSheet.get_Range(wSheet.Cells[1, 1], wSheet.Cells[60000, 10]);
                //设置单元格为文本。
                range.NumberFormatLocal = "@";
                //水平对齐方式
                range.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                //設置列寬
                range.ColumnWidth = columnWidth;
                for (int i = 0; i < list.Count; i++)
                {
                    wSheet.Cells[1, i + 1] = list[i];
                }
                //range.EntireColumn.AutoFit();
                //设置禁止弹出保存和覆盖的询问提示框
                app.DisplayAlerts = false;
                app.AlertBeforeOverwriting = false;
                //保存工作簿
                wBook.Save();
                //wBook.SaveAs(filePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                wBook.Close(true, filePath, Type.Missing);
                //退出excel
                app.Quit();
                //释放资源
                System.Runtime.InteropServices.Marshal.ReleaseComObject(range);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wSheet);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(wBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(app);
                //调用GC的垃圾回收方法
                GC.Collect();
                GC.WaitForPendingFinalizers();

                result = "工单模板保存于：" + filePath;
                return result;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "提示消息:", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return result;
            }
            finally
            {
            }
        }
        #endregion

        #region public getDtFromExcel
        /// <summary>
        /// getDtFromExcel
        ///     SELECT 序号,
        ///                 概要工序,
	    ///                 具体工序,
        ///                 工时(秒),
        ///                 工时单价(元/秒),
	    ///                 工序造价,
	    ///                 提供人,
	    ///                 修改时间
        ///  FROM[成品报价$]
        /// </summary>
        /// <param name="filePath"></param>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static System.Data.DataTable getDtFromExcel(String filePath, String sql)
        {
            //String fileType = System.IO.Path.GetExtension(filePath);
            String strConn = "Provider=Microsoft.Ace.OleDb.12.0;" + "Data Source=" + filePath + ";" + "Extended Properties='Excel 12.0;HDR = YES; IMEX = 1';";
            OleDbConnection oleConn = new OleDbConnection(strConn);
            OleDbDataAdapter oleDaExcel = null;
            System.Data.DataTable dt = null;
            try
            {
                oleConn.Open();
                oleDaExcel = new OleDbDataAdapter(sql, oleConn);
                dt = new System.Data.DataTable();
                //DataSet ds =new DataSet();
                //oleDaExcel.Fill(ds,"Book1");
                //this.dgv.dataSource = ds.Tables["Book1"].defaultView;
                oleDaExcel.Fill(dt);
                //oleDaExcel.Fill(ds, "Sheet1");
            }
            catch (Exception ex)
            {
                MessageBox.Show("未能导入: " + ex.Message, "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                throw new Exception(ex.ToString());
            }
            finally
            {
                oleConn.Close();
                if (oleDaExcel != null)
                {
                    oleDaExcel.Dispose();
                }
            }
            return dt;
        }
        #endregion
        #region private  SaveAsXls
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="filePath"></param>
        private static void SaveAsXls(System.Data.DataTable dt, String filePath) //另存新档按钮   导出成Excel
        {
            FileStream fs = new FileStream(filePath, FileMode.Create, FileAccess.Write);
            //StreamWriter sw = new StreamWriter(myStream, System.Text.Encoding.GetEncoding("gb2312"));
            StreamWriter sw = new StreamWriter(fs, System.Text.Encoding.GetEncoding(-0));
            string str = "";
            string tempStr = "";
            try
            {
                //写标题
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    if (i > 0)
                    {
                        str += "\t";
                    }
                    str += dt.Columns[i].ColumnName.ToString();
                }
                sw.WriteLine(str);
                //写内容
                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    for (int k = 0; k < dt.Columns.Count; k++)
                    {
                        if (k > 0)
                        {
                            tempStr += "\t";
                        }
                        tempStr += dt.Rows[j][k].ToString();
                    }
                    sw.WriteLine(tempStr);
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString(), "Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            finally
            {
                sw.Close();
                fs.Close();
            }
        }
        #endregion
       
    }
}
