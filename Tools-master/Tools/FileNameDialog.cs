using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
namespace Tools
{
    public class FileNameDialog
    {
        /// <summary>
        /// 获选择的文件路径
        /// filter格式 Execl files (*.xls)|*.xls
        /// </summary>
        /// <param name="title"></param>
        /// <param name="Filter"></param>
        /// <returns></returns>
        public static String getSelectedFilePath(String title,String Filter)
        {
            String fName = "";
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.InitialDirectory = "";
            openFileDialog.Filter = Filter;
            openFileDialog.Title = title;
            openFileDialog.RestoreDirectory = false;
            openFileDialog.FilterIndex = 1;
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                fName = openFileDialog.FileName;
            }
            return fName;
        }
        /// <summary>
        /// 选择文件时，打开一个默认的目录。
        /// </summary>
        /// <param name="title"></param>
        /// <param name="Filter"></param>
        /// <param name="defaultDir"></param>
        /// <returns></returns>
        public static String getSelectedFilePathWithDefaultDir(String title, String Filter,string defaultDir)
        {
            String fName = "";
            OpenFileDialog openFileDialog = new OpenFileDialog();
            DirectoryHelper.createDirecotry(defaultDir);
            openFileDialog.InitialDirectory = defaultDir;
            openFileDialog.Filter = Filter;
            openFileDialog.Title = title;
            openFileDialog.RestoreDirectory = true;
            openFileDialog.FilterIndex = 1;
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                fName = openFileDialog.FileName;
            }
            return fName;
        }
        /// <summary>
        /// 选择文件时，打开一个默认的目录。
        /// </summary>
        /// <param name="title"></param>
        /// <param name="Filter"></param>
        /// <param name="defaultDir"></param>
        /// <returns></returns>
        public static String getSelectedPathWithDefaultDir(String title, String Filter, string defaultDir)
        {
            FolderBrowserDialog dialog = new FolderBrowserDialog();
            dialog.Description = "请选择文件路径";

            if (dialog.ShowDialog() == DialogResult.OK)
            {
                string savePath = dialog.SelectedPath;
                return savePath;
            }
            return "";
        }
        /// <summary>
        /// 获取保存路径
        /// Filter格式: Execl files (*.xls)|*.xls
        /// </summary>
        /// <param name="title"></param>
        /// <param name="Filter"></param>
        /// <returns></returns>
        public static String getSaveFileName(String title,String Filter)
        {
            String fileName = "";
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.InitialDirectory = Environment.CurrentDirectory;
            saveFileDialog.Filter = Filter;
            saveFileDialog.FilterIndex = 0;
            saveFileDialog.RestoreDirectory = false;
            saveFileDialog.CreatePrompt = true;
            saveFileDialog.Title = title;
            saveFileDialog.ShowDialog();
            fileName = saveFileDialog.FileName;
            return fileName;
        }
        /// <summary>
        /// 默认目录<
        /// </summary>
        /// <param name="title"></param>
        /// <param name="Filter"></param>
        /// <param name="defaultDir"></param>
        /// <param name="prepareFName"></param>
        /// <returns></returns>
        public static String getSaveFileNameWithDefaultDir(String title, String Filter, string defaultDir, string prepareFName)
        {
            String fileName = "";
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            DirectoryHelper.createDirecotry(defaultDir);
            //DirectoryHelper.createFile(defaultDir + "\\" + prepareFName);
            saveFileDialog.InitialDirectory = defaultDir;
            saveFileDialog.Filter = Filter;
            saveFileDialog.FilterIndex = 0;
            saveFileDialog.RestoreDirectory = true;
            saveFileDialog.CreatePrompt = true;
            saveFileDialog.Title = title;
            saveFileDialog.FileName = prepareFName;
            saveFileDialog.ShowDialog();
            fileName = saveFileDialog.FileName;
            saveFileDialog.Dispose();
            return fileName;
        }
    }
}
