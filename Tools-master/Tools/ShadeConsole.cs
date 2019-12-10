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
    public class ShadeConsole
    {
        [DllImport("user32.dll", EntryPoint = "ShowWindow", SetLastError = true)]
        static extern bool ShowWindow(IntPtr hWnd, uint nCmdShow);
        [DllImport("user32.dll", EntryPoint = "FindWindow", SetLastError = true)]
       
        public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);
        /// <summary>
        /// 
        /// </summary>
        public void shade()
        {
            Console.Title = "consoleWin";
            IntPtr cwInptr = FindWindow("ConsoleWindowClass", "consoleWin");
            if (cwInptr != IntPtr.Zero)
            {
                ShowWindow(cwInptr, 0);
            }
        }
    }
}
