using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Products_Cost.Interface;
using Products_Cost.ImplClass;
using Tools;
namespace Products_Cost
{
    public partial class FrmProductsCostDetail : Form
    {
        private string _pName;
        public FrmProductsCostDetail()
        {
            InitializeComponent();
        }

        public string PName
        {
            get
            {
                return _pName;
            }

            set
            {
                _pName = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FrmProductsCostDetail_Load(object sender, EventArgs e)
        {
            IShowProductsCostDetail iShowProductsCostDetail = new ShowProductsCostDetailImpl();
            this.dgv.DataSource = iShowProductsCostDetail.getProductsDetail(_pName);
            DGVHelper.AutoSizeForDGV(dgv);
        }
    }
}
