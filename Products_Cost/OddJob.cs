using System;
using System.Data;
using System.Text;
using Tools;

namespace Products_Cost
{
    public class OddJob
    {
        private string _team_name;
        private string _emp_name;
        private string _place;
        private string _particulars;
        private string _labor_hours;
        private string _quantities;
        private string _amount_of_money;
        private string _insert_time;
        private string _year_and_month_str;
        private string _year_month_day_str;

        public string Emp_name { get => _emp_name; set => _emp_name = value; }
        public string Place { get => _place; set => _place = value; }
        public string Particulars { get => _particulars; set => _particulars = value; }
        public string Labor_hours { get => _labor_hours; set => _labor_hours = value; }
        public string Quantities { get => _quantities; set => _quantities = value; }
        public string Amount_of_money { get => _amount_of_money; set => _amount_of_money = value; }
        public string Insert_time { get => _insert_time; set => _insert_time = value; }
        public string Team_name { get => _team_name; set => _team_name = value; }
        public string Year_and_month_str { get => _year_and_month_str; set => _year_and_month_str = value; }
        public string Year_month_day_str { get => _year_month_day_str; set => _year_month_day_str = value; }

        /// <summary>
        /// 获取所有员工的姓名
        /// </summary>
        /// <param name="year_and_month_str"></param>
        /// <returns></returns>
        internal static DataTable getAllEmpsName(string year_and_month_str)
        {
            string sqlStr = string.Format(@"select emp_name,
                                                         seq
                                                  from (
                                                       select row_number() over(partition by emp_name order by seq) g_seq,
                                                                 emp_name,
                                                                 seq
                                                        from odd_job
                                                        where trunc(year_and_month,'MM') = to_date('{0}','yyyy-MM')
                                                  )  temp
                                                  where g_seq = 1
                                                  order by seq asc", year_and_month_str);
            return OracleDaoHelper.getDTBySql(sqlStr);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public int insert_odd_job() {
            string sqlStr = string.Format(@"insert into odd_job(
                                                               team_name, 
                                                                emp_name, 
                                                                place, 
                                                                particulars, 
                                                                labor_hours, 
                                                                quantities, 
                                                                amount_of_money,
                                                                year_and_month,
                                                                year_month_day
                                                            )
                                                        values(
                                                               '{0}',
                                                               '{1}',
                                                               '{2}',
                                                               '{3}',
                                                               {4},
                                                               {5},
                                                               {6},
                                                                to_date('{7}','yyyy-MM')
                                                                ,to_date('{8}','yyyy-MM-dd'))",
                                                               _team_name,
                                                               _emp_name,
                                                               _place,
                                                               _particulars,
                                                               _labor_hours,
                                                               _quantities,
                                                               _amount_of_money,
                                                               _year_and_month_str,
                                                               _year_month_day_str
                                                            );
            return OracleDaoHelper.executeSQL(sqlStr);
        }
        //查询 零活记录，依据月份，班组，姓名三者查询
        public static System.Data.DataTable getQuantitiesOfOddJob(string year_and_month_str, string team_name, string emp_name) {
            string sqlStr = string.Format(@"select 
                                                    seq,
                                                    team_name, 
                                                    emp_name, 
                                                    place, 
                                                    particulars, 
                                                    labor_hours, 
                                                    quantities, 
                                                    amount_of_money, 
                                                    insert_time, 
                                                    year_and_month
                                               from odd_job
                                              where 1 = 1 ");
            StringBuilder sBuilder = new StringBuilder(sqlStr);
            if (!string.IsNullOrEmpty(team_name)) {
                sBuilder.Append(string.Format(@" and team_name = '{0}' ", team_name));
            }
            if (!string.IsNullOrEmpty(emp_name)) {
                sBuilder.Append(string.Format(@" and emp_name = '{0}' ", emp_name));
            }
            if (!string.IsNullOrEmpty(year_and_month_str)) {
                sBuilder.Append(string.Format(@" and trunc(year_and_month,'MM') = to_date('{0}','yyyy-MM')", year_and_month_str));
            }
            return OracleDaoHelper.getDTBySql(sBuilder.ToString());
        }
        //删除记录
        public static int deleteQuantitiesOfOddJob(string year_and_month_str, string team_name, string emp_name) {
            string sqlStr = string.Format(@"delete from odd_job
                                              where 1 = 1 ");
            StringBuilder sBuilder = new StringBuilder(sqlStr);
            if (!string.IsNullOrEmpty(team_name))
            {
                sBuilder.Append(string.Format(@" and team_name = '{0}' ", team_name));
            }
            if (!string.IsNullOrEmpty(emp_name))
            {
                sBuilder.Append(string.Format(@" and emp_name = '{0}' ", emp_name));
            }
            if (!string.IsNullOrEmpty(year_and_month_str))
            {
                sBuilder.Append(string.Format(@" and trunc(year_and_month,'MM') = to_date('{0}','yyyy-MM')", year_and_month_str));
            }
            return OracleDaoHelper.executeSQL(sBuilder.ToString());
        }
        public static int deleteQuantitiesOfOddJobBySeq(string seq)
        {
            string sqlStr = string.Format(@"delete from odd_job
                                              where seq = " + seq);
            return OracleDaoHelper.executeSQL(sqlStr);
        }
        public static bool ifExistsQuantitiesByEmpNameAndYearMonthDay(string empName,string year_month_day_str) {
            string sqlStr = string.Format(@"select 1 from odd_job 
                                            where 1 = 1 
                                            and emp_name = '{0}' 
                                            and trunc(year_month_day,'dd') = to_date('{1}','yyyy-MM-dd')", 
                                            empName,
                                            year_month_day_str);
            DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            return dt.Rows.Count > 0 ? true : false;
        }
    }
}
