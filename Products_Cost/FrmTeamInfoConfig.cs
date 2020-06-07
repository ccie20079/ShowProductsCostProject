using System;
using Tools;
using System.Windows.Forms;

namespace Products_Cost
{
    public partial class FrmTeamInfoConfig : Form
    {
        public static string _action = "admin";
        public FrmTeamInfoConfig()
        {
            InitializeComponent();
        }
        /// <summary>
        /// 删除该行。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void delToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DataGridViewRow dr = dgv.CurrentRow;
            if (dr == null) return;
            string report_team_name = dr.Cells["report_team_name"].Value.ToString();
            Team_Info.delete(report_team_name);
            this.dgv.DataSource = Team_Info.getAllTeamInfo();
            DGVHelper.AutoSizeForDGV(dgv);
        }

        private void timerRestoreTheLblResult_Tick(object sender, EventArgs e)
        {
            timerRestoreTheLblResult.Enabled = false;
            lblResult.Text = "";
            lblResult.BackColor = this.BackColor;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            string report_team_name = tbTeam_name.Text.Trim();
            string monitor = tbMonitor.Text.Trim();
            if (string.IsNullOrEmpty(report_team_name)) return;
            //判断是否已经存在
            if (Team_Info.ifExistsTheTeam(report_team_name))
            {
                ShowResult.show(lblResult, "此班组已存在！", false);
                timerRestoreTheLblResult.Start();
                return;
            }
            Team_Info team_Info = new Team_Info(report_team_name, monitor);
            team_Info.add();
            //重新获取线体信息
            this.dgv.DataSource = Team_Info.getAllTeamInfo();
            DGVHelper.AutoSizeForDGV(dgv);
        }

        private void FrmTeamInfoConfig_Load(object sender, EventArgs e)
        {
            this.dgv.DataSource = Team_Info.getAllTeamInfo();
            DGVHelper.AutoSizeForDGV(dgv);
        }

        private void tbTeam_name_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar != 13) return;
            btnAdd_Click(sender, e);
        }


      
    }
}
