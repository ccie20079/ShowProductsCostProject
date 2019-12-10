using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tools
{
    public class String_Byte_Helper
    {
        /// <summary>
        /// 将byte数组转为string类型
        /// </summary>
        /// <param name="bytes"></param>
        /// <returns></returns>
        public static string ByteToString(byte[] bytes)
        {
            StringBuilder strBuilder = new StringBuilder();
            foreach (byte bt in bytes)
            {
                strBuilder.AppendFormat("{0:X2}", bt);
            }
            return strBuilder.ToString();
        }
        /// <summary>
        /// 将string转为byte数组
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static byte[] StringToByte(string str)
        {
            byte[] bytes = new byte[str.Length / 2];
            for (int i = 0; i < str.Length / 2; i++)
            {
                int btvalue = Convert.ToInt32(str.Substring(i * 2, 2), 16);
                bytes[i] = (byte)btvalue;
            }
            return bytes;
        }
    }
}
