using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class DirectoryHelper
    {
        /// <summary>
        /// 创建目录
        /// </summary>
        public static void createDirecotry(string direcotry) {
            if (!Directory.Exists(direcotry))
            {
                Directory.CreateDirectory(direcotry);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="fileName"></param>
        public static void createFile(string fileName) {
            if (!File.Exists(fileName)) {
                File.Create(fileName);
            }
        }
        /// <summary>
        /// 删除某个目录下的所有文件.
        /// </summary>
        public static void deleteAllTheFileOfThePath(string directory) {
            if (!Directory.Exists(directory))
            {
                return;
            }
            string[] FileNameArray = Directory.GetFiles(directory);
            int index = directory.LastIndexOf(@"\");
            string prefixOfDir = directory.Substring(0, index + 1);
            foreach (string fileName in FileNameArray) {
                string file = prefixOfDir + fileName;
                File.Delete(file);
            }
        }
        /// <summary>
        /// 返回某文件全路径的目录部门。
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static string getDirOfFile(string filePath) {
            int index = filePath.LastIndexOf(@"\");
            return filePath.Substring(0, index + 1);
        }
        /// <summary>
        /// 返回文件名,包含后缀。
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static string getFileName(string filePath)
        {

            if (!File.Exists(filePath))
            {
                return "";
            }
            int index = filePath.LastIndexOf(@"\");
            return filePath.Substring(index + 1);
        }
      /// <summary>
      /// 
      /// </summary>
      /// <param name="fileName"></param>
      /// <returns></returns>
        public static string getFileNameWithoutSuffix(string fileName)
        {
            int index = fileName.LastIndexOf(".");
            return fileName.Substring(0, index);
        }
      /// <summary>
      /// 
      /// </summary>
      /// <param name="filePath"></param>
      /// <returns></returns>
        public static string getFilePathWithoutSuffix(string filePath) {
            return filePath.Remove(filePath.LastIndexOf("."));
        }
        /// <summary>
        /// 获取指定目录下的excel文件。
        /// </summary>
        /// <param name="dir"></param>
        /// <returns></returns>
        public static string getXlsFileName(string dir) {
            string[] fileNameArray = Directory.GetFiles(dir);
            if (fileNameArray.Length == 0) return "";
            foreach (string str in fileNameArray) {
                if (str.Contains(".xls") || str.Contains(".xlsx")) {
                    return str;
                }
            }
            return "";
        }
        /// <summary>
        /// 获取指定目录下的excel文件。
        /// </summary>
        /// <param name="dir"></param>
        /// <returns></returns>
        public static List<string> getXlsFileUnderThePrescribedDir(string dir)
        {
            List<string> fileList = new List<string>();
            string[] fileNameArray = Directory.GetFiles(dir);
            if (fileNameArray.Length == 0) return fileList; 
            foreach (string str in fileNameArray)
            {
                if (str.Contains(".xls") || str.Contains(".xlsx"))
                {
                    fileList.Add(str);
                }
            }
            return fileList;
        }
        /*
        //获取当前系统磁盘符方法1，返回：C:
        string path = Environment.GetEnvironmentVariable("systemdrive");
        //获取当前系统磁盘符方法2,返回：C:
        string path = Environment.ExpandEnvironmentVariables("%systemdrive%");
        Console.WriteLine(path);
//获取当前系统目录
Console.WriteLine("GetFolderPath: {0}",Environment.GetFolderPath(Environment.SpecialFolder.System));
//获取当前系统桌面
Console.WriteLine("GetFolderPath: {0}", Environment.GetFolderPath(Environment.SpecialFolder.System));
        */
        /// <summary>
        /// 获取系统桌面目录
        /// </summary>
        /// <returns></returns>
        public static String getDesktopDir() {
            return Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
        }
        /// <summary>
        /// 获取某个路径的父目录
        /// </summary>
        /// <returns></returns>
        public static string getParentDir() {
            //获取当前运行路径的上级目录（父目录）
            //System.IO.DirectoryInfo topDir = System.IO.Directory.GetParent(System.Environment.CurrentDirectory);
            System.IO.DirectoryInfo topDir = System.IO.Directory.GetParent(System.Windows.Forms.Application.StartupPath);
            //string pathto = topDir.Parent.Parent.FullName;
            //注意一个Parent获取上一级的目录。
            return topDir.ToString();
            //继续获取上级的上级的上级的目录。
        }
    }
}
