using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace tools
{
	public class SendMouseEvent
	{
		[DllImport("user32.dll")]
		static extern void mouse_event(MouseEventFlag flags, int dx, int dy, uint data, UIntPtr extraInfo);
		[Flags]
		public enum MouseEventFlag : uint
		{
			Move = 0x0001,
			LeftDown = 0x0002,
			LeftUp = 0x0004,
			RightDown = 0x0008,
			RightUp = 0x0010,
			MiddleDown = 0x0020,
			MiddleUp = 0x0040,
			XDown = 0x0080,
			XUp = 0x0100,
			Wheel = 0x0800,
			VirtualDesk = 0x4000,
			Absolute = 0x8000
		}

		/// <summary>
		/// Send mouse event 
		/// </summary>
		/// <param name="mouseEventFlag">motion and click options</param>
		/// <param name="dx">horizontal position or change,value 0~65535</param>
		/// <param name="dy">vertical position or change,value 0~65535</param>
		/// <param name="dwData">wheel movement</param>
		public static void Send(MouseEventFlag mouseEventFlag,int dx,int dy,uint dwData)
		{
			mouse_event(mouseEventFlag | MouseEventFlag.Absolute, dx, dy, dwData, UIntPtr.Zero);
		}

		public static void MoveTo(uint scceenTop, uint screenLeft)
		{
			int x = scceenTop == 0 ? 0 : (int)((float)scceenTop / (float)Screen.PrimaryScreen.Bounds.Height * (float)65535);
			int y = screenLeft == 0 ? 0 : (int)((float)screenLeft / (float)Screen.PrimaryScreen.Bounds.Width * (float)65535);
			mouse_event(MouseEventFlag.Move | MouseEventFlag.Absolute, x, y, 0, UIntPtr.Zero);
		}

		public static void Click()
		{
			LeftDown();LeftUp();
		}

		public static void DoubleClick()
		{
			Click(); Click();
		}

		public static void LeftDown()
		{
			 mouse_event(MouseEventFlag.LeftDown, 0, 0, 0, UIntPtr.Zero);
		}

		public static void LeftUp()
		{
			mouse_event(MouseEventFlag.LeftUp, 0, 0, 0, UIntPtr.Zero);
		}

		public static void RightDown()
		{
			mouse_event(MouseEventFlag.RightDown, 0, 0, 0, UIntPtr.Zero);
		}

		public static void RightUp()
		{
			mouse_event(MouseEventFlag.RightUp, 0, 0, 0, UIntPtr.Zero);
		}

		public static void MiddleDown()
		{
			mouse_event(MouseEventFlag.RightDown, 0, 0, 0, UIntPtr.Zero);
		}

		public static void MiddleUp()
		{
			mouse_event(MouseEventFlag.RightUp, 0, 0, 0, UIntPtr.Zero);
		}
	}
}
