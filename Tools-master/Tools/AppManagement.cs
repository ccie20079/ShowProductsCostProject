using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class AppManagement
    {
        private static Queue<int> _queueOfXls;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="hwndOfApp"></param>
        public static  void add(int hwndOfApp) {
            if (_queueOfXls == null) {
                _queueOfXls = new Queue<int>();
            }
            _queueOfXls.Enqueue(hwndOfApp);
        }
        /// <summary>
        /// 
        /// </summary>
        public static void closeAllExcel() {
            CmdHelper.killProcessByHwndQueue(_queueOfXls);
        }
    }
}
