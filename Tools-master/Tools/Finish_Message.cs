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
    public class FINISH_MESSAGE
    {
        private string _prompt;
        private bool _flag;
        private string _nameOftheHandler;
        private string _randomStr;
        private bool _finish_flag ;
        /// <summary>
        /// 
        /// </summary>
        public string Prompt
        {
            get
            {
                return _prompt;
            }

            set
            {
                _prompt = value;
            }
        }

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

        public string NameOftheHandler
        {
            get
            {
                return _nameOftheHandler;
            }

            set
            {
                _nameOftheHandler = value;
            }
        }

        public string RandomStr
        {
            get
            {
                return _randomStr;
            }

            set
            {
                _randomStr = value;
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
        /// <summary>
        /// 
        /// </summary>
        public FINISH_MESSAGE(string nameOfTheHandler,string randomStr) {
            this._nameOftheHandler = nameOfTheHandler;
            this._randomStr = randomStr;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public bool ifExists() {
            string sqlStr = string.Format(@"SELECT 1 FROM FINISH_MESSAGE WHERE name_of_the_handler = '{0}' AND random_Str = '{1}'",this.NameOftheHandler,this.RandomStr);
            DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            return dt.Rows.Count != 0 ? true : false;
        }
        /// <summary>
        /// 
        /// </summary>
        public void add() {
            string sqlStr = string.Format(@"INSERT INTO FINISH_MESSAGE(Prompt,Flag,name_of_the_handler,Random_Str,finish_flag) VALUES('{0}',{1},'{2}','{3}',{4})", this.Prompt,this.Flag?1:0,this.NameOftheHandler,this.RandomStr,this.Finish_flag?1:0);
            OracleDaoHelper.executeSQL(sqlStr);
        }
        /// <summary>
        /// 
        /// </summary>
        public void update() {
            string sqlStr = string.Format(@"UPDATE FINISH_MESSAGE SET Prompt = '{2}',Flag = {3},finish_flag = {4} WHERE name_of_the_handler = '{0}' And Random_Str = '{1}'", this.NameOftheHandler, this.RandomStr, this._prompt, this.Flag ? 1:0,this.Finish_flag ? 1:0);
            OracleDaoHelper.executeSQL(sqlStr);
        }
  /// <summary>
  /// 
  /// </summary>
  /// <param name="nameOfTheHandler"></param>
  /// <returns></returns>
        public static DataTable getLastestMsgByHandlerName(string nameOfTheHandler) {
            string sqlStr = string.Format(@"SELECT Prompt,
                                                   Flag,
                                                    Finish_Flag
                                                  FROM 
                                                  (
                                                    select row_number() over(order by update_time desc)  row_id,
                                                           name_of_the_Handler,
                                                           prompt,
                                                           flag,
                                                            finish_flag,
                                                           update_time
                                                    from FINISH_MESSAGE
                                                  ) TEMP
                                                  WHERE name_Of_The_Handler  = '{0}'
                                                  and row_id = 1", nameOfTheHandler);
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
        /// <summary>
        /// 获取最新的一条信息。
        /// </summary>
        /// <returns></returns>
        public static DataTable getLastestMsg()
        {
            string sqlStr = string.Format(@"SELECT Prompt,
                                                   Flag
                                                  FROM 
                                                  (
                                                    select row_number() over(order by update_time desc)  row_id,
                                                           name_of_the_Handler,
                                                           prompt,
                                                           flag,
                                                            finish_flag,
                                                           update_time
                                                    from FINISH_MESSAGE
                                                  ) TEMP
                                                   where row_id = 1");
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
        public static DataTable getTop10MsgByProductsName(string name_of_the_Handler)
        {
            string sqlStr = string.Format(@"select row_num as ""序号"",
                                                name_of_the_Handler as ""处理程序名称"",
                                                   prompt AS ""提示"",
                                                   case flag
                                                        when 1 then '成功'
                                                        else '失败'
                                                   end AS ""状态"",
                                                   update_time as ""更新时间"",
                                                    finish_flag as ""结束标识""
                                            from(
                                                select row_number() over(order by update_time desc) row_num,
                                                       name_of_the_Handler,
                                                       prompt,
                                                       flag,
                                                       update_time,
                                                        finish_flag
                                                from FINISH_MESSAGE
                                                where products_name = '{0}'
                                            ) Temp
                                            where Temp.row_num <= 10", name_of_the_Handler);
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
        /// <summary>
        /// 依据PN 和　randomStr 获取　Message
        /// </summary>
        /// <param name="pN"></param>
        /// <param name="randomStr"></param>
        /// <returns></returns>
        public static DataTable getMsgByNameOfTheHandlerAndRandomStr(string pN,string randomStr) {
            string sqlStr = string.Format(@"SELECT prompt,flag,finish_flag FROM FINISH_MESSAGE where name_of_the_Handler= '{0}' and random_str ='{1}'", pN, randomStr);
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
      /// <summary>
      /// 
      /// </summary>
      /// <param name="nameOfTheHandler"></param>
        public static void clear(string nameOfTheHandler) {
            string sqlStr = string.Format(@"DELETE FROM FINISH_MESSAGE WHERE name_of_the_Handler = '{0}'", nameOfTheHandler);
            OracleDaoHelper.executeSQL(sqlStr);
        }
    }
}
