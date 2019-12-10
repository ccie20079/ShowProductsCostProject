using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.ComponentModel;
namespace Tools
{
    /// <summary>
    /// 此类用于下载最新的版本，和初始化连接字符串。
    /// </summary>
    public class DownloadTheLatestApp
    {
        static BackgroundWorker bgWorker = new BackgroundWorker();  
       /// <summary>
    /// 判断是否可以连接上Mes库
    /// </summary>
        public static bool flag_open_mesSqlConn = false;
        static string releaseVersion;
        /// <summary>
        /// 下载最新版,初始化连接字符串.
        /// </summary>
        /// <returns></returns>
        public static bool downloadTheLatestVersionAndInitConnStr() {

            //=====================================================================
            // Project Name        :    BaseDao  
            // Project Description : 
            // Class Name          :    Class1
            // File Name           :    Class1
            // Namespace           :    BaseDao 
            // Class Version       :    v1.0.0.0
            // Class Description   : 
            // CLR                 :    4.0.30319.42000  
            // Author              :    董   魁  (ccie20079@126.com)
            // Addr                :    中国  陕西 咸阳    
            // Create Time         :    2019-10-22 14:57:19
            // Modifier:     
            // Update Time         :    2019-10-22 14:57:19
            //======================================================================
            // Copyright © DGCZ  2019 . All rights reserved.
            // =====================================================================
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            if (!File.Exists(Application.StartupPath + "\\flexflow.cfg"))
            {
                MessageBox.Show(string.Format(@"文件：{0},未找到!", Application.StartupPath + "\\flexflow.cfg"), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            XmlFlexflow.configFilePath = Application.StartupPath + "\\flexflow.cfg";      
            string ftpIPADDR = XmlFlexflow.ReadXmlNodeValue("FTP_IPADDR");
            releaseVersion = string.Empty;
            //先测试是否可以ping通
            if (!ConnectByPing.pingTheAddress(ftpIPADDR))
            {
               MessageBox.Show("未能与版本服务器: "+ftpIPADDR+"取得联系!", "提示: ", MessageBoxButtons.OK, MessageBoxIcon.Information);
               return false;
            }
            //检查软件版本
            MSG msg = CheckAppVerionByFTP.checkAppVersionAndOutReleaseVersion(ftpIPADDR, out releaseVersion);
            if (!msg.Flag)
            {
                if (!msg.Msg.Contains("更新"))
                {
                    return false;
                }
                //自动升级。
                //判断是否存在update文件
                if (!Directory.Exists(Application.StartupPath + "\\update"))
                {
                    //给出提示：
                    MessageBox.Show("未发现升级目录: " + Application.StartupPath + "\\update", "提示：",MessageBoxButtons.OK,MessageBoxIcon.Information);
                    return false;
                }
                //进行升级
                CmdHelper.LaunchBatOrExe(string.Format(@"{0}\update\UpdateProgram.exe", Application.StartupPath), Application.ProductName + " " + releaseVersion);
                //进行升级时，也需要退出，防止覆盖时，提示文件正在使用中。
                return false;
            }
            return true;
        }
    }
}
