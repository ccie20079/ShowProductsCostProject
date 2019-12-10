using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Data;
using System.Windows.Forms;
using System.Threading;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class FileHelper
    {
        #region public static readLastLine
        /// <summary>
        /// 讀取文本中最后一行記錄
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static String readLastLine(String filePath)
        {
            String result = String.Empty;
            FileStream fs = null;
            try {
                fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);   
            }
            catch(Exception e){
                MessageBox.Show(e.Message,"提示：",MessageBoxButtons.OK,MessageBoxIcon.Information);
                return result;
            }
            StreamReader sr = new StreamReader(fs, System.Text.Encoding.UTF8);
            while (!sr.EndOfStream)
            {
                //不為空則覆蓋。
                if (!"".Equals(sr.ReadLine())) result = sr.ReadLine();
            }
            sr.Close();
            fs.Close();
            return result;
        }
        #endregion
        #region public static  readFile
        /// <summary>
        /// 讀取文本内容，拼接，直至最后一行記錄
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static String readFile(String filePath)
        {
            StringBuilder sb = new StringBuilder();
            FileStream fs = null;
            StreamReader sr = null;
            try
            {
                fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message, "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return sb.ToString();
            }
            sr = new StreamReader(fs, System.Text.Encoding.Default);
            while (!sr.EndOfStream)
            {
                //不為空則覆蓋。
                sb.Append(sr.ReadLine());
            }
            fs.Flush();
            sr.Close();
            fs.Close();
            return sb.ToString();
        }
        #endregion
        #region public static readLastLineWithRowNum
        /// <summary>
        /// 
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static String[]  readLastLineWithRowNumAndShare(String filePath)
        {
            String nextLine=String.Empty;
            String[] result = new String[2];
            FileStream fs = null;
            try {
                fs = new FileStream(filePath, FileMode.Open, FileAccess.Read,FileShare.ReadWrite);
            }catch(Exception e){
                MessageBox.Show(e.Message, "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return result;
            }
            StreamReader sr = new StreamReader(fs, System.Text.Encoding.UTF8);
            int rowNum = 0;
            while ((nextLine = sr.ReadLine()) != null)
            {
                result[1] = nextLine;
                rowNum++;
                //Console.WriteLine(rowNum + ": " + nextLine);
            }
            result[0] = rowNum.ToString();
            fs.Flush();
            sr.Close();
            fs.Close();
            return result;
        }       
        #endregion
        #region public bool writeLine
        /// <summary>
        /// 寫數據到某個文件中。
        /// </summary>
        /// <param name="filePath"></param>
        /// <param name="content"></param>
        /// <returns></returns>
        public static bool writeLineAppendWithShare(String filePath, String content)
        {
            bool result = false;
            FileStream fs = null;
            StreamWriter sw = null;
            try {
                fs = File.Open(filePath,FileMode.Append,FileAccess.Write,FileShare.ReadWrite);
                sw = new StreamWriter(fs, System.Text.Encoding.UTF8);
            }catch(Exception e){
                MessageBox.Show(e.Message, "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return result;       
            }
            sw.WriteLine(content);
            Console.WriteLine("sleep......");
            //停留10秒。
            Thread.Sleep(10000);
            Console.WriteLine("wake up.....");
            sw.Flush();
            fs.Flush();
            sw.Close();
            fs.Close();
            result = true;
            return result;
        } 
        #endregion
        #region 寫文件到指定目錄
        /// <summary>
        /// 寫文件到指定目錄
        /// </summary>
        /// <param name="filePath"></param>
        /// <param name="content"></param>
        /// <returns></returns>
        public static bool writeLine(String filePath, String content)
        {
            bool result = false;
            FileStream fs = null;
            StreamWriter sr = null;
            try
            {
                fs = File.Open(filePath, FileMode.Create, FileAccess.Write, FileShare.Read);
                sr = new StreamWriter(fs, System.Text.Encoding.UTF8);
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message, "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return result;
            }
            sr.WriteLine(content);
            sr.Flush();
            fs.Flush();
            sr.Close();
            fs.Close();
            result = true;
            return result;
        }
        #endregion
    }
}
