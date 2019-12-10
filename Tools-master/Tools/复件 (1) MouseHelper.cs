using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
namespace tools
{
    public class MouseHelper
    {
        [DllImport("user32.dll")]
        private static extern int mouse_event(int dwFlags, int dx, int dy, int cButtons, int dwExtraInfo);
        //public static extern bool GetCursorPos(out POINT lpPoint);
        [DllImport("user32.dll", EntryPoint = "SetCursorPos")]
        private static extern bool SetCursorPos(int X, int Y);
        public enum MouseEventFlags
        {
            MOVE = 0x0001,       //移动鼠标 
            LEFTDOWN = 0x0002,    //模拟鼠标左键按下 
            LEFTUP = 0x0004,      //模拟鼠标左键抬起 
            RIGHTDOWN = 0x0008,   //模拟鼠标右键按下 
            RIGHTUP = 0x0010,     //模拟鼠标右键抬起 
            MIDDLEDOWN = 0x0020,  //模拟鼠标中键按下 
            MIDDLEUP = 0x0040,    // 模拟鼠标中键抬起
            WHEEL = 0x0800,
            ABSOLUTE = 0x8000    //标示是否采用绝对坐标 
        }
        public static void clickThePoint(int x ,int y) {
            SetCursorPos(x, y);
            mouse_event(Convert.ToInt32(MouseEventFlags.LEFTDOWN | MouseEventFlags.ABSOLUTE), x, y , 0, IntPtr.Zero.ToInt32());
            mouse_event(Convert.ToInt32(MouseEventFlags.LEFTUP | MouseEventFlags.ABSOLUTE), x, y, 0, IntPtr.Zero.ToInt32());
        }
        public static void doubleClickThePoint(int x, int y) {
            SetCursorPos(x, y);
            mouse_event(Convert.ToInt32(MouseEventFlags.LEFTDOWN | MouseEventFlags.ABSOLUTE), x, y, 0, IntPtr.Zero.ToInt32());
            mouse_event(Convert.ToInt32(MouseEventFlags.LEFTUP | MouseEventFlags.ABSOLUTE), x, y, 0, IntPtr.Zero.ToInt32());
            mouse_event(Convert.ToInt32(MouseEventFlags.LEFTDOWN | MouseEventFlags.ABSOLUTE), x, y, 0, IntPtr.Zero.ToInt32());
            mouse_event(Convert.ToInt32(MouseEventFlags.LEFTUP | MouseEventFlags.ABSOLUTE), x, y, 0, IntPtr.Zero.ToInt32());   
        }
        public static void Move(int x, int y) {
            SetCursorPos(x, y);
        }
    }
}
