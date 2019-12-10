using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Tools;
using System.Data;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class Report_Dealwith_Status
    {
        private string _report_file_path;
        private int _sheet_visual_counts;
        private int _sheet_index;
        private string _sheet_name;
        private int _current_row_Index;
        private bool _status_flag = true;   //true: 正常  false: 异常
        private string _status_description;
        private string _update_time;
        private int _max_row_index;
        private string _file_name;
        private int _max_col_index;
        private int _current_col_index;

        public Report_Dealwith_Status(string file_name,int sheet_Index,string sheet_Name) {
            this._file_name = file_name;
            this._sheet_index = sheet_Index;
            this._sheet_name = sheet_Name;
        }

        public string Report_file_path
        {
            get
            {
                return _report_file_path;
            }

            set
            {
                _report_file_path = value;
            }
        }


        public int Sheet_index
        {
            get
            {
                return _sheet_index;
            }

            set
            {
                _sheet_index = value;
            }
        }

        public string Sheet_name
        {
            get
            {
                return _sheet_name;
            }

            set
            {
                _sheet_name = value;
            }
        }

        public int Current_Row_index
        {
            get
            {
                return _current_row_Index;
            }

            set
            {
                _current_row_Index = value;
            }
        }

        public bool Status_flag
        {
            get
            {
                return _status_flag;
            }

            set
            {
                _status_flag = value;
            }
        }

        public string Status_description
        {
            get
            {
                return _status_description;
            }

            set
            {
                _status_description = value;
            }
        }

        public string Update_time
        {
            get
            {
                return _update_time;
            }

            set
            {
                _update_time = value;
            }
        }

        public int Max_row_index
        {
            get
            {
                return _max_row_index;
            }

            set
            {
                _max_row_index = value;
            }
        }

        public string File_name
        {
            get
            {
                return _file_name;
            }

            set
            {
                _file_name = value;
            }
        }

        public int Sheet_visual_counts
        {
            get
            {
                return _sheet_visual_counts;
            }

            set
            {
                _sheet_visual_counts = value;
            }
        }

        public int Max_col_index
        {
            get
            {
                return _max_col_index;
            }

            set
            {
                _max_col_index = value;
            }
        }

        public int Current_col_index
        {
            get
            {
                return _current_col_index;
            }

            set
            {
                _current_col_index = value;
            }
        }



        /// <summary>
        /// 判断某文件中的索引为:  sheet_Index，名称为:  sheet_Name 的表格是否存在记录。
        /// </summary>
        /// <returns></returns>
        public  bool ifExists() {
            string sqlStr = string.Format(@"SELECT 1 
                                                FROM Report_DealWith_Status 
                                                WHERE FILE_NAME = '{0}'
                                                AND Sheet_Name = '{1}'",
                                                this._file_name,
                                                this._sheet_name);
            return OracleDaoHelper.getDTBySql(sqlStr).Rows.Count > 0 ? true : false;
        }
        /// <summary>
        /// 新增 记录
        /// </summary>
        public void add() {
            //如果存在，先删除
            if (ifExists()) {
                del();
            }
            string sqlStr = string.Format(@"INSERT INTO Report_Dealwith_Status(
                                                                                file_name, 
                                                                                sheet_visual_counts, 
                                                                                sheet_index, 
                                                                                sheet_name,
                                                                                max_row_index,
                                                                                max_col_index,
                                                                                current_row_index, 
                                                                                status_description, 
                                                                                status_flag, 
                                                                                update_time
                                                                                
                                                )VALUES(
                                                    '{0}',  --<报表名称>--
                                                    {1},    --<电子表格个数>
                                                    {2},    --<当前表格索引>
                                                    '{3}',  --<表格名称>
                                                    {4},    --<最大行>
                                                    {5},     --<最大列>
                                                    {6},    --<当前行>
                                                    '{7}',  --<状态描述>
                                                    {8},    --<状态标志位>
                                                    sysdate
                                                )", this._file_name,
                                                    this.Sheet_visual_counts,
                                                    this._sheet_index,
                                                    this._sheet_name,
                                                    this._max_row_index,
                                                    this._max_col_index,
                                                    this._current_row_Index,
                                                    this._status_description,
                                                    this._status_flag?1:0);
            OracleDaoHelper.executeSQL(sqlStr);
        }
        /// <summary>
        /// report_file_path, 
        /// </summary>
        public void update() {
            string sqlStr = string.Format(@"UPDATE Report_Dealwith_Status 
                                                SET 
                                                    sheet_visual_counts = {3},
                                                    max_row_index ={4},
                                                    max_col_index = {5},
                                                    current_row_index ={6},
                                                    current_col_index = {7},                                                  
                                                    status_description = '{8}',
                                                    status_flag = {9},
                                                    update_time = sysdate
                                                 WHERE file_name = '{0}'
                                                AND Sheet_Index = {1}
                                                AND Sheet_Name = '{2}'",
                                                this._file_name,
                                                this._sheet_index,
                                                this._sheet_name,
                                                this.Sheet_visual_counts,
                                                this._max_row_index,
                                                this._max_col_index,
                                                this._current_row_Index,
                                                this._current_col_index,
                                                this._status_description,
                                                this._status_flag?1:0);
            OracleDaoHelper.executeSQL(sqlStr);
        }
        /// <summary>
        /// 删除掉此报表的处理记录。
        /// </summary>
        public void del() {
            string sqlStr = string.Format(@"DELETE FROM Report_Dealwith_status 
                                                WHERE File_Name = '{0}'
                                                    AND Sheet_Name = '{1}'",
                                                        this._file_name,
                                                        this._sheet_name);
            OracleDaoHelper.executeSQL(sqlStr);
        }
        /// <summary>
        /// 删除 Report_Dealwith_status,通过FileName删除.
        /// </summary>
        /// <param name="fileName"></param>
        public static void delStatusByFileName(string fileName) {
            string sqlStr = string.Format(@"DELETE FROM Report_Dealwith_status WHERE File_Name = '{0}'",fileName);
            OracleDaoHelper.executeSQL(sqlStr);
        }
        /// <summary>
        /// 获取此报表下的所有DataTable
        /// </summary>
        /// <returns></returns>
        public DataTable getDTOfTheReport() {
            string sqlStr = string.Format(@"SELECT report_file_path AS ""文件名"", 
                                                          sheet_visual_counts AS ""表格数"",
                                                          sheet_index AS ""索引"",
                                                          sheet_name AS ""表格名"",
                                                          current_row_index AS ""当前行"",
                                                          status_description AS ""进度"",
                                                          CASE status_flag 
                                                               WHEN 1 THEN N'正常'
                                                               ELSE N'异常'
                                                               END ""状态"",
                                                          update_time AS ""更新时间""
                                                    FROM Report_Dealwith_Status
                                                    WHERE file_name = '{0}'
                                                    ORDER BY sheet_Index ASC",
                                                    this._file_name);
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
        /// <summary>
        /// 获取当天的所有处理结果.
        /// </summary>
        /// <returns></returns>
        public static DataTable getAllReportDealWithStatusTheDay() {
            string sqlStr = string.Format(@"SELECT file_name AS ""文件名"", 
                                                          sheet_visual_counts AS ""表格数"",
                                                          sheet_index AS ""索引"",
                                                          sheet_name AS ""表格名"",
                                                          current_row_index AS ""当前行"",
                                                          status_description AS ""进度"",
                                                          CASE status_flag 
                                                               WHEN 1 THEN N'正常'
                                                               ELSE N'异常'
                                                               END ""状态"",
                                                          update_time AS ""更新时间""
                                                    FROM Report_Dealwith_Status
                                                    WHERE TRUNC(update_Time,'DD') = TRUNC(SYSDATE, 'DD)
                                                    ORDER BY sheet_Index ASC");
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
    }
}
