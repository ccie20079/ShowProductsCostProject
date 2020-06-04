using Microsoft.Office.Interop.Excel;
using System;
using System.Data;
using System.Windows.Forms;
using Tools;

namespace Products_Cost
{
    public partial class FrmLineInfoConfig : Form
    {
         public static string _action ="admin";
   
        public FrmLineInfoConfig()
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
            string line_name = dr.Cells["Line_Name"].Value.ToString();
            LineInfo.delete(line_name);
            this.dgv.DataSource = LineInfo.getAllLineInfo();
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
            string line_name = tbLineName.Text.Trim();
            if (string.IsNullOrEmpty(line_name)) return;
            //判断是否已经存在
            if (LineInfo.ifExistsTheLine(line_name)) {
                ShowResult.show(lblResult, "此线体已存在！", false);
                timerRestoreTheLblResult.Start();
                return;
            }
            LineInfo lineInfo = new LineInfo(line_name);
            lineInfo.add();
            //重新获取线体信息
            this.dgv.DataSource = LineInfo.getAllLineInfo();
            DGVHelper.AutoSizeForDGV(dgv);
        }

        private void FrmLineInfoConfig_Load(object sender, EventArgs e)
        {
            this.dgv.DataSource = LineInfo.getAllLineInfo();
            DGVHelper.AutoSizeForDGV(dgv);
        }

        private void tbLineName_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar != 13) return;
            btnAdd_Click(sender, e);
        }
    }
}
