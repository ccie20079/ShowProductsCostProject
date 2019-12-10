using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class CheckPattern
    {
        /// <summary>
        /// 检查是否为数字。
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static bool CheckNumber(string s)
        {
            string pattern = "^[0-9]*$";
            Regex rx = new Regex(pattern);
            return rx.IsMatch(s);
        }
        /// <summary>
        /// 检查是否为Excel单元格的标示符。
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static bool checkExcelCellIndicate(string s)
        {
            string pattern = "^[A-Z]{1,2}[1-9]{1}[0-9]{0,2}$";
            Regex rx = new Regex(pattern);
            return rx.IsMatch(s);
        }
        /// <summary>
        /// 检查是否为Excel的列标识
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static bool checkColumnIndicate(string s)
        {
            string pattern = "^[A-Z]{1,2}$";
            Regex rx = new Regex(pattern);
            return rx.IsMatch(s);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dateStr"></param>
        /// <param name="dateValue"></param>
        /// <returns></returns>
        public static bool checkDateStr(string dateStr,out DateTime dateValue) {
            string pattern = "^[0-9]{6}$";
            Regex rx = new Regex(pattern);
            if (!rx.IsMatch(dateStr)) {
                dateValue = new DateTime();
                return false;
            }
            dateStr = "20" + dateStr;
            dateStr = dateStr.Substring(0, 4) + "-" + dateStr.Substring(4, 2) + "-" + dateStr.Substring(6, 2);
            if (!DateTime.TryParse(dateStr, out dateValue)) {
                return false;
            }
            return true;
        }
        /// <summary>
        /// 判断是否为时间字符串。
        /// </summary>
        /// <param name="timeStr"></param>
        /// <returns></returns>
        public static bool isTimeStr(string timeStr) {
            string pattern = "^[0-9]{2}:[0-9]{2}$";
            Regex rx = new Regex(pattern);
            return rx.IsMatch(timeStr);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static bool CheckFloat(string s)
        {
            string pattern = @"^-?\d+$|^(-?\d+)(\.\d+)?$";
            Regex rx = new Regex(pattern);
            return rx.IsMatch(s);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="str"></param>
        public static void RecordLog(string configFilePath,string str)
        {
            string yy = DateTime.Now.Year.ToString();
            string mm = DateTime.Now.Month.ToString();
            string dd = DateTime.Now.Day.ToString();
            if (mm.Length == 1)
                mm = "0" + mm;
            if (dd.Length == 1)
                dd = "0" + dd;
            string date = yy + mm + dd;
            string logfilename = XmlFlexflow.ReadXmlNodeValue("LogPath") +"\\" + "FOX" + date + ".txt";
            if (File.Exists(logfilename))
            {
                FileStream fsOutput = new FileStream(logfilename, FileMode.Append, FileAccess.Write);
                StreamWriter srOutput = new StreamWriter(fsOutput);
                srOutput.WriteLine("\r\n" + DateTime.Now.ToString() + ": " + str);
                srOutput.Close();
            }
            else
            {
                FileStream fsOutput = new FileStream(logfilename, FileMode.Append, FileAccess.Write);
                StreamWriter srOutput = new StreamWriter(fsOutput);
                srOutput.WriteLine("\r\n" + DateTime.Now.ToString() + ": " + str);
                srOutput.Close();
            }
        }
        /// <summary>
        /// /输入序列号，获取其中的一部分
        /// </summary>
        /// <param name="SN"></param>
        /// <param name="startIndex"></param>
        /// <param name="length"></param>
        /// <returns></returns>
        public static String getSubStr(String SN,int startIndex,int length) {
            String result = "";
            result = SN.Substring(startIndex, length);
            return result;
        }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="str1"></param>
       /// <param name="str2"></param>
       /// <param name="resultStr"></param>
       /// <returns></returns>
        public static bool checkStr(string str1, string str2,string resultStr) {
            //  \s 表示空白字符串。
            string pattern = "^" + str1 + "\\s*?" + str2 + "$";
            Regex rx = new Regex(pattern);
            return rx.IsMatch(resultStr.Trim());
        }
        /// <summary>
        /// 用于检查考勤记录表中A1单元格的命名规则。
        /// </summary>
        /// <param name="checkContent"></param>
        /// <returns></returns>
        public static bool isARXls(string checkContent)
        {
            string pattern = @"^考勤记录表[1-9]{1}$";
            Regex rx = new Regex(pattern);
            return rx.IsMatch(checkContent);
        }
        /// <summary>
        /// 检查计件文档命名是否 依据模式.
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public static bool checkFileNameOfYieldsReport(string fileName) {
            // 匹配 中文的正则表达式用Unicode来表示时，范围为[\u4e00-\u9fa5],[\u4e00-\u9fbb]
            if (Regex.IsMatch(fileName, "[1-9]组[1-9]月[\u4e00-\u9fa5]+")) return true;
            if (Regex.IsMatch(fileName, "[1-9]组1[0-2]月[\u4e00-\u9fa5]+")) return true;
            //再次匹配下面的模式.
            if (Regex.IsMatch(fileName, "1[0-9]组[1-9]月[\u4e00-\u9fa5]+")) return true;
            if (Regex.IsMatch(fileName, "1[0-9]组1[0-2]月[\u4e00-\u9fa5]+")) return true;
            return false;
        }

        #region 检查字符串中是否有一组，二组等字样
        /// <summary>
        /// 检查是否匹配部门 一组***
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static bool ifOtherDept(string name) {
            return Regex.IsMatch(name, @"^[1-9]组[\u4e00-\u9fbb]+$") || Regex.IsMatch(name, @"^[1-9][0-9]组[\u4e00-\u9fbb]+$");
        }
        #endregion
        #region
        /// <summary>
        /// 检查是否匹配部门 一组***
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static bool ifOtherDeptByDigit(string name)
        {
            string pattern = @"^[0-9]{1}$";
            Regex rx = new Regex(pattern);
            return rx.IsMatch(name);
        }
        #endregion
        
    }
}
