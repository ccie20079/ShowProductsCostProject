using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class ProgressInfo
    {
        private int _current_value =0;
        private int _max_value;
        private string _name_of_the_handler;
        private string _update_time;
        private bool _finish_flag;
        private string _msg;
        /// <summary>
        /// 
        /// </summary>
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

        public int Current_value
        {
            get
            {
                return _current_value;
            }

            set
            {
                _current_value = value;
            }
        }

        public int Max_value
        {
            get
            {
                return _max_value;
            }

            set
            {
                _max_value = value;
            }
        }

        public string Name_of_the_handler
        {
            get
            {
                return _name_of_the_handler;
            }

            set
            {
                _name_of_the_handler = value;
            }
        }

        public bool Finish_flag
        {
            get
            {
                return _finish_flag;
            }

            set
            {
                _finish_flag = value;
            }
        }

        public string Msg
        {
            get
            {
                return _msg;
            }

            set
            {
                _msg = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="products_name"></param>
        public ProgressInfo(string name_of_the_handler) {
            this.Name_of_the_handler = name_of_the_handler;
        }
       /// <summary>
        /// 
        /// </summary>
        public ProgressInfo() {

        }
        public bool ifExists() {
            string sqlStr = string.Format(@"SELECT 1 FROM Progress_Info WHERE Name_of_the_handler = '{0}'", Name_of_the_handler);
            return OracleDaoHelper.getDTBySql(sqlStr).Rows.Count > 0 ? true : false;
        }
        public void add() {
            string sqlStr = string.Format(@"INSERT INTO Progress_Info(current_value,max_value,name_of_the_handler,finish_flag) 
                                                    VALUES(
                                                            {0},
                                                            {1},
                                                            '{2}',
                                                            {3}
                                            )",
                                            this._current_value,
                                            this._max_value,
                                            this.Name_of_the_handler,
                                            this._finish_flag ? 1 : 0);
            OracleDaoHelper.executeSQL(sqlStr);
        }
        public void update() {
            string sqlStr = string.Format(@"UPDATE Progress_Info
                                                    SET current_value = {1},
                                                         max_value = {2},
                                                        finish_flag = {3},
                                                        msg= '{4}'
                                                    WHERE name_of_the_handler = '{0}'
                                                    ",
                                                    this.Name_of_the_handler,
                                                    this._current_value,
                                                    this._max_value,
                                                    this._finish_flag?1:0,
                                                    this._msg);
            OracleDaoHelper.executeSQL(sqlStr);
        }
        public DataTable getProgressInfo() {
            return OracleDaoHelper.getDTBySql(string.Format(@"SELECT current_value,max_value,finish_flag,msg FROM Progress_Info WHERE Name_of_the_handler = '{0}'", this.Name_of_the_handler));
        }
        public void delete() {
            string sqlStr = string.Format(@"DELETE FROM Progress_Info WHERE Name_of_the_handler = '{0}'", this.Name_of_the_handler);
            OracleDaoHelper.executeSQL(sqlStr);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="applicationName"></param>
        /// <returns></returns>
        public static ProgressInfo getProgressInfo(string applicationName) {
            string sqlStr = string.Format(@"SELECT max_value, 
                                                    current_value, 
                                                    name_of_the_handler, 
                                                    update_time,
                                                    finish_flag,
                                                    msg
                                                FROM Progress_Info 
                                                WHERE Name_of_the_handler = '{0}'
                                                ", applicationName);
            DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            return ConvertHelper<ProgressInfo>.ConvertToObj(dt);
        }
    }
}
