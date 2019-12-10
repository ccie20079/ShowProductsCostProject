using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Windows.Forms;
namespace Tools
{
    /// <summary>
    /// 检查软件版本
    /// </summary>
    public class CheckVersionOfAppByShare
    {
        /// <summary>
        /// 检查是否存在连接共享的bat文件
        /// </summary>
        /// <returns></returns>
        private static bool ifExistsBatFileOfConnShare() {
            if (!File.Exists(string.Format(@"{0}\update\connShare.bat", Application.StartupPath))) {
                MessageBox.Show("未找到连接共享的bat文件!", "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            return true;
        }
        /// <summary>
        /// 检查程序版本号。
        /// </summary>
        /// <param name="softwareName"></param>
        /// <param name="version"></param>
        /// <returns></returns>
        public static bool checkSoftVersion(string softwareName,string currVersion) {
            if (!ifExistsBatFileOfConnShare()) return false;
            //1.建立连接
            //建立连接
            CmdHelper.LaunchBatOrExe(string.Format(@"{0}\update\connShare.bat", Application.StartupPath));
            string resultStr = FileHelper.readFile(string.Format(@"S:\version.txt"));
            string[] strArray = { "\r\n" };
            string[] resultStrArray = resultStr.Split(strArray, StringSplitOptions.RemoveEmptyEntries);
            for (int i=0;i<resultStrArray.Length;i++) {
                //再次分解
                string tempStr = resultStrArray[i].ToString();
                string[] versionInfoArray =tempStr.Split(':');
                if (!softwareName.Equals(versionInfoArray[0].Trim())) {
                    continue;
                }
                //检查版本号
                string releaseVersion = versionInfoArray[1].Trim();
                if (!currVersion.Equals(releaseVersion))
                {
                    MessageBox.Show(string.Format(@"当前版本{0} 与发布的版本{1} 不一致,需更新!", currVersion, releaseVersion), "提示: ", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return false;
                }
                else {
                    //版本信息一致
                    return true;
                }
            }
            //未找到
            MessageBox.Show(string.Format(@"此程序名{0}：未在version.txt中注册！",softwareName),"提示！",MessageBoxButtons.OK,MessageBoxIcon.Information);
            return false;
        }
        /// <summary>
        /// 检查软件目录是否存在
        /// </summary>
        /// <param name="appName"></param>
        /// <returns></returns>
        public static bool ifExistsTheDirOfSoftware(string appName) {
            if (!ifExistsBatFileOfConnShare()) return false;
            //1.建立连接
            //建立连接
            CmdHelper.LaunchBatOrExe(string.Format(@"{0}\update\connShare.bat", Application.StartupPath));
            if (!Directory.Exists(string.Format(@"S:\{0}", appName))) {
                MessageBox.Show(string.Format(@"软件{0}: 在共享目录上尚未发布!",appName),"提示: ",MessageBoxButtons.OK,MessageBoxIcon.Information);
                //断开连接
                CmdHelper.LaunchBatOrExe(string.Format(@"{0}\update\deleteShare.bat", Application.StartupPath));
                return false;
            }
            return true;
        }
    }
}
