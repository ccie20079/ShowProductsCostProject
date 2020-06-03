using Excel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Tools;

namespace Products_Cost
{
    public partial class FrmQueryOddJobAndExportToExcel : Form
    {
        string year_and_month_str = string.Empty;
        string currPath = Application.StartupPath;
        public FrmQueryOddJobAndExportToExcel()
        {
            InitializeComponent();
        }
        /// <summary>
        /// this.cb_Team_name.SelectedIndexChanged -= new System.EventHandler(this.cb_Team_name_SelectedIndexChanged);
        ///  this.cb_Team_name.DisplayMember = "team_name";
        /// this.cb_Team_name.ValueMember = "team_name";
        /// DGVHelper.AutoSizeForDGV(dgv);
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void mCalendar_DateChanged(object sender, DateRangeEventArgs e)
        {
            year_and_month_str = e.Start.ToString("yyyy-MM");
            DataTable dt = OddJob.getAllEmpsName(year_and_month_str);
            this.cb_Emp_Name.SelectedIndexChanged -= new System.EventHandler(this.cb_Emp_Name_SelectedIndexChanged);
            this.cb_Emp_Name.DisplayMember = "emp_name";
            this.cb_Emp_Name.ValueMember = "emp_name";
            this.cb_Emp_Name.DataSource = dt;
            this.cb_Emp_Name.SelectedIndexChanged += new System.EventHandler(this.cb_Emp_Name_SelectedIndexChanged);
        }
         private void delToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null) return;
            OddJob.deleteQuantitiesOfOddJobBySeq(this.dgv.CurrentRow.Cells["seq"].Value.ToString());
            btnQuery_Click(sender, e);
        }
        private void btnQuery_Click(object sender, EventArgs e)
        {
            this.cb_Emp_Name_SelectedIndexChanged(sender, e);
        }
        /// <summary>
        /// 注意使用了string.format(@"")时，路径中的分隔符用\即可， 不适用\\
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ExportToExcelToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string filePath = currPath + "\\班组产量\\" + int.Parse(year_and_month_str.Substring(5, 2)).ToString() + "月_" + (string.IsNullOrEmpty(cb_Emp_Name.Text.Trim()) ? "All" : cb_Emp_Name.Text.Trim()) + "_" + TimeHelper.getCurrentTimeStr() + ".xls";
            ExcelHelper.saveDtToExcel((DataTable)this.dgv.DataSource, filePath);
            MessageBox.Show("存储完成！路径：" + filePath);
        }
        /// <summary>
        /// 按日期和姓名查询零活记录
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cb_Emp_Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.dgv.DataSource = OddJob.getQuantitiesOfOddJob(year_and_month_str, null, cb_Emp_Name.Text.Trim());
            DGVHelper.AutoSizeForDGV(dgv);
        }
    }
}
