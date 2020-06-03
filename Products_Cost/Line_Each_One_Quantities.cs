using System;
using System.Data;
using System.Runtime.CompilerServices;
using System.Text;
using Tools;

namespace Products_Cost
{
    class Line_Each_One_Quantities
    {
        private string _line_name;
        private string _team_name;
        private string _real_team_name;
        private String _products_name;
        private String _summary_process;
        private String _specific_process;
        private String _emp_name;
        private int _quantities;
        private int _man_hour;
        private decimal _amount_of_money;
        private String _year_and_month_str;

        public string Line_Name { get => _line_name; set => _line_name = value; }
        public string Products_name { get => _products_name; set => _products_name = value; }
        public string Summary_process { get => _summary_process; set => _summary_process = value; }
        public string Specific_process { get => _specific_process; set => _specific_process = value; }
        public string Emp_name { get => _emp_name; set => _emp_name = value; }
        public int Quantities { get => _quantities; set => _quantities = value; }
        public string Year_and_month_str { get => _year_and_month_str; set => _year_and_month_str = value; }
        public int Man_hour { get => _man_hour; set => _man_hour = value; }
        public decimal Amount_of_money { get => _amount_of_money; set => _amount_of_money = value; }
        public string Team_name { get => _team_name; set => _team_name = value; }
        public string Real_team_name { get => _real_team_name; set => _real_team_name = value; }

        public int save() {
            string sqlStr = string.Format(@"insert into line_each_one_quantities (
                                                         line_name, 
                                                            team_name,
                                                            real_team_name,
                                                          products_name, 
                                                          summary_process, 
                                                          specific_process,
                                                          man_hour,
                                                            amount_of_money,
                                                          emp_name, 
                                                          quantities, 
                                                          year_and_month
                                                  )
                                                  values(
                                                          '{0}',
                                                            '{1}',
                                                            '{2}',
                                                          '{3}',
                                                          '{4}',
                                                          '{5}',
                                                            {6},
                                                            {7},
                                                          '{8}',
                                                          {9},
                                                          to_date('{10}','yyyy-MM')
                                                  )", this._line_name,
                                                  _team_name,
                                                  _real_team_name,
                                                  _products_name,
                                                  _summary_process,
                                                  _specific_process,
                                                  _man_hour,
                                                  _amount_of_money,
                                                  _emp_name,
                                                  _quantities,
                                                  _year_and_month_str);
            return OracleDaoHelper.executeSQL(sqlStr);
        }
        /// <summary>
        /// 删除相应的记录
        /// </summary>
        /// <param name="v1"></param>
        /// <param name="v2"></param>
        /// <param name="year_and_month_str"></param>
        internal static void deleteTheQuantities(string team_name, string pn, string year_and_month_str)
        {
            StringBuilder sBuilder = new StringBuilder(string.Format(@"delete from Line_Each_One_Quantities where year_and_month = to_date('{0}','yyyy-MM') ",year_and_month_str));
            if (!string.IsNullOrEmpty(team_name)) {
                sBuilder.Append(string.Format(@" and team_name = '{0}'", team_name));
            }
            if (!string.IsNullOrEmpty(pn)) {
                sBuilder.Append(string.Format(@" and products_name = '{0}'", pn));
            }
            OracleDaoHelper.executeSQL(sBuilder.ToString());
        }

        public static DataTable getAllQuantitiesOfTheLine_month_team_report(string pn, string year_and_month_str, string line_name, string team_name) {
            string sqlStr = string.Format(@"select
                                                      rownum row_num, 
                                                      line_name, 
                                                        products_name, 
                                                        summary_process, 
                                                        specific_process, 
                                                        man_hour, 
                                                        amount_of_money, 
                                                        emp_name, 
                                                        quantities,
                                                         team_name,
                                                         real_team_name,
                                                        year_and_month, 
                                                        insert_time
                                                from Line_Each_One_Quantities
                                                where products_name = '{0}'
                                                and year_and_month= to_date('{1}','yyyy-MM')
                                                and line_name = '{2}'
                                                and team_name = '{3}'
                                                order by line_name,
                                                         nlssort(team_name,'nls_sort=SCHINESE_PINYIN_M'),
                                                       nlssort(emp_name ,'nls_sort=SCHINESE_PINYIN_M'),
                                                       seq asc", pn, year_and_month_str, line_name, team_name);
            DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            return dt;
        }
        public static DataTable getAllTeamName(string year_and_month_str) {
            string sqlStr = string.Format(@"select seq,
                                                       g_seq,
                                                        team_name
                                                from (   
                                                      select row_number()over(partition by team_name order by seq) g_seq,
                                                                                        team_name,
                                                                                        seq
                                                      from Line_Each_One_Quantities
                                                      where  year_and_month= to_date('{0}','yyyy-MM')
                                                ) temp 
                                                where g_seq = 1
                                                order by seq asc", year_and_month_str);
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
        public static DataTable getAllProductsNameOfTeam(string year_and_month_str, string team_name)
        {
            string sqlStr = string.Format(@"select seq,
                                                       g_seq,
                                                        products_name
                                                from (   
                                                      select row_number()over(partition by products_name order by seq) g_seq,
                                                                                        products_name,
                                                                                        seq
                                                      from Line_Each_One_Quantities
                                                      where  year_and_month= to_date('{0}','yyyy-MM')
                                                      and team_name = '{1}'
                                                ) temp 
                                                where g_seq = 1
                                                order by seq asc", year_and_month_str, team_name);
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
        public static DataTable getAllQuantitiesOfTeam_PN(string team_name,string pn, string year_and_month_str)
        {
            string sqlStr = string.Format(@"select
                                                  row_number() over(order by seq asc) row_number,
                                                  line_name, 
                                                    products_name, 
                                                    summary_process, 
                                                    specific_process, 
                                                    man_hour, 
                                                    amount_of_money, 
                                                    emp_name, 
                                                    quantities,
                                                     team_name,
                                                     real_team_name,
                                                    year_and_month, 
                                                    insert_time
                                            from Line_Each_One_Quantities
                                            where team_name = '{0}'
                                            and products_name = '{1}'
                                            and year_and_month= to_date('{2}','yyyy-MM')", team_name,pn, year_and_month_str);
            DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            return dt;
        }
    }
}
