using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class CapitalDigitalToArabicNumerals
    {
        /// <summary>
        /// 只支持一到十五。
        /// </summary>
        /// <param name="CapitalDigital"></param>
        public static void changeToArabicNumerals(ref string CapitalDigital) {
            switch (CapitalDigital) {
                case "十九":
                    CapitalDigital = "19";
                    break;
                case "十八":
                    CapitalDigital = "18";
                    break;
                case "十七":
                    CapitalDigital = "17";
                    break;
                case "十六":
                    CapitalDigital = "16";
                    break;
                case "十五":
                    CapitalDigital = "15";
                    break;
                case "十四":
                    CapitalDigital = "14";
                    break;
                case "十三":
                    CapitalDigital = "13";
                    break;
                case "十二":
                    CapitalDigital = "12";
                    break;
                case "十一":
                    CapitalDigital = "11";
                    break;
                case "十":
                    CapitalDigital = "10";
                    break;
                case "九":
                    CapitalDigital = "9";
                    break;
                case "八":
                    CapitalDigital = "8";
                    break;
                case "七":
                    CapitalDigital = "7";
                    break;
                case "六":
                    CapitalDigital = "6";
                    break;
                case "五":
                    CapitalDigital = "5";
                    break;
                case "四":
                    CapitalDigital = "4";
                    break;
                case "三":
                    CapitalDigital = "3";
                    break;
                case "二":
                    CapitalDigital = "2";
                    break;
                case "一":
                    CapitalDigital = "1";
                    break;
                default:
                    //不是数字，什么也不做。
                    break;
            }
        }
        #region 将字符串中的大写数字用阿拉伯数字取代.
        /// <summary>
        /// 
        /// </summary>
        /// <param name="str"></param>
        public static  void replaceByArabicNumerals(ref string str) {
            str = str.Replace("十九", "19");
            str = str.Replace("十八", "18");
            str = str.Replace("十七", "17");
            str = str.Replace("十六", "16");
            str = str.Replace("十五", "15");
            str = str.Replace("十四", "14");
            str = str.Replace("十三", "13");
            str = str.Replace("十二", "12");
            str = str.Replace("十一", "11");
            str = str.Replace("十", "10");
            str = str.Replace("九", "9");
            str = str.Replace("八", "8");
            str = str.Replace("七", "7");
            str = str.Replace("六", "6");
            str = str.Replace("五", "5");
            str = str.Replace("四", "4");
            str = str.Replace("三", "3");
            str = str.Replace("二", "2");
            str = str.Replace("一", "1");
        }
        #endregion
    }
}
