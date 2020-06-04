
using System.Data;
using System.Windows;
using Tools;

namespace Products_Cost
{
    public class LineInfo
    {
        private string _line_name;

        public LineInfo(string line_name)
        {
            Line_name = line_name;
        }

        public string Line_name { get => _line_name; set => _line_name = value; }

        public static bool ifExistsTheLine(string line_name) {
            string sqlStr = string.Format(@"SELECT 1 FROM Line_Info where line_name = '{0}'", line_name);
            return OracleDaoHelper.getDTBySql(sqlStr).Rows.Count > 0 ? true : false;
        }
        public int add() {
            string sqlStr = string.Format(@"INSERT INTO Line_Info(Line_Name)values('{0}')", _line_name);
            return OracleDaoHelper.executeSQL(sqlStr);
        }
        public static int delete(string line_name) {
            //先判断本月 产量Line_each_one_quantities 中是否已有该线体
            if (Line_Each_One_Quantities.ifExistsTheLineNameOfTheCurrMonth(line_name)) {
                MessageBox.Show("当前月份产量记录表中存在该线体，暂不能删除！", "提示！", MessageBoxButton.OK, MessageBoxImage.Information);
                return 0;
            }
            string sqlStr = string.Format(@"DELETE FROM Line_Info where Line_name = '{0}'",line_name);
            return OracleDaoHelper.executeSQL(sqlStr);
        }
        public static DataTable getAllLineInfo() {
            string sqlStr = string.Format(@"SELECT Line_Name,create_time FROM Line_Info order by create_time desc");
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
    }
}
