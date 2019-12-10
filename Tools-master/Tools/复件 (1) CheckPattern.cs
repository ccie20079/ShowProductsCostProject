using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
namespace tools
{
    class CheckPattern
    {
        public static bool CheckNumber(string s)
        {
            string pattern = "^[0-9]*$";
            Regex rx = new Regex(pattern);
            return rx.IsMatch(s);
        }
        public static bool CheckFloat(string s)
        {
            string pattern = @"^-?\d+$|^(-?\d+)(\.\d+)?$";
            Regex rx = new Regex(pattern);
            return rx.IsMatch(s);
        }
        XmlFlexflow xff = new XmlFlexflow();
        public static void RecordLog(string str)
        {
            XmlFlexflow xff = new XmlFlexflow();
            string yy = DateTime.Now.Year.ToString();
            string mm = DateTime.Now.Month.ToString();
            string dd = DateTime.Now.Day.ToString();
            if (mm.Length == 1)
                mm = "0" + mm;
            if (dd.Length == 1)
                dd = "0" + dd;
            string date = yy + mm + dd;
            string logfilename = xff.ReadXmlNodeValue("LogPath") +"\\" + "FOX" + date + ".txt";
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
        //输入序列号，获取其中的一部分。
        public static String getSubStr(String SN,int startIndex,int length) {
            String result = "";
            result = SN.Substring(startIndex, length);
            return result;
        }
    }
}
