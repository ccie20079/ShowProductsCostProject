using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
namespace Tools
{
    public partial class FrmCloseExcel : Form
    {
        public FrmCloseExcel()
        {
            InitializeComponent();
        }

        private void FrmPrompt_Load(object sender, EventArgs e)
        {
            timer_Close_Excel.Start();
        }
        int count = 20;
        private void timer_Close_Excel_Tick(object sender, EventArgs e)
        {
            if (count == 0) {
                timer_Close_Excel.Stop();
                CmdHelper.killTaskByImageName("EXCEL.EXE");
                this.Close();
                return;
            }
            count--;
            btnCloseAllExcel.Text = count.ToString();
        }

        private void FrmPrompt_FormClosed(object sender, FormClosedEventArgs e)
        {
            timer_Close_Excel.Stop();
            CmdHelper.killTaskByImageName("EXCEL.EXE");
        }

        private void btnCloseAllExcel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
