
using System.Data;
using System.Windows;
using Tools;

namespace Products_Cost
{
    public class Team_Info
    {
        private string _team_name;
        private string _monitor;

        public Team_Info(string team_name,string monitor)
        {
            _team_name = team_name;
            this._monitor = monitor;
        }

        public string team_name { get => _team_name; set => _team_name = value; }
        public string Monitor { get => _monitor; set => _monitor = value; }

        public static bool ifExistsTheTeam(string team_name) {
            string sqlStr = string.Format(@"SELECT 1 FROM Team_Info where team_name = '{0}'", team_name);
            return OracleDaoHelper.getDTBySql(sqlStr).Rows.Count > 0 ? true : false;
        }
        public int add() {
            string sqlStr = string.Format(@"INSERT INTO Team_Info(team_name,monitor)values('{0}','{1}')", _team_name,_monitor);
            return OracleDaoHelper.executeSQL(sqlStr);
        }
        /// <summary>
        /// 判断当月产量记录中是否存在该组。
        /// </summary>
        /// <param name="team_name"></param>
        /// <returns></returns>
        public static int delete(string team_name) {
            if (Line_Each_One_Quantities.ifExistsTheTeamNameOfTheCurrMonth(team_name)) {
                MessageBox.Show("当前月份产量记录表中存在该线体，暂不能删除！", "提示！", MessageBoxButton.OK, MessageBoxImage.Information);
                return 0;
            }
            string sqlStr = string.Format(@"DELETE FROM Team_Info where team_name = '{0}'", team_name);
            return OracleDaoHelper.executeSQL(sqlStr);
        }
        public static DataTable getAllTeamInfo() {
            string sqlStr = string.Format(@"SELECT team_name,monitor,create_time FROM Team_Info order by create_time desc");
            return OracleDaoHelper.getDTBySql(sqlStr);
        }
    }
}
