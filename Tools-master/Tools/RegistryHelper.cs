
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class RegistryHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="appName"></param>
        /// <param name="appPath"></param>
        public static void add_To_Boot_Options(string appName,string appPath) {
            // 添加到 当前登陆用户的 注册表启动项
            RegistryKey RKey = Registry.CurrentUser.CreateSubKey(@"SOFTWARE\Microsoft\Windows\CurrentVersion\Run");
            RKey.SetValue(appName, appPath);
            // 添加到 所有用户的 注册表启动项
            //RegistryKey RKey = Registry.LocalMachine.CreateSubKey(@"SOFTWARE\Microsoft\Windows\CurrentVersion\Run");
            //RKey.SetValue("AppName", @"C:\AppName.exe");
        }
    }
}
