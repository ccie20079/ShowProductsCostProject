using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.DataAccess.Client;
using System.Data;
using System.Windows.Forms;
using System.EnterpriseServices;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class OracleHelper
    {
        //私有构造器
        private OracleHelper()
        {
        }
        //单例模式
        private static OracleHelper instance;
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static OracleHelper getBaseDao()
        {
            if (instance == null)
            {
                instance = new OracleHelper();
            }
            return instance;
        }
        /// <summary>
        /// SQL语句执行方法。
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public int ExecuteNonQuery(string strSQL)
        {
            int val = 0;
            OracleCommand cmd = new OracleCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL;
            using (OracleConnection conn = OracleConnHelper.getConn())
            {
                cmd.Connection = conn;
                try
                {
                    val = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    throw new Exception(ex.ToString());
                }
                finally
                {
                    cmd.Dispose();
                    OracleConnHelper.closeConn(conn);
                }
                return val;
            }
        }
        /// <summary>
        /// 存储过程执行方法,传入参数集合。
        /// </summary>
        /// <param name="procName"></param>
        /// <param name="cmdParms"></param>
        /// <returns></returns>
        public int ExecuteNonQuery(string procName, OracleParameter[] cmdParms)
        {
            int val = 0;
            OracleCommand cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            using (OracleConnection conn = OracleConnHelper.getConn())
            {
                CreateCommand(cmd, conn, null, procName, cmdParms);
                try
                {
                    val = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    throw new Exception(ex.ToString());
                }
                finally
                {
                    cmd.Parameters.Clear();
                    cmd.Dispose();
                    OracleConnHelper.closeConn(conn);
                }
                return val;
            }
        }
      /// <summary>
      /// 本方法将利用事务解决.
      /// </summary>
      /// <param name="procName"></param>
      /// <param name="cmdParms"></param>
      /// <param name="conn"></param>
      /// <returns></returns>
        public int ExecuteSPWithSpecificConn(string procName, OracleParameter[] cmdParms,OracleConnection conn)
        {
            int val = 0;
            OracleCommand cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            CreateCommand(cmd, conn, null, procName, cmdParms);
            try
            {
                    val = cmd.ExecuteNonQuery();
                }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                throw new Exception(ex.ToString());
            }
            finally
            {
                cmd.Parameters.Clear();
                cmd.Dispose();
            }
            return val;
        }
        /// <summary>
        /// 带事务处理的command
        /// </summary>
        /// <param name="cmd"></param>
        /// <param name="con"></param>
        /// <param name="trans"></param>
        /// <param name="procName"></param>
        /// <param name="cmdParms"></param>
        public void CreateCommand(OracleCommand cmd, OracleConnection con, OracleTransaction trans, string procName, OracleParameter[] cmdParms)
        {
            if (con.State != ConnectionState.Open)
                con.Open();
            cmd.Connection = con;
            cmd.CommandText = procName;
            /*
            if (trans != null)
            {
                //OracleCommand的Transaction是只读的。
                cmd.Transaction = trans;
            }
            */
            cmd.CommandType = CommandType.StoredProcedure;

            if (cmdParms != null)
            {
                foreach (OracleParameter parm in cmdParms)
                    cmd.Parameters.Add(parm);
            }
            
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="procName"></param>
        /// <param name="cmdParams"></param>
        /// <returns></returns>
        public DataTable getDT(string procName,OracleParameter[] cmdParams) {
            OracleCommand cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            using (OracleConnection conn = OracleConnHelper.getConn()) {
                CreateCommand(cmd, conn, null, procName, cmdParams);
                try
                {
                    OracleDataReader odr = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(odr);
                    return dt;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    throw new Exception(ex.ToString());
                }
                finally
                {
                    cmd.Parameters.Clear();
                    cmd.Dispose();
                    OracleConnHelper.closeConn(conn);
                }
            }
        }
        /// <summary>
        /// 从指定的连接获取DataTable
        /// </summary>
        /// <param name="procName"></param>
        /// <param name="cmdParams"></param>
        /// <param name="conn"></param>
        /// <returns></returns>
        public DataTable getDTBySepecificConn(string procName, OracleParameter[] cmdParams,OracleConnection conn)
        {
            OracleCommand cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            CreateCommand(cmd, conn, null, procName, cmdParams);
                try
                {
                    OracleDataReader odr = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(odr);
                    return dt;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    throw new Exception(ex.ToString());
                }
                finally
                {
                    cmd.Parameters.Clear();
                    cmd.Dispose();
                }
        }
    }
}