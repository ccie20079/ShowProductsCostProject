using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
namespace Tools
{
    public class CloneObject
    {
        /// <summary>
        /// 克隆一个对象
        /// </summary>
        /// <param name="sampleObject"></param>
        /// <returns></returns>
        public static object Clone(object sampleObject)
        {
            Type t = sampleObject.GetType();
            PropertyInfo[] properties = t.GetProperties();
            object p = t.InvokeMember("", BindingFlags.CreateInstance, null, sampleObject, null);
            foreach (PropertyInfo pi in properties)
            {
                if (pi.CanWrite)
                {
                    object value = pi.GetValue(sampleObject, null);
                    pi.SetValue(p, value, null);
                }
            }
            return p;
        }
    }
}
