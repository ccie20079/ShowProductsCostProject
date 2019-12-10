using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class DateTimeHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dtStr"></param>
        /// <returns></returns>
        public static string getDateStr(string dtStr) {
            string result = string.Empty;
            int blankIndex = dtStr.IndexOf(' ');
            result = dtStr.Substring(0, blankIndex);
            return result;
        }
    }
}
