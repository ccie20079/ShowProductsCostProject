using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Oracle.DataAccess.Client;
using System.Windows.Forms;
namespace Tools
{
    #region Version Info
    //=====================================================================
    // Project Name        :    Tools  
    // Project Description : 
    // Class Name          :    test
    // File Name           :    test
    // Namespace           :    Tools 
    // Class Version       :    v1.0.0.0
    // Class Description   : 
    // CLR                 :    4.0.30319.42000  
    // Author              :    董   魁  (ccie20079@126.com)
    // Addr                :    中国  陕西 咸阳    
    // Create Time         :    2019-10-22 14:45:42
    // Modifier:     
    // Update Time         :    2019-10-22 14:45:42
    //======================================================================
    // Copyright © DGCZ  2019 . All rights reserved.
    // =====================================================================
    #endregion
        /// <summary>
        /// 
        /// </summary>
    public class OracleDaoHelper
    {
        ///定义连接字符串
        public static string conn_str =String.Empty;
        /*"";*/
        /// <summary>
        /// 补充无参构造器
        /// </summary>
        public OracleDaoHelper() {
            //这里可以写一写，预先实现的方法。
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ipAddress"></param>
        /// <param name="service_name"></param>
        /// <param name="user_ID"></param>
        /// <param name="password"></param>
        public OracleDaoHelper(string ipAddress,string service_name,string user_ID,string password) {
            conn_str = String.Format(@"Data Source=(DESCRIPTION="
           + "(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST={0})(PORT=1521)))"
           + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME={1})));"
           + "User Id={2};Password={3};",ipAddress,service_name,user_ID,password);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sqlStr"></param>
        /// <returns></returns>
        public static DataTable getDTBySql(String sqlStr)
        {
            DataTable dt = new DataTable();
            try {
                //3  给出执行过程
                using (OracleConnection conn = new OracleConnection(conn_str))
                {
                    conn.Open();
                    using (OracleDataAdapter da = new OracleDataAdapter(sqlStr, conn))
                    {
                        da.Fill(dt);
                    }
                }
            }
            catch (Exception ex) {
                MessageBox.Show(ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                throw;
            }
            return dt;
        }
        /// <summary>
        /// 执行某个SQL语句。
        /// </summary>
        /// <param name="sqlStr"></param>
        /// <returns></returns>
        public static int executeSQL(string sqlStr) {
            int affectedRow = 0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
            try
            {
                using (OracleConnection conn = new OracleConnection(conn_str))
                {
                    conn.Open();
                    using (OracleCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sqlStr;
                        affectedRow = cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                //Console.WriteLine(sqlStr);
                MessageBox.Show(ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                throw new Exception(ex.ToString());
            }
            return affectedRow;
        }
        /// <summary>
        /// 执行某个SQL语句。
        /// </summary>
        /// <param name="sqlStr"></param>
        /// <returns></returns>
        public static OracleDataReader getDR(string sqlStr,out OracleConnection conn)
        {
            OracleDataReader dr = null;
            conn = new OracleConnection(conn_str);
            try
            {
                conn.Open();
                using (OracleCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = sqlStr;
                    dr = cmd.ExecuteReader();
                }
            }
            catch (Exception ex)
            {
                //Console.WriteLine(sqlStr);
                MessageBox.Show(ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                throw new Exception(ex.ToString());
            }
            return dr; 
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sqlStr"></param>
        /// <param name="conn"></param>
        /// <returns></returns>
        public static int executeSQLThrowExceptioin(string sqlStr, OracleConnection conn)
        {
            int affectedRow = 0;
            try
            {
                    if(ConnectionState.Closed.Equals(conn.State)) conn.Open();
                    using (OracleCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sqlStr;
                        affectedRow = cmd.ExecuteNonQuery();
                    }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                throw new Exception(ex.ToString());
            }
            return affectedRow;
        }
        /// <summary>
        /// 执行某个SQL语句,在指定的连接下，并将异常上抛，用于处理事务中的异常。
        /// </summary>
        /// <param name="sqlStr"></param>
        /// <param name="conn"></param>
        /// <returns></returns>
        public static int executeSQLBySpecificConn(string sqlStr,OracleConnection conn)
        {
            int affectedRow = 0;
            try
            {
                if  (ConnectionState.Closed==conn.State) conn.Open();
                using (OracleCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = sqlStr;
                    affectedRow = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                throw new Exception(ex.ToString());
            }
            return affectedRow;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="tableName"></param>
        public static void noLogging(string tableName) {
            string sqlStr = string.Format(@"alter table {0} nologging",tableName);
            executeSQL(sqlStr);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="tableName"></param>
        public static void logging(string tableName) {
            string sqlStr = string.Format(@"alter table {0} logging", tableName);
            executeSQL(sqlStr);
        }
    }
}
