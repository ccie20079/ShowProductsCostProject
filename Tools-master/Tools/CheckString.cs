using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class CheckString
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public static bool CheckStringChinese(string text) {
            bool res = false;
            foreach (char t in text) {
                if ((int)t > 127)
                    res = true;
            }
            return res;
            ;
        }
        /*
        public bool CheckStringChinese(string text){
            bool res = false;
            for(int i=0;i<text.length;i++){
                if((int)text[i]>127)
                    res = true;
            }
            return res;
        }
        public bool CheckStringChineseUn(string text){
            bool res = false;
            foreach(char t in text){
                if(t>=0x4e00 && t<= 0x9fbb){
                    res = true;
                    break;
                }
            }
            return res;
        }
        public bool CheckStringChineseReg(string text){
            bool res = false;
            if(Regex.IsMatch(text,@"[\u4e00-\u9fbb]+$"))
                res = true;
            return res;
        }
        */
        /// <summary>
        /// 
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public static bool CheckARName(string text)
        {
            bool res = false;
            if (Regex.IsMatch(text, @"[\u4e00-\u9fbb]*[1-9]+$"))
                res = true;
            return res;
        }
        /// <summary>
        /// 检查字符串是否符合"yyyy-MM-dd"日期格式
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public static bool checkYear(string year) {
            bool res = false;
            if (Regex.IsMatch(year, @"^201[8-9]$") || Regex.IsMatch(year, @"^20[2-9][0-9]$") || Regex.IsMatch(year, @"^2[1-9][0-9][0-9]$") || Regex.IsMatch(year, @"^[3-9][0-9][0-9][0-9]$")) {
                res = true;
            }
            return res;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="month"></param>
        /// <returns></returns>
        public static bool checkMonth(string month) {
            bool res = false;
            if (Regex.IsMatch(month, @"^[1-9]$") || Regex.IsMatch(month, @"^1[0-2]$")) {
                res = true;
            }
            return res;
        }
        /// <summary>
        /// 检查天。
        /// </summary>
        /// <param name="day"></param>
        /// <returns></returns>
        public static bool checkDay(string day)
        {
            bool res = false;
            if (Regex.IsMatch(day, @"^[1-9]$") || Regex.IsMatch(day, @"^[1-2][0-9]$")||Regex.IsMatch(day,@"^[3][0-1]$"))
            {
                res = true;
            }
            return res;
        }
        /// <summary>
        /// [\u4e00-\u9fa5]
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static bool checkIfContainsTheOtherDeptInName(string name) {
            if (Regex.IsMatch(name, @"^[1-9]组[\u4e00-\u9fbb]+$")|| Regex.IsMatch(name, @"^[1-9][0-9]组[\u4e00-\u9fbb]+$")){
                return true;
            }
            return false;
        }
    }
}
