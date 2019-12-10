using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
namespace tools
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
            openFileDialog.RestoreDirectory = true;
            openFileDialog.FilterIndex = 1;
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                fName = openFileDialog.FileName;
            }
            return fName;
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
            saveFileDialog.Filter = Filter;
            saveFileDialog.FilterIndex = 0;
            saveFileDialog.RestoreDirectory = true;
            saveFileDialog.CreatePrompt = true;
            saveFileDialog.Title = title;
            saveFileDialog.ShowDialog();
            fileName = saveFileDialog.FileName;
            return fileName;
        } 
    }
}
