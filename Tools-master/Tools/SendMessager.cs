using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
namespace Tools
{
    public class SendMessager
    {
        [DllImport("User32.dll")]
        public static extern int SendMessage(IntPtr hWnd, uint Msg, int wParam, int lParam);
        [DllImport("User32.DLL", EntryPoint = "FindWindowEx")]
        public static extern IntPtr FindWindowEx(IntPtr hwndParent,
            IntPtr hwndChildAfter, string lpszClass, string lpszWindow);
        [DllImport("User32.dll", EntryPoint = "FindWindow")]
        public static extern IntPtr FindWindow(String lpClassName, String lpWindowName);
        //Win32 API函数
        [DllImport("User32.dll", EntryPoint = "SendMessage")]
        public  static extern int SendMessage(int hWnd, int Msg, int wParam, ref COPYDATASTRUCT lParam);

        [DllImport("User32.dll", EntryPoint = "SendMessage")]
        public static extern int SendMessage(int hWnd, int Msg, int wParam, String s);
        [DllImport("User32.dll", EntryPoint = "SendMessage")]
        public static extern int SendMessage(int hWnd, int Msg, int wParam,int lparam);
     
        [DllImport("User32.dll",EntryPoint="SetFocus")]
        public  static extern long SetFocus (long hwnd);

        [DllImport("User32.dll", EntryPoint = "SetForegroundWindow")]
        public static extern long SetForegroundWindow(long hwnd);

        [DllImport("User32.dll", EntryPoint = "SetActiveWindow")]
        public static extern long SetActiveWindow(long hwnd);

    }
}
