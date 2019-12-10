using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.DataAccess.Client;
using System.Data;
namespace Tools
{
    /// <summary>
    /// 实时信息类
    /// </summary>
    public class RealTime_Message
    {
        private string _msg;
        private bool _flag;
        private string _nameOfTheHandler;
        /// <summary>
        /// 
        /// </summary>
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
        public bool Flag
        {
            get
            {
                return _flag;
            }

            set
            {
                _flag = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public RealTime_Message(string nameOfTheHandler) {
            this._nameOfTheHandler = nameOfTheHandler;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public bool ifExists() {
            string sqlStr = string.Format(@"SELECT 1 FROM RealTime_Message WHERE Name_Of_The_Handler = '{0}'", _nameOfTheHandler);
            DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            return dt.Rows.Count > 0 ? true : false;
        }
        /// <summary>
        /// 
        /// </summary>
        public void add() {
            string sqlStr = string.Format(@"INSERT INTO RealTime_Message(msg,flag,name_of_the_handler) VALUES('{0}',{1},'{2}')",_msg,_flag,_nameOfTheHandler);
        }
        /// <summary>
        /// 
        /// </summary>
        public void update() {
            string sqlStr = string.Format(@"UPDATE RealTime_Message SET msg = '{1}',flag = {2} WHERE name_of_the_handler = '{0}'",this._nameOfTheHandler,this._msg,this._flag);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public DataTable getRealTimeMessage() {
            string sqlStr = string.Format(@"SELECT msg,flag FROM RealTime_Message WHERE name_Of_The_Handler = '{0}'",this._nameOfTheHandler);
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
    }
}
