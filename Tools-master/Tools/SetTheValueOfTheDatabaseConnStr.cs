//=====================================================================
// SolutionName        :    $SpecificSolutionName$
// Project Name        :    Tools
// Project Description : 
// Class Name          :    InitDataBaseConnStr
// File Name           :    InitDataBaseConnStr
// Namespace           :    Tools
// Class Version       :    v1.0.0.0
// Class Description   :    $Parameter$
// CLR                 :    4.0.30319.42000
// Author              :    董   魁  (ccie20079@126.com)
// Addr                :    中国  陕西 咸阳    
// Create Time         :     2019/11/16 10:03:09
// Modifier:                 Administrator
// Update Time         :     2019/11/16 10:03:09
//======================================================================
// Copyright © CZDG-PC  2019 . All rights reserved.
// =====================================================================
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
namespace Tools
{
    /// <summary>
    /// 为oracle,SqlServer 数据库的连接字符串赋值
    /// </summary>
    public class SetTheValueOfTheDatabaseConnStr
    {
        /// <summary>
        ///  OracleDaoHelper,SqlDaoHelper 数据库的连接字符串赋值
        /// </summary>
        /// <returns></returns>
        public static bool setTheValueOfTheConnStr()
        {
            #region 数据库联接测试。
            string host_Name = XmlFlexflow.ReadXmlNodeValue("SERVER_NAME");
            string service_Name = XmlFlexflow.ReadXmlNodeValue("SERVICE_NAME");
            string user_Id = XmlFlexflow.ReadXmlNodeValue("USER_ID");
            string password = XmlFlexflow.ReadXmlNodeValue("PASSWORD");

            string mes_host_Name = XmlFlexflow.ReadXmlNodeValue("MES_SERVER_NAME");
            string mes_db_Name = XmlFlexflow.ReadXmlNodeValue("MES_DATABASE_NAME");
            string mes_user_Id = XmlFlexflow.ReadXmlNodeValue("MES_USER_ID");
            string mes_password = XmlFlexflow.ReadXmlNodeValue("MES_PASSWORD");
            XmlFlexflow.configFilePath = System.Windows.Forms.Application.StartupPath + "\\flexflow.cfg";
            //先测试是否可以ping通
            if (!ConnectByPing.pingTheAddress(mes_host_Name))
            {
                MessageBox.Show("与" + host_Name + " 连接失败!", "提示: ", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            #endregion
            //再这个启动类里，对对象进行初始化。
            OracleDaoHelper daoHelper = new OracleDaoHelper(host_Name, service_Name, user_Id, password);
            SqlDaoHelper sqlHelper = new SqlDaoHelper(mes_host_Name, mes_db_Name, mes_user_Id, mes_password);
            SqlConnection sqlConn = new SqlConnection(SqlDaoHelper.conn_str);
            try
            {
                sqlConn.Open();
                sqlConn.Close();
                sqlConn.Dispose();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                MessageBox.Show("基于MES_制卡系统中的所属部门，组将无法获取");
                return false;
            }
        }
    }
}
