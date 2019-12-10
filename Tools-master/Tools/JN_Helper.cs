using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tools
{
    /// <summary>
    /// 用户处理工号中带 "_"的情形。
    /// </summary>
    public class JN_Helper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static string getJN(string _jN) {
            int index = _jN.IndexOf("_");
            if (index >= 0)
            {
                return _jN.Substring(index + 1);
            }
            return _jN;

        }
    }
}
