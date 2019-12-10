using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Tools;
namespace UpdateProgram
{
    static class Program
    {
        public static string ftpIPADDR;
        /// <summary>
        /// 应用程序的主入口点。此升级程序接收参数。
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            XmlFlexflow.configFilePath = Application.StartupPath + "\\flexflow.cfg";
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            ftpIPADDR = XmlFlexflow.ReadXmlNodeValue("FTP_IPADDR");
            Application.Run(new FrmUpdateProgram(args));
        }
    }
}
