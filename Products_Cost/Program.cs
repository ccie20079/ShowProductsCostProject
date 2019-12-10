using LoginSystem.Entities;
using System;
using System.Windows.Forms;
using Tools;
namespace Products_Cost
{
    static class Program
    {
        //=====================================================================
        // Project Name        :    Products_Cost  
        // Project Description : 
        // Class Name          :    Class1
        // File Name           :    Class1
        // Namespace           :    Products_Cost 
        // Class Version       :    v1.0.0.0
        // Class Description   : 
        // CLR                 :    4.0.30319.42000  
        // Author              :    董   魁  (ccie20079@126.com)
        // Addr                :    中国  陕西 咸阳    
        // Create Time         :    2019-10-22 15:15:12
        // Modifier:     
        // Update Time         :    2019-10-22 15:15:12
        //======================================================================
        // Copyright © DGCZ  2019 . All rights reserved.
        // =====================================================================
        public static User_Info _userInfo;
        /// <summary>
        /// 应用程序的主入口点。
        /// </summary>
        [STAThread]
        static void Main()
        {
            XmlFlexflow.configFilePath = Application.StartupPath + "\\flexflow.cfg";
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            bool resultFlag = DownloadTheLatestApp.downloadTheLatestVersionAndInitConnStr();
            if (!resultFlag) return;
            //设置连接数据库字符串的值.
            SetTheValueOfTheDatabaseConnStr.setTheValueOfTheConnStr();
            doNext();
        }
        /// <summary>
        /// 
        /// </summary>
        static void doNext()
        {
            FormLogin frmLogin = new FormLogin();
            frmLogin.ShowDialog();
            if (DialogResult.OK != frmLogin.DialogResult)
            {
                //结束程序
                return;
            }
            FrmMainOfProductsCost frmMainOfProductsCost = new FrmMainOfProductsCost();
            Application.Run(frmMainOfProductsCost);
        }
    }
}
