using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Tools;

namespace Products_Cost
{
    class Line_Each_One_Quantities
    {
        private String _line_name;
        private string _team_name;
        private String  _products_name;
        private String  _summary_process;
        private String  _specific_process; 
        private String  _emp_name; 
        private int  _quantities;
        private int _man_hour;
        private decimal _amount_of_money;
       
        private String  _year_and_month_str;

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

        public int save() {
            string sqlStr = string.Format(@"insert into line_each_one_quantities (
                                                         line_name, 
                                                            team_name,
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
                                                            {5},
                                                            {6},
                                                          '{7}',
                                                          {8},
                                                          to_date('{9}','yyyy-MM')
                                                  )",this._line_name,
                                                  _team_name,
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
    }
}
