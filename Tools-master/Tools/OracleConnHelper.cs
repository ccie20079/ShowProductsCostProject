using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using Oracle.DataAccess.Client;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class OracleConnHelper
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
        //定义一个SqlServer Connection对象
        private static OracleConnection  conn;
     
        //连接字符串
        private static String oracleConnStr;
      /// <summary>
      /// 
      /// </summary>
        public OracleConnHelper() {

        }
        #region 初始化连接字符串
        private static void initConStr() {
            string host_Name =  XmlFlexflow.ReadXmlNodeValue("SERVER_NAME");
            string service_Name = XmlFlexflow.ReadXmlNodeValue("SERVICE_NAME");
            string user_Id = XmlFlexflow.ReadXmlNodeValue("USER_ID");
            string password = XmlFlexflow.ReadXmlNodeValue("PASSWORD");

            oracleConnStr = String.Format(@"Data Source=(DESCRIPTION="
              + "(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST={0} )(PORT=1521)))"
              + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME={1})));"
              + "User Id={2};Password={3};", host_Name,service_Name, user_Id, password);
        }
        #endregion
        #region 打开连接对象
        private static void openConn() {
            initConStr();
            conn = new OracleConnection(oracleConnStr);
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
        public static OracleConnection getConn()
        {
            openConn();
            return conn;
        }
        /// <summary>
        /// 获取一个单独的连接对象。
        /// </summary>
        /// <returns></returns>
        public static OracleConnection getTheConn()
        {
            initConStr();
            OracleConnection theConn = new OracleConnection(oracleConnStr);
            try
            {
                theConn.Open();
                return theConn;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return null;
            }
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
        public static void closeConn(OracleConnection conn) {
            if (conn != null && conn.State ==ConnectionState.Open)
                conn.Close();
        }
    }
}
