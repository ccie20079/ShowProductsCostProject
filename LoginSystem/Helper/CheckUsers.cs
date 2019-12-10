using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Tools;
using LoginSystem.Entities;
namespace LoginSystem.Helper
{
    public class CheckUsers
    {
        public static User_Info getUserInfo(string userName,string products_Name)
        {
            string sqlStr = String.Format(@"SELECT user_name,
                                                    password,
                                                    TO_CHAR(update_time,'yyyy/MM/dd') AS UPDATE_TIME,
                                                    department,
                                                     ACTION
                                                FROM USER_INFO WHERE User_Name = '{0}' AND PRODUCT_NAME = '{1}'", userName,products_Name
                                                );
            List<User_Info> userInfoList = ConvertHelper<User_Info>.ConvertToList(OracleDaoHelper.getDTBySql(sqlStr));
            return userInfoList[0];
        }
        public static bool ifExistsUserName(string name,string Products_Name)
        {
            string sqlStr = string.Format(@"SELECT 1 FROM USER_INFO WHERE UPPER(User_Name) = UPPER('{0}') AND PRODUCT_NAME = '{1}'", name,Products_Name);
            return OracleDaoHelper.getDTBySql(sqlStr).Rows.Count > 0 ? true : false;
        }
        public static bool isPasswordRight(string userName, string password,string products_Name)
        {
            string sqlStr = String.Format(@"SELECT 1 FROM USER_INFO WHERE UPPER(User_Name) = UPPER('{0}')
                                                AND Password = '{1}' AND Product_Name = '{2}'", userName, password,products_Name);
            return OracleDaoHelper.getDTBySql(sqlStr).Rows.Count > 0 ? true : false;
        }
    }
}
