using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class MySendKeys
    {
        /// <summary>
        /// 发送Alt+Tab
        /// </summary>
        public static void sendAltAndTab() {
            SendKeys.SendWait("%{TAB}");
        }
        /// <summary>
        /// 发送回车。
        /// </summary>
        public static void sendEnter() {
            SendKeys.SendWait("{ENTER}");
        }
    }
}
