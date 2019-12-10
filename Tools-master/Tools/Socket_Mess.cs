using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
/// <summary>
/// 
/// </summary>
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class Socket_Mess
    {
        private string _process_Name;
        private string _result;
        private int _flag;
        private string _status;
        private decimal _current_value;
        private decimal _total_value;
        private string _task_status = "ready";

        private NetworkStream _netStream;

        /// <summary>
        /// 
        /// </summary>
        public string Process_Name
        {
            get
            {
                return _process_Name;
            }

            set
            {
                _process_Name = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Result
        {
            get
            {
                return _result;
            }

            set
            {
                _result = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Status
        {
            get
            {
                return _status;
            }

            set
            {
                _status = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal Current_value
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
        /// <summary>
        /// 
        /// </summary>
        public decimal Total_value
        {
            get
            {
                return _total_value;
            }

            set
            {
                _total_value = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public int Flag
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
        public string Task_status
        {
            get
            {
                return _task_status;
            }

            set
            {
                _task_status = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_process_Name"></param>
        public Socket_Mess(string _process_Name)
        {
            this.Process_Name = _process_Name;
        }
        /// <summary>
        /// 
        /// </summary>
        public Socket_Mess() { }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public Socket_Mess getCurrentStatus()
        {
            string sqlStr = string.Format(@"select 
                                                  PROCESS_NAME,
                                                  RESULT,
                                                  FLAG,
                                                  STATUS,
                                                  Task_Status,
                                                  CURRENT_VALUE,
                                                  TOTAL_VALUE
                                            FROM Socket_Mess 
                                            WHERE process_name = '{0}'",
                                            this._process_Name);
            List<Socket_Mess> socketMessList = DT_To_List.TableToList<Socket_Mess>(OracleDaoHelper.getDTBySql(sqlStr));
            if (socketMessList.Count == 0) return null;
            return socketMessList[0];
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public bool ifExistsTheProcess() {
            string sqlStr = string.Format(@"select 
                                                 1
                                            FROM Socket_Mess 
                                            WHERE process_name = '{0}'",
                                        this._process_Name);
            return OracleDaoHelper.getDTBySql(sqlStr).Rows.Count > 0 ? true : false;
        }
        /// <summary>
        /// 新增时是否为processing.
        /// </summary>
        /// <returns></returns>
        public int addTheSocketMess() {
            string sqlStr = string.Format(@"INSERT INTO Socket_Mess 
                                                (
                                                    PROCESS_NAME,
                                                    TASK_STATUS
                                                )
                                            VALUES(
                                                    '{0}',
                                                    '{1}'
                                                    )",
                                       this._process_Name,
                                       this._task_status
                                       );
            return OracleDaoHelper.executeSQL(sqlStr);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public int updateTheSocketMess() {
            string sqlStr = string.Format(@"UPDATE Socket_MESS
                                             SET Result = '{1}',
                                                 FLAG = {2},
                                                 STATUS = '{3}',
                                                 CURRENT_VALUE = {4},
                                                 TOTAL_VALUE = {5},
                                                 Task_Status = '{6}',
                                                  Update_Time = sysdate
                                             WHERE Process_Name = '{0}'",
                                             this._process_Name,
                                             this._result,
                                             this._flag,
                                             this._status,
                                             this._current_value,
                                             this._total_value,
                                             this._task_status
                                             );
            return OracleDaoHelper.executeSQL(sqlStr);
        }
        /// <summary>
        /// 
        /// </summary>
        public void writeTitle() {
            //写服务端
            Console.WriteLine("\r\n" + this._status);
       }
        /// <summary>
        /// 
        /// </summary>
        public void writeProgress() {
            Console.SetCursorPosition(0, Console.CursorTop);
            if (_current_value == _total_value) {
                Console.Write("\t" + (Math.Round((_current_value / Total_value) * 100, 2)).ToString() + "%   ");
                return;
            }
            Console.Write("\t"+(Math.Round((_current_value/Total_value)*100,2)).ToString() + "%");
        }
        /// <summary>
        /// 
        /// </summary>
        public void writeResult() {
            Console.WriteLine("\r\n"+_result.ToString());
        }
        /// <summary>
        /// 使Socket_Mess的  task_status 为 finished.
        /// </summary>
        public void closeTheSocketMess() {
            string sqlStr = string.Format(@"UPDATE SOCKET_MESS
                                            SET TASK_STATUS = 'finished'
                                            WHERE PROCESS_NAME = '{0}'",
                                            this._process_Name);
            OracleDaoHelper.executeSQL(sqlStr);
        }
        /*
      /// <summary>
      /// 开始处理该Socket_Mess;
      /// </summary>
        public void startTheSocketMess() {
            string sqlStr = string.Format(@"UPDATE SOCKET_MESS
                                            SET TASK_STATUS = 'processing'
                                            WHERE PROCESS_NAME = '{0}'",
                                           this._process_Name);
            OracleDaoHelper.executeSQL(sqlStr);
        }
        */
    }
}
