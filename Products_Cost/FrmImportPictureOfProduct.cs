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
namespace Products_Cost
{
    public partial class FrmImportPictureOfProduct : Form
    {
        public FrmImportPictureOfProduct()
        {
            InitializeComponent();
        }
        private string defaultDir = Application.StartupPath + "\\Pictures\\";
        private void btnImportProductsCost_Click(object sender, EventArgs e)
        {
            string xlsFilePath = FileNameDialog.getSelectedFilePathWithDefaultDir("请选择成衣成本记录：", "*.jpg,*.jpeg|*.jpg;*.jpeg", defaultDir);
            if (string.IsNullOrEmpty(xlsFilePath))
            {
                return;
            }
            if (!File.Exists(xlsFilePath)) return;
            tbPath.Text = xlsFilePath;
            //关闭窗体。
            this.Close();
        }

        private void FrmImportPictureOfProduct_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.DialogResult = DialogResult.OK;
        }
    }
}
