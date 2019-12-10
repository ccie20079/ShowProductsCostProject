using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Reflection;
namespace tools
{
    class ConvertHelper<T> where T: new()
    {
        //利用反射和范型
        //summary
        //
        public static List<T> ConvertToList(DataTable dt) { 
            //定义集合
            List<T> ts = new List<T>();
            //获得此模型的类型
            Type type = typeof(T);
            //定义一个临时变量
            String tempName = String.Empty;
            //遍历DataTable中的所有数据行
            foreach(DataRow dr in dt.Rows){
                T t = new T();
                //获得此模型的公共属性
                PropertyInfo[] propertys = t.GetType().GetProperties();
                //遍历该对象的所有属性
                foreach(PropertyInfo pi in propertys){
                    //属性名赋给临时变量
                    tempName = pi.Name;
                    //检查DataTable是否包含此列
                    if (dt.Columns.Contains(tempName)) { 
                        //判断此属性是否有Setter
                        if (!pi.CanWrite) continue; //该属性不可写,直接跳出
                        //取值
                        Object value = dr[tempName];
                        //如果非空,赋给对象的属性
                        if (value != DBNull.Value) {
                            pi.SetValue(t, value, null);
                        }
                    }
                }
                //对象添加到范型集合中
                ts.Add(t);
            }
            return ts;
        }
    }
}
