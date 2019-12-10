using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
namespace tools
{
    public class ConnHelper
    {
        //定义一个SqlServer Connection对象
        private static SqlConnection conn;
     
        //连接字符串
        private static String connStr;
        public ConnHelper() {

        }
        #region 初始化连接字符串
        private static void initConStr() {
            XmlFlexflow xff = new XmlFlexflow();
            connStr += "Server=" + xff.ReadXmlNodeValue("SERVER_NAME") + ";";
            connStr += "database=" + xff.ReadXmlNodeValue("DATABASE_NAME") + ";";
            connStr += "User ID=" + xff.ReadXmlNodeValue("USER_ID") + ";";
            connStr += "password=" + xff.ReadXmlNodeValue("PASSWORD");
            //conStr += "password=" + QuanSheng.UtilityManager.Security.DecryptString(xff.ReadXmlNodeValue("PASSWORD"));
            //conStr=System.Configuration.ConfigurationManager
        }
        #endregion
        #region 打开连接对象
        private static void openConn() {
            initConStr();
            conn = new SqlConnection(connStr);
            try
            {
                conn.Open();
            }
            catch (Exception ex) {
                MessageBox.Show(ex.ToString(),"提示：",MessageBoxButtons.OK,MessageBoxIcon.Information);
            }
        } 
        #endregion  
        /// <summary>
        /// 获取已经打开的连接对象。
        /// </summary>
        /// <returns></returns>
        public static SqlConnection getConn()
        {
            openConn();
            return conn;
        }
        /// <summary>
        /// 关闭连接对象。
        /// </summary>
        public static void closeConn(){
            if (conn != null &&  conn.State == ConnectionState.Open)
                conn.Close();
        }
        /// <summary>
        /// 关闭指定的链接对象
        /// </summary>
        /// <param name="conn"></param>
        public static void closeConn(SqlConnection conn) {
            if (conn != null && conn.State ==ConnectionState.Open)
                conn.Close();
        }
  
    }
}
