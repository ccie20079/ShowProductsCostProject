using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace Tools
{
    /// <summary>
/// 获取条件
/// </summary>
    public class StringHelper
    {
        /// <summary>
        /// 获取条件 SQL 语句中的条件.
        /// </summary>
        /// <param name="queue"></param>
        /// <returns></returns>
        public static string getConditionStr(Queue queue) {
            StringBuilder sb = new StringBuilder("("); 
            for (int i=0;i<=queue.Count-1;i++) {
                sb.Append("'");
                sb.Append(queue.Dequeue());
                sb.Append("',");
            }
            sb.Remove(sb.Length - 1, 1);
            sb.Append(")");
            return sb.ToString();
        }
        #region 获取字符串中含有多少个指定的字符
        /// <summary>
        /// 
        /// </summary>
        /// <param name="str">待检查的字符串</param>
        /// <param name="searchStr">指定的字符</param>
        /// <returns></returns>
        public static  int getSpecificChar(string str,string searchStr) {
            Regex rg = new Regex(searchStr);
            MatchCollection mC = rg.Matches(str);
            return mC.Count;
        }
        #endregion
        #region 给定年月日，获取yyyy-MM-dd的年月日格式
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dateStr"></param>
        /// <returns></returns>
        public static string getDate(string dateStr) {
            return dateStr.Substring(0, 4) + "-" + dateStr.Substring(4, 2) + "-" + dateStr.Substring(6, 2);
        }
        #endregion
        #region 替换字符串中的空格
        public static string removeBlank(string str) {
            return Regex.Replace(str, @"\s+", "");
        }
        #endregion
    }
}
