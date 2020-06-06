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
    public partial class FrmQueryTeamAndLine_Quantities_MonthRecord : Form
    {
        string year_and_month_str = string.Empty;
        public FrmQueryTeamAndLine_Quantities_MonthRecord()
        {
            InitializeComponent();
        }

        private void mCalendar_DateChanged(object sender, DateRangeEventArgs e)
        {
            year_and_month_str = e.Start.ToString("yyyy-MM");
            //显示该日期下所有的组
            DataTable dt = Line_Each_One_Quantities.getAllTeamName(year_and_month_str);
            this.cb_Team_name.DataSource = null;
            this.cb_PN.DataSource = null;
            this.cb_Team_name.SelectedIndexChanged -= new System.EventHandler(this.cb_Team_name_SelectedIndexChanged);
            this.cb_Team_name.DataSource = dt;
            this.cb_Team_name.DisplayMember = "team_name";
            this.cb_Team_name.ValueMember = "team_name";
            this.cb_Team_name.SelectedIndexChanged += new System.EventHandler(this.cb_Team_name_SelectedIndexChanged);
        }
        /// <summary>
        /// 选定组名后，可以产生产品名
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cb_Team_name_SelectedIndexChanged(object sender, EventArgs e)
        {

            DataTable dt = Line_Each_One_Quantities.getAllProductsNameOfTeam(year_and_month_str, this.cb_Team_name.Text.Trim());
            this.cb_PN.DataSource = null;
            this.cb_PN.SelectedIndexChanged-= new System.EventHandler(this.cb_PN_SelectedIndexChanged);
            this.cb_PN.DataSource = dt;
            this.cb_PN.DisplayMember = "products_name";
            this.cb_PN.ValueMember = "products_name";
            this.cb_PN.SelectedIndexChanged += new System.EventHandler(this.cb_PN_SelectedIndexChanged);
        }
        /// <summary>
        /// 加载本组，本产品的信息。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cb_PN_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.dgv.DataSource = Line_Each_One_Quantities.getAllQuantitiesOfTheLine_team_pn_report(null, this.cb_Team_name.Text.Trim(), this.cb_PN.Text.Trim(), year_and_month_str);
            DGVHelper.AutoSizeForDGV(dgv);
        }

        private void delToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Line_Each_One_Quantities.deleteTheQuantities(cb_Team_name.Text.Trim(), cb_PN.Text.Trim(), year_and_month_str);
            this.cb_PN_SelectedIndexChanged(sender, e);
        }
        private void btnQuery_Click(object sender, EventArgs e)
        {
            this.cb_PN_SelectedIndexChanged(sender, e);
        }
        /// <summary>
        /// 注意使用了string.format(@"")时，路径中的分隔符用\即可， 不适用\\
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ExportToExcelToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string filePath = string.Format(@"{0}\班组产量\{1}_{2}_{3}月_{4}.xls", Application.StartupPath,
                                                                        string.IsNullOrEmpty(cb_Team_name.Text.Trim())?"所有组": cb_Team_name.Text.Trim(),
                                                                            string.IsNullOrEmpty(cb_PN.Text.Trim())?"所有产品":cb_PN.Text.Trim(),
                                                                            int.Parse(year_and_month_str.Substring(5,2)),
                                                                            TimeHelper.getCurrentTimeStr());
            ExcelHelper.saveDtToExcel((DataTable)this.dgv.DataSource, filePath);
            MessageBox.Show("导出完成，路径："+filePath);
        }
    }
}
