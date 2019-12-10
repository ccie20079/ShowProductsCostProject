using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Products_Cost
{
    public partial class FrmShowProductsCost : Form
    {
        public FrmShowProductsCost()
        {
            InitializeComponent();
        }

        private void lblProductsCost_Click(object sender, EventArgs e)
        {

        }

        private void FrmShowProductsCost_Load(object sender, EventArgs e)
        {
    
        }
        /// <summary>
        /// 双击图片，弹出该产品的明细。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void pB_Click(object sender, EventArgs e)
        {
            FrmProductsCostDetail frmProductsCostDetail = new FrmProductsCostDetail();
            frmProductsCostDetail.PName = lblPN.Text.Trim();
            frmProductsCostDetail.Show();
            frmProductsCostDetail.Focus();     
        }
    }
}
