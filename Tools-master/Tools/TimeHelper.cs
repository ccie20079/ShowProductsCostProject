using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class TimeHelper
    {
        #region 判断时间点是早上,还是下午.
        /// <summary>
        /// 
        /// </summary>
        /// <param name="timeStr"></param>
        /// <returns></returns>
        public static bool ifMorning(string timeStr)
        {
            string[] timeArray = timeStr.Split(':');
            int hour = int.Parse(timeArray[0]);
            int minute = int.Parse(timeArray[1]);
            int second = int.Parse(timeArray[2]);

            int year = DateTime.Now.Year;
            int month = DateTime.Now.Month;
            int day = DateTime.Now.Day;

            DateTime dt = new DateTime(year, month, day, hour, minute, second);
            DateTime dtNoon = new DateTime(year, month, day, 12, 0, 0);

            if (dt < dtNoon) return true;
            return false;
        }
        #endregion
        /// <summary>
        /// 返回报表的年份与月份,如2018-07
        /// </summary>
        /// <param name="month"></param>
        /// <returns></returns>
        public static string getYearAndMonthStr(int month)
        {
            string result = string.Empty;
            int thisYear = DateTime.Now.Year;
            //当前日期.
            DateTime currentDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            DateTime thisYearDate = new DateTime(DateTime.Now.Year, month, 1);
            DateTime lastYearDate = new DateTime(DateTime.Now.Year - 1, month, 1);

            if (thisYearDate > currentDate)
            {
                //今年的此月>当前日期,则日期应为去年的.
                return lastYearDate.ToString("yyyy-MM");
            }
            if (thisYearDate == currentDate)
                return currentDate.ToString("yyyy-MM");
            return thisYearDate.ToString("yyyy-MM");
        }
        /// <summary>
        /// 获取当前时间字符串 190402142431
        /// </summary>
        /// <returns></returns>
        public static string getCurrentTimeStr() {
            return DateTime.Now.ToString("yyyyMMddHHmmss").Substring(2);
        }
    }
}
