﻿using System;
using System.CodeDom;
using System.Data;
using System.Text;
using Tools;

namespace Products_Cost
{
    class Line_Each_One_Quantities
    {

        private string _line_name;
        private string _report_team_name;
        private string _real_team_name;
        private String _products_name;
        private String _summary_process;
        private String _specific_process;
        private String _emp_name;
        private int _quantities;
        private int _man_hour;
        private decimal _amount_of_money;
        private string _report_year_month_str;

        public string Line_Name { get => _line_name; set => _line_name = value; }
        public string Products_name { get => _products_name; set => _products_name = value; }
        public string Summary_process { get => _summary_process; set => _summary_process = value; }
        public string Specific_process { get => _specific_process; set => _specific_process = value; }

        /// <summary>
        /// 判断该当前月份中是否存在相应的线体，若存在，暂时不可删除Line_Info中的线体名。
        /// </summary>
        /// <param name="line_name"></param>
        /// <returns></returns>
        internal static bool ifExistsTheLineNameOfTheCurrMonth(string line_name)
        {
            string sqlStr = string.Format(@"select 1 
                                                    from Line_each_one_Quantities
                                                    where line_name = '{0}'
                                                    and trunc(last_day_of_report_month,'MM') = trunc(sysdate,'MM')",
                                                    line_name);
            return OracleDaoHelper.getDTBySql(sqlStr).Rows.Count > 0 ? true : false;
        }

        internal static bool ifExistsTheTeamNameOfTheCurrMonth(string team_name)
        {
            string sqlStr = string.Format(@"select 1 
                                                    from Line_each_one_Quantities
                                                    where report_team_name = '{0}'
                                                    and trunc(last_day_of_report_month,'MM') = trunc(sysdate,'MM')",
                                                    team_name);
            return OracleDaoHelper.getDTBySql(sqlStr).Rows.Count > 0 ? true : false;
        }

        public string Emp_name { get => _emp_name; set => _emp_name = value; }
        public int Quantities { get => _quantities; set => _quantities = value; }
        public int Man_hour { get => _man_hour; set => _man_hour = value; }
        public decimal Amount_of_money { get => _amount_of_money; set => _amount_of_money = value; }
        public string Real_team_name { get => _real_team_name; set => _real_team_name = value; }
        public string Report_team_name { get => _report_team_name; set => _report_team_name = value; }
            public string Report_year_month_str { get => _report_year_month_str; set => _report_year_month_str = value; }

        public int save() {
            string sqlStr = string.Format(@"insert into line_each_one_quantities (
                                                         line_name, 
                                                            report_team_name,
                                                            real_team_name,
                                                          products_name, 
                                                          summary_process, 
                                                          specific_process,
                                                          man_hour,
                                                          amount_of_money,
                                                          emp_name, 
                                                          quantities, 
                                                          report_year_month
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
                                                  _report_team_name,
                                                  _real_team_name,
                                                  _products_name,
                                                  _summary_process,
                                                  _specific_process,
                                                  _man_hour,
                                                  _amount_of_money,
                                                  _emp_name,
                                                  _quantities,
                                                  _report_year_month_str
                                                  );
            return OracleDaoHelper.executeSQL(sqlStr);
        }
        /// <summary>
        /// 删除相应的记录
        /// </summary>
        /// <param name="v1"></param>
        /// <param name="v2"></param>
        /// <param name="year_and_month_str"></param>
        internal static void deleteTheQuantities(string team_name, string pn, string report_year_month_str)
        {
            StringBuilder sBuilder = new StringBuilder(string.Format(@"delete 
                                                                        from Line_Each_One_Quantities 
                                                                        where trunc(report_year_month,'MM') = to_date('{0}','yyyy-MM')    
                                                            ", report_year_month_str));
            if (!string.IsNullOrEmpty(team_name)) {
                sBuilder.Append(string.Format(@" and report_team_name = '{0}'", team_name));
            }
            if (!string.IsNullOrEmpty(pn)) {
                sBuilder.Append(string.Format(@" and products_name = '{0}'", pn));
            }
            OracleDaoHelper.executeSQL(sBuilder.ToString());
        }
        public static System.Data.DataTable getAllQuantitiesOfTheLine_team_pn_report( string line_name, string team_name,string pn, string report_year_month_str) {
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
                                                         report_team_name,
                                                         real_team_name,
                                                        report_year_month, 
                                                        insert_time
                                                from Line_Each_One_Quantities
                                                where 1=1 ");
            StringBuilder sBuilder = new StringBuilder(sqlStr);
            if (!string.IsNullOrEmpty(line_name)) {
                sBuilder.Append(string.Format(@" and line_name = '{0}' ",line_name));
            }
            if (!string.IsNullOrEmpty(team_name)) {
                sBuilder.Append(string.Format(@" and report_team_name = '{0}' ", team_name));
            }
            if (!string.IsNullOrEmpty(pn))
            {
                sBuilder.Append(string.Format(@" and products_name = '{0}' ", pn));
            }
            if (!string.IsNullOrEmpty(report_year_month_str))
            {
                sBuilder.Append(string.Format(@" and trunc(report_year_month,'MM') = to_date('{0}','yyyy-MM')", report_year_month_str));
            }
            sBuilder.Append(" order by seq asc");
            System.Data.DataTable dt = OracleDaoHelper.getDTBySql(sBuilder.ToString());
            return dt;
        }
        public static DataTable getAllTeamName(string report_year_month_str) {
            string sqlStr = string.Format(@"select seq,
                                                       g_seq,
                                                        report_team_name
                                                from (   
                                                      select row_number()over(partition by report_team_name order by seq) g_seq,
                                                                                        report_team_name,
                                                                                        seq
                                                      from Line_Each_One_Quantities
                                                      where trunc(report_year_month,'MM')= to_date('{0}','yyyy-MM')
                                                ) temp 
                                                where g_seq = 1
                                                order by seq asc",
                                                report_year_month_str);
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
        public static DataTable getAllProductsNameOfTeam(string report_year_month_str, string report_team_name)
        {
            string sqlStr = string.Format(@"select seq,
                                                       g_seq,
                                                        products_name
                                                from (   
                                                      select row_number()over(partition by products_name order by seq) g_seq,
                                                                                        products_name,
                                                                                        seq
                                                      from Line_Each_One_Quantities
                                                      where trunc(report_year_month,'MM')= to_date('{0}','yyyy-MM')
                                                      and report_team_name = '{1}'
                                                ) temp 
                                                where g_seq = 1
                                                order by seq asc", report_year_month_str, report_team_name);
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
    }
}
