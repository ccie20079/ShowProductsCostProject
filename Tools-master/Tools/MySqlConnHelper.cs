using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using System.Windows.Forms;
using System.Data;
namespace Tools
{
    public class MySqlConnHelper
    {
        //定义一个MySql Connection对象
        private static MySqlConnection mysqlConn;
        //连接字符串
        private static String connStr;
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        //获取mySql连接对象
        public static MySqlConnection getConn()
        {
            openConn();
            return mysqlConn;
        }
        private static void initConStr()
        {
            connStr += "Server=" + XmlFlexflow.ReadXmlNodeValue("SERVER_NAME") + ";";
            connStr += "database=" + XmlFlexflow.ReadXmlNodeValue("DATABASE_NAME") + ";";
            connStr += "User ID=" + XmlFlexflow.ReadXmlNodeValue("USER_ID") + ";";
            connStr += "password=" + XmlFlexflow.ReadXmlNodeValue("PASSWORD")+";";
            connStr += "Allow User Variables = true;";
            //conStr += "password=" + QuanSheng.UtilityManager.Security.DecryptString(xff.ReadXmlNodeValue("PASSWORD"));
            //conStr=System.Configuration.ConfigurationManager
        }
        private static void openConn()
        {
            initConStr();
            mysqlConn = new MySqlConnection(connStr);
            try
            {
                mysqlConn.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
        /// <summary>
        /// 关闭连接对象。
        /// </summary>
        public static void closeConn()
        {
            if (mysqlConn != null && mysqlConn.State ==ConnectionState.Open )
                mysqlConn.Close();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="conn"></param>
        public static void closeConn(MySqlConnection conn) {
            if (conn != null && conn.State == ConnectionState.Open) {
                conn.Close();
            }      
        }
    }
}
