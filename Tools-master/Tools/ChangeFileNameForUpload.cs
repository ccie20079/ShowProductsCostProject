using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tools
{
   /// <summary>
   /// 
   /// </summary>
    public class ChangeFileNameForUpload
    {/// <summary>
     /// 上传excel文件时，追加一个随即字符串。
     /// </summary>
     /// <param name="excelFileName"></param>
     /// <param name="randomStr"></param>
     /// <returns></returns>
        public static string getFileNameForUpload(string excelFileName, string randomStr) {
            //取掉后缀名
            string fileNameWithoutSuffix = excelFileName.Remove(excelFileName.IndexOf("."));
            fileNameWithoutSuffix += "_" + randomStr + ".xls";
            return fileNameWithoutSuffix;
        }
        /// <summary>
        /// upload xxx.xls randomStr
        /// </summary>
        /// <param name="uploadStr"></param>
        /// <returns></returns>
        public static string getFileNameFromUploadString(string uploadStr) {
            int firstBlankIndex = uploadStr.IndexOf(" ");
            int secondBlankIndex = uploadStr.LastIndexOf(" ");
            int lengthOfFileName = secondBlankIndex - firstBlankIndex - 1;
            string fileName = uploadStr.Substring(firstBlankIndex + 1, lengthOfFileName);
            string fileNameWithoutSuffix = DirectoryHelper.getFilePathWithoutSuffix(fileName);
            string randomStr = uploadStr.Substring(secondBlankIndex + 1);
            return fileNameWithoutSuffix + "_" + randomStr + ".xls";
        }
    }
}
