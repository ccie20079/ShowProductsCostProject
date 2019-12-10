using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Reflection;

namespace Tools
{
    public class DT_To_List
    {
        /// <summary>
        /// DataTable转化为List集合
        /// </summary>
        /// <typeparam name="T">实体对象</typeparam>
        /// <param name="dt">dataTable表</param>
        /// <param name="isStoreDB">是否存入数据库datetime字段,date字段没事，取出不用判断</param>
        /// <returns>返回list集合</returns>
        public static List<T> TableToList<T>(DataTable dt, bool isStoreDB = true) {
            List<T> list = new List<T>();
            Type type = typeof(T);
            //List<string> listColumns = new List<string>();
            PropertyInfo[] pArray = type.GetProperties();   //集合属性数组 
            foreach (DataRow row in dt.Rows) {
                T entity = Activator.CreateInstance<T>();       //新建对象实例
                foreach (PropertyInfo p in pArray) {
                    if (!dt.Columns.Contains(p.Name) || row[p.Name] == null || row[p.Name] == DBNull.Value) {
                        continue;       //DataTable 列中不存在集合属性或者字段内容为空则，跳出循环，进行下个循环。
                    }
                    if (isStoreDB && p.PropertyType == typeof(DateTime) && Convert.ToDateTime(row[p.Name]) < Convert.ToDateTime("1753-01-01")) {
                        continue;
                    }
                    try
                    {
                        var obj = Convert.ChangeType(row[p.Name], p.PropertyType);  //类型强转，将table字段类型强制转化为集合字段类型
                        p.SetValue(entity, obj, null);
                    }
                    catch (Exception) {
                    }
                }
                list.Add(entity);
            }
            return list;
        }
    }
}
