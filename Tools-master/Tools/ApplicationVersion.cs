using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class ApplicationVersion
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="productName"></param>
        /// <returns></returns>
        public static string getVersion(string productName) {
            string sqlStr = string.Format(@"select Release_Version 
                                              from Application_Availability
                                              where product_name = '{0}'",productName);
            DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            if (dt.Rows.Count ==0) {
                return "";
            }
            return dt.Rows[0]["Release_Version"].ToString();
        }
    }
}
