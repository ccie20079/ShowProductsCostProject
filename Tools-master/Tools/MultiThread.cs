using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class MultiThread
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="lpWindowName"></param>
        public static void dowork(string lpWindowName)
        {
            ThreadPool.QueueUserWorkItem(new WaitCallback(s => {
                for(int second=13;second>=1;second--)
                {
                    SearchWindow sss = new SearchWindow();
                    
                    s = null;
                    if (sss.closeWindowByWindowName("DidiSoft.Pgp.PGPLib", lpWindowName)) break;
                    Thread.Sleep(1000);
                }
            }));
        }
    }
}
