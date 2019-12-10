using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Tools;
using System.IO;
using Excel;
using Oracle.DataAccess.Client;
using System.Data.OleDb;
using Products_Cost.Interface;
using Products_Cost.ImplClass;
using Microsoft.Office.Interop.Excel;
namespace Products_Cost
{
    public partial class FrmSameProcessExport : Form
    {
        string defaultDir = System.Windows.Forms.Application.StartupPath + "\\同名工序";
        string xlsFilePath = string.Empty;
        public FrmSameProcessExport()
        {
            InitializeComponent();
        }
        private void timerRestoreLblResult_Tick(object sender, EventArgs e)
        {
            timerRestoreLblResult.Stop();
            lblResult.Text = "";
            lblResult.BackColor = Color.SkyBlue;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void lblResult_Click(object sender, EventArgs e)
        {
            //打开改文件
            MyExcel myExcel = new MyExcel(xlsFilePath);
            AppManagement.add(myExcel.open(true));
        }

        private void exportToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (CmdHelper.ifExistsTheProcessByName("EXCEL")) {
                return;
            }
            string _fileName = "同名工序_" + DateTime.Now.ToString("yyyy-MM-dd") + ".xls";
            xlsFilePath = FileNameDialog.getSaveFileNameWithDefaultDir("同名工序汇总：", "*.xls|*.xls", defaultDir, _fileName);
            if (!xlsFilePath.Contains(@"\"))
            {
                return;
            }
            System.Data.DataTable dt = (System.Data.DataTable)dgv.DataSource;
            ExcelHelper.saveDtToExcelWithProgressBar(dt, xlsFilePath, pb);
            //((FrmMainOfProductsCost)this.ParentForm).notifyIcon.ShowBalloonTip(7000, "提示：","汇总保存于: " + xlsFilePath, ToolTipIcon.Info);
            ShowResult.show(lblResult, "汇总保存于: " + xlsFilePath, true);
            timerRestoreLblResult.Start();
        }

        private void FrmSameProcessExport_Load(object sender, EventArgs e)
        {
            this.dgv.DataSource = OracleDaoHelper.getDTBySql(string.Format(@"SELECT * FROM V_Same_Process"));
            DGVHelper.AutoSizeForDGV(dgv);
        }
    }
}
