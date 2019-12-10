using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tools
{
    /// <summary>
    /// 释放资源类。
    /// </summary>
    public class ReleaseComObject
    {
        /// <summary>
        /// 逐个释放资源。
        /// </summary>
        /// <param name="objList"></param>
        public static void ReleaseComObj(List<Object> objList) {
            //释放资源
            foreach (Object o in objList) {
                System.Runtime.InteropServices.Marshal.ReleaseComObject(o);
            }
            //调用GC的垃圾回收方法
            GC.Collect();
            GC.WaitForPendingFinalizers();
        }
    }
}
