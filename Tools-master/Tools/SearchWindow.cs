using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class SearchWindow
    {
        private const int WM_Close = 0x0010;
        [DllImport("User32.dll ", EntryPoint = "FindWindow")]
        private static extern IntPtr FindWindow(string lpClassName,
        string lpWindowName);
        [DllImport("user32.dll", EntryPoint = "SendMessageA")]
        private static extern int SendMessage(IntPtr hwnd, int wMsg, IntPtr wParam, string lParam);
        /// <summary>
        /// 
        /// </summary>
        public SearchWindow()
        {

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="lpClassName"></param>
        /// <param name="lpWindowName"></param>
        public void closeWindow(string lpClassName, string lpWindowName)
        {

            IntPtr Mhandle = FindWindow(null, lpWindowName);
            if (Mhandle != IntPtr.Zero)
                SendMessage(Mhandle, WM_Close, IntPtr.Zero, null);
            else
            {
                return;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="lpClassName"></param>
        /// <param name="lpWindowName"></param>
        public bool closeWindowByWindowName(string lpClassName, string lpWindowName)
        {

            IntPtr Mhandle = FindWindow(null, lpWindowName);
            if (Mhandle != IntPtr.Zero) {
                SendMessage(Mhandle, WM_Close, IntPtr.Zero, null);
                return true;
            }
            return false;
        }
    }
}
