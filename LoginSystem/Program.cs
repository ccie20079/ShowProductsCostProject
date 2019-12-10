using LoginSystem.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using Tools;
namespace LoginSystem
{
    public static class Program
    {
        public static User_Info _userInfo;
        public static string IPADDR = NetHelper.getIPAddr();
        /// <summary>
        /// 应用程序的主入口点。
        /// </summary>
        [STAThread]
        static void Main()
        {
           Application.EnableVisualStyles();
           Application.SetCompatibleTextRenderingDefault(false);
           XmlFlexflow.configFilePath = Application.StartupPath + "\\flexflow.cfg";     
           string ftpIPAddr = XmlFlexflow.ReadXmlNodeValue("FTP_IPADDR");
            //检查软件版本
            string releaseVersion = String.Empty;
            MSG msg = CheckAppVerionByFTP.checkAppVersionAndOutReleaseVersion(ftpIPAddr, out releaseVersion);
           if (!msg.Flag)
           {
               MessageBox.Show(msg.Msg, "提示：", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
               return;
           }
           FormLogin frmLogin = new FormLogin();
           frmLogin.ShowDialog();
           if (DialogResult.OK != frmLogin.DialogResult)
           {
               //结束程序
               return;
           }
            //FrmMainOfProductsCost frmMainOfProductsCost = new FrmMainOfProductsCost();
            //Application.Run(frmMainOfProductsCost);
        }
    }
}
