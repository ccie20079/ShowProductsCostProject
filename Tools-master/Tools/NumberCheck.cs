using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tools
{
    /// <summary>
    /// 检查是否为数字。
    /// </summary>
    public class NumberCheck
    {
        /// <summary>
        /// 判斷是否為為數字形式。
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        #region isNum
        public static bool isNum(String str)
        {
            for (int i = 0; i < str.Length; i++)
            {
                Byte temp = Convert.ToByte(str[i]);
                if (temp < 48 || temp > 57)
                {
                    return false;
                }
            }
            return true;
        } 
        #endregion
    }
}
