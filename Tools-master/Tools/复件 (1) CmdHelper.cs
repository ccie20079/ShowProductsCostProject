using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
namespace tools
{
    public class Cmd
    {
        /*
        MS的CMD命令行是一种重要的操作界面，一些在C#中不那么方便完成的功能，在CMD中几个简单的命令或许就可以轻松搞定，如果能在C#中能完成CMD窗口的功能，那一定可以使我们的程序简便不少。 
下面介绍一种常用的在C#程序中调用CMD.exe程序，并且不显示命令行窗口界面，来完成CMD中各种功能的简单方法。 
如下所示： 
复制代码 代码如下:

System.Diagnosties.Process p=new System.Diagnosties.Process(); 
p.StartInfo.FileName="cmd.exe";//要执行的程序名称 
p.StartInfo.UseShellExecute=false; 
p.StartInfo.RedirectStanderInput=true;//可能接受来自调用程序的输入信息 
p.StartInfo.RedirectStanderOutput=true;//由调用程序获取输出信息 
p.StartInfo.CreateNoWindow=true;//不显示程序窗口 
p.Start();//启动程序 
//向CMD窗口发送输入信息： 
p.StanderInput.WriteLine("shutdown -r t 10"); //10秒后重启（C#中可不好做哦） 
//获取CMD窗口的输出信息： 
string sOutput = p.StandardOutput.ReadToEnd();有啦以下代码，就可以神不知鬼不觉的操作CMD啦。总之，Process类是一个非常有用的类，它十分方便的利用第三方的程序扩展了C#的功能。 

详细源码如下： 
复制代码 代码如下:

using System; 
using System.Diagnostics; 
namespace Business 
{ 
/// <summary> 
/// Command 的摘要说明。 
/// </summary> 
public class Command 
{ 
private Process proc = null; 
/// <summary> 
/// 构造方法 
/// </summary> 
public Command() 
{ 
proc = new Process(); 
} 
/// <summary> 
/// 执行CMD语句 
/// </summary> 
/// <param name="cmd">要执行的CMD命令</param> 
public void RunCmd(string cmd) 
{ 
proc.StartInfo.CreateNoWindow = true; 
proc.StartInfo.FileName = "cmd.exe"; 
proc.StartInfo.UseShellExecute = false; 
proc.StartInfo.RedirectStandardError = true; 
proc.StartInfo.RedirectStandardInput = true; 
proc.StartInfo.RedirectStandardOutput = true; 
proc.Start(); 
proc.StandardInput.WriteLine(cmd); 
proc.Close(); 
} 
/// <summary> 
/// 打开软件并执行命令 
/// </summary> 
/// <param name="programName">软件路径加名称（.exe文件）</param> 
/// <param name="cmd">要执行的命令</param> 
public void RunProgram(string programName,string cmd) 
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
this.RunProgram(programName,""); 
} 
} 
} 

调用时 
复制代码 代码如下:

Command cmd = new Command(); 
cmd.RunCmd("dir"); 
获取输出信息应注意：
ReadtoEnd()容易卡住：
复制代码 代码如下:

[csharp] view plaincopyprint?string outStr = proc.StandardOutput.ReadtoEnd(); 
 string outStr = proc.StandardOutput.ReadtoEnd();

更倾向于使用ReadLine()：
复制代码 代码如下:

[csharp] view plaincopyprint?string tmptStr = proc.StandardOutput.ReadLine();  
         string outStr = "";  
         while (tmptStr != "")  
         {  
             outStr += outStr;  
             tmptStr = proc.StandardOutput.ReadLine();  
         }  


    }
         
 */
   /// <summary>
    /// Cmd 的摘要说明。
    /// </summary>
        private Process proc = null;
        /// <summary>
        /// 构造方法
        /// </summary>
        public Cmd()
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
    }

}
