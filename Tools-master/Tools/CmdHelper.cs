using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Collections;
using System.Threading;
using System.Windows.Forms;
using System.IO;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class CmdHelper
    {
     

        /// <summary>
        /// 
        /// </summary>
        /// <param name="hwnd"></param>
        /// <param name="Id"></param>
        /// <returns></returns>
        [DllImport("User32.dll", CharSet = CharSet.Auto)]
        //Private Declare Function IsWindowVisible Lib "user32" Alias "IsWindowVisible" (ByVal hwnd As Long) As Long
        //Private Declare Function IsWindowEnabled Lib "user32" Alias "IsWindowEnabled" (ByVal hwnd As Long) As Long
        //Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
        public static extern int GetWindowThreadProcessId(IntPtr hwnd, out int Id);
        /// <summary>
        /// 获取窗体的句柄函数
        /// </summary>
        /// <param name="lpClassName">窗口类名</param>
        /// <param name="lpWindowName">窗口标题名</param>
        /// <returns>返回句柄</returns>
        [DllImport("user32.dll", EntryPoint = "FindWindow", SetLastError = true)]
        public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="lpClassName"></param>
        /// <returns></returns>
        [DllImport("User32.dll", EntryPoint = "IsWindowVisible", SetLastError = true)]
        public static extern long IsWindowVisible(string lpClassName);
   
        /// <summary>
        /// Cmd 的摘要说明。
        /// </summary>
        private static Process proc = null;
        /// <summary>
        /// 构造方法
        /// </summary>
        public CmdHelper()
        {
            proc = new Process();
        }
        /// <summary>
        /// 执行CMD语句
        /// </summary>
        /// <param name="cmd">要执行的CMD命令</param>
        public string RunCmd(string cmd)
        {
            proc.StartInfo.CreateNoWindow = true;
            proc.StartInfo.FileName = "cmd.exe";
            proc.StartInfo.UseShellExecute = false;
            proc.StartInfo.RedirectStandardError = true;
            proc.StartInfo.RedirectStandardInput = true;
            proc.StartInfo.RedirectStandardOutput = true;
            proc.Start();
            proc.StandardInput.WriteLine(cmd);
            proc.StandardInput.WriteLine("exit");
            string outStr = proc.StandardOutput.ReadToEnd();
            proc.Close();
            return outStr;
        }
        /// <summary>
        /// 执行CMD语句
        /// </summary>
        /// <param name="cmd">要执行的CMD命令</param>
        public static string runCmd(string cmd)
        {
            proc = new Process();
            proc.StartInfo.CreateNoWindow = true;
            proc.StartInfo.FileName = "cmd.exe";
            proc.StartInfo.UseShellExecute = false;
            proc.StartInfo.RedirectStandardError = true;
            proc.StartInfo.RedirectStandardInput = true;
            proc.StartInfo.RedirectStandardOutput = true;
            proc.Start();
            //先切换目录.
            proc.StandardInput.WriteLine("cd /D " + DirectoryHelper.getDirOfFile(cmd));
            proc.StandardInput.WriteLine(cmd);
            proc.StandardInput.WriteLine("exit");
            string outStr = proc.StandardOutput.ReadToEnd();
            proc.Close();
            return outStr;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="file"></param>
        public static void OpenMsWord(string file)
        {
            ProcessStartInfo startInfo = new ProcessStartInfo();
            //我的机器上没有安装 Microsoft word--!
            //startInfo.FileName = "winword";
            startInfo.FileName = "wps";
            startInfo.Arguments = file; //设置参数
            Process.Start(startInfo);
        }
         /// <summary>
         /// 
         /// </summary>
         /// <param name="batName"></param>
         /// <param name="args">向启动的EXE，传递参数，多个参数用空格隔开。</param>
        public static void LaunchBatOrExe(string batName,string args = "")
        {
            //判断该bat文件是否存在 
            if (!File.Exists(batName)) {
                MessageBox.Show(batName+"不存在！","提示:",MessageBoxButtons.OK,MessageBoxIcon.Information);
                return;
            }
            try {
                ProcessStartInfo startInfo = new ProcessStartInfo();
                startInfo.CreateNoWindow = true;
                startInfo.FileName = batName;
                startInfo.Arguments = args;
                startInfo.WindowStyle = ProcessWindowStyle.Normal;
                Process.Start(startInfo);
            }
            catch (Exception ex) {
                throw;
            }
        }
        /// <summary>
        /// 复制目标文件到  目的目录下。
        /// </summary>
        /// <param name="srcFilePath"></param>
        /// <param name="destDir"></param>
        public static void copyFileToDestDir(string srcFilePath, string destDir)
        {
            runCmd(string.Format(@"copy {0} {1} /y", srcFilePath, destDir));
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcFilePath"></param>
        /// <param name="destDir"></param>
        /// <param name="destFileName"></param>
        public static void copyFileToDestDirWithNewFileName(string srcFilePath, string destDir, string destFileName)
        {
            runCmd(string.Format(@"copy {0} {1}\{2} /y", srcFilePath, destDir, destFileName));
        }
        /// <summary>
        /// 打开软件并执行命令
        /// </summary>
        /// <param name="programName">软件路径加名称（.exe文件）</param>
        /// <param name="cmd">要执行的命令</param>
        public void RunProgram(string programName, string cmd)
        {
            Process proc = new Process();
            proc.StartInfo.CreateNoWindow = true;
            proc.StartInfo.FileName = programName;
            proc.StartInfo.UseShellExecute = false;
            proc.StartInfo.RedirectStandardError = true;
            proc.StartInfo.RedirectStandardInput = true;
            proc.StartInfo.RedirectStandardOutput = true;
            proc.Start();
            if (cmd.Length != 0)
            {
                proc.StandardInput.WriteLine(cmd);
            }
            proc.Close();
        }
        /// <summary>
        /// 打开软件
        /// </summary>
        /// <param name="programName">软件路径加名称（.exe文件）</param>
        public void RunProgram(string programName)
        {
            this.RunProgram(programName, "");
        }
        /// <summary>
        /// 按照句柄进行删除。
        /// </summary>
        public static void killProcessByHwnd(int hwnd)
        {
            if (hwnd == 0) return;
            IntPtr t = new IntPtr(hwnd);
            int k = 0;
            GetWindowThreadProcessId(t, out k);
            if (k == 0) return;
            Process p = Process.GetProcessById(k);
            try
            {
                p.Kill();
                //p.CloseMainWindow();
            }
            catch (Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.ToString(), "提示：", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Information);
                throw ex;
            }
        }
        /// <summary>
        /// 按照句柄进行删除。
        /// </summary>
        public static void killProcessByIntPtr(IntPtr intPtrOfExcel)
        {
            int k = 0;
            GetWindowThreadProcessId(intPtrOfExcel, out k);
            Process p = Process.GetProcessById(k);
            try
            {
                p.Kill();
            }
            catch (Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.ToString(), "提示：", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Information);
                throw ex;
            }
        }
        /// <summary>
        /// 按照句柄进行删除。
        /// </summary>
        public static void killProcessByHwndQueue(Queue<int> hwndQueue)
        {
            if (hwndQueue == null) return;
            for (int i = 0; i < hwndQueue.Count - 1; i++)
            {
                killProcessByHwnd(hwndQueue.Dequeue());
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="capations"></param>
        public static void killProcessByCapation(Object capation)
        {
            string capationStr = (string)capation;
            for (int second = 13; second > 0; second--)
            {
                IntPtr intPtrOfExcel = FindWindow(null, capationStr);
                Console.WriteLine(intPtrOfExcel.ToInt32().ToString());
                Console.Write("\t\t" + second.ToString());

                if (intPtrOfExcel.ToInt32() == 0)
                {
                    Thread.Sleep(1000);
                    continue;
                }
                int k = 0;
                GetWindowThreadProcessId(intPtrOfExcel, out k);
                Process p = Process.GetProcessById(k);
                try
                {
                    p.Kill();
                }
                catch (Exception ex)
                {
                    System.Windows.Forms.MessageBox.Show(ex.ToString(), "提示：", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Information);
                    throw ex;
                }
                break;
            }
        }
        /// <summary>
        /// 开启一个单独的线程来,结束弹出的界面.
        /// </summary>
        /// <param name="capationStr"></param>
        public static void killProcessWithOtherThread(String capationStr)
        {
            ParameterizedThreadStart threadStart = new ParameterizedThreadStart(killProcessByCapation);
            Thread thread = new Thread(threadStart);
            thread.Start(capationStr);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="imagename"></param>
        public static void killTaskByImageName(string imagename)
        {
            CmdHelper.runCmd(string.Format(@"taskkill /F /im {0}", imagename));
        }
        /// <summary>
        /// 依据名称查询是否存在Excel进程。
        /// </summary>
        /// <returns></returns>
        public static bool ifExistsExcelOpened()
        {
            Process[] vProcesses = Process.GetProcesses();
            foreach (Process vProcess in vProcesses)
            {
                if (vProcess.ProcessName.Equals("EXCEL",StringComparison.OrdinalIgnoreCase))
                {
                    Console.WriteLine(vProcess.MainModule.FileName);
                    MessageBox.Show("请先关闭已经打开的Excel!");
                    return true;
                }
            }
            return false;
        }
        /// <summary>
        /// <summary>
        /// 依据名称查询是否存在某进程。
        /// </summary>
        /// <returns></returns>
        public static bool ifExistsTheProcessByName(string processName)
        {
            Process[] vProcesses = Process.GetProcesses();
            foreach (Process vProcess in vProcesses)
            {                   
                if (vProcess.ProcessName.Equals(processName,
                StringComparison.OrdinalIgnoreCase))
                {
                    Console.WriteLine(vProcess.MainModule.FileName);
                    MessageBox.Show("请先关闭已经打开的: " + processName);
                    return true;
                }
            }
            return false;
        }
        /// <summary>
        /// 依据名称查询是否存在某某路径的进程.
        /// </summary>
        /// <returns></returns>
        public static bool ifExistsTheProcessOfSpecificPath(string path)
        {
            Process[] vProcesses = Process.GetProcesses();
            foreach (Process vProcess in vProcesses)
            {
                if (vProcess.MainModule.FileName.Equals(path,
                StringComparison.OrdinalIgnoreCase))
                {
                    Console.WriteLine(vProcess.MainModule.FileName);
                    return true;
                }
            }
            return false;
        }
     
        /// <summary>
        /// 依据名称查询是否存在某进程。
        /// </summary>
        /// <returns></returns>
        public static bool ifExistsTheProcessByName_2ndMethod(string processName)
        {
            Process[] app = Process.GetProcessesByName(processName);
            if (app.Length > 0)
            {
                
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 依据进程名,杀死某进程。
        /// </summary>
        /// <param name="processName"></param>
        public static void killTheProcessByName(string processName)
        {
            Process[] p = Process.GetProcessesByName(processName);
            foreach (Process ps in p)
            {
                
                ps.Kill();
            }
        }
    }
}
