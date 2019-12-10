using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Windows.Forms;
using System.Threading;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class RecordLog
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="logDir"></param>
        /// <param name="content"></param>
        /// <returns></returns>
        public static bool WriteLogInDirectory(String logDir, String content)
        {
            string defaultDir = "LogPath";
            string timeStr = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
            string logFileName = DateTime.Now.ToString("yyyy-MM-dd")+ ".txt";
            
            content = timeStr + ": " + content;
            logDir = String.IsNullOrEmpty(logDir) ? defaultDir : logDir;
            DirectoryHelper.createDirecotry(logDir);
            logFileName = logDir + "\\" + logFileName;
            bool result = false;
            FileStream fs = null;
            StreamWriter sw = null;
            try
            {
                fs = File.Open(logFileName, FileMode.Append, FileAccess.Write, FileShare.ReadWrite);
                sw = new StreamWriter(fs, System.Text.Encoding.UTF8);
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message, "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return result;
            }
            sw.WriteLine(content);
            sw.Flush();
            fs.Flush();
            sw.Close();
            fs.Close();
            result = true;
            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="logDir"></param>
        /// <param name="content"></param>
        /// <returns></returns>
        public  bool writeLogInDir(String logDir, String content)
        {
            string defaultDir = "LogPath";
            string timeStr = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
            string logFileName = DateTime.Now.ToString("yyyy-MM-dd") + ".txt";

            content = timeStr + ": " + content;
            logDir = String.IsNullOrEmpty(logDir) ? defaultDir : logDir;
            DirectoryHelper.createDirecotry(logDir);
            logFileName = logDir + "\\" + logFileName;
            bool result = false;
            FileStream fs = null;
            StreamWriter sw = null;
            try
            {
                fs = File.Open(logFileName, FileMode.Append, FileAccess.Write, FileShare.ReadWrite);
                sw = new StreamWriter(fs, System.Text.Encoding.UTF8);
            }
            catch (Exception e)
            {
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
    }
}
