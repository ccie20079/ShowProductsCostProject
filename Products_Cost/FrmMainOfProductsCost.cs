using System;
using System.Windows.Forms;
using Tools;
using Products_Cost.Interface;
using Products_Cost.ImplClass;
using Excel;

namespace Products_Cost
{
    public partial class FrmMainOfProductsCost : Form
    {
        //=====================================================================
        // Project Name        :    Products_Cost  
        // Project Description : 
        // Class Name          :    Class1
        // File Name           :    Class1
        // Namespace           :    Products_Cost 
        // Class Version       :    v1.0.0.0
        // Class Description   : 
        // CLR                 :    4.0.30319.42000  
        // Author              :    董   魁  (ccie20079@126.com)
        // Addr                :    中国  陕西 咸阳    
        // Create Time         :    2019-10-22 15:15:12
        // Modifier:     
        // Update Time         :    2019-10-22 15:15:12
        //======================================================================
        // Copyright © DGCZ  2019 . All rights reserved.
        // =====================================================================
        MyExcel myExcel = null;
        FrmImportProductsCost frmImportProductsCost = null;
        FrmProductsCostSummary frmProductsCostSummary = null;
        FrmExportProductsCostDetail frmExportProductsCostDetail = null;
        private FrmDLProductsRecordTemplate frmDLProductsRecordTemplate = null;
        private FrmSameProcessExport frmSameProcessExport = null;
        private FrmImportEachOneQuantitiesOfTheLine frmImportEachOneQuantitiesOfTheLine = null;
        private FrmQueryTeamAndLine_Quantities frmQueryTeamAndLine_Quantities = null;
        private FrmQueryOddJobAndExportToExcel frmQueryOddJobAndExportToExcel = null;
        private FrmImportQuantitiesOfOddJob frmImportQuantitiesOfOddJob = null;
        private FrmLineInfoConfig frmLineInfoConfig = null;
        public FrmMainOfProductsCost()
        {
            InitializeComponent();
        }
     
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FrmMainOfAttendanceRecord_Load(object sender, EventArgs e)
        {
            this.Text += " " + Application.ProductVersion;
            //this.lblUserName.Text = Program._userInfo.Department + "   " + Program._userInfo.User_Name; ;
            //this.lblUserName.BackColor = this.mStrip.BackColor;
        }
        /// <summary>
        /// 下载模板。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tsBtnDownLoadTemplate_Click(object sender, EventArgs e)
        {
            IDownloadTemplate iDownloadTemplate = new DownloadExcelTemplate();
            myExcel = iDownloadTemplate.write_Template_For_Record_P_C();
            notifyIcon.ShowBalloonTip(6000, "提示：", "模板保存于：" + myExcel.Path, ToolTipIcon.Info);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void showTemplateToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (null == myExcel) {
                myExcel = new MyExcel(DownloadExcelTemplate.path);
            }
            AppManagement.add(myExcel.open(true));
        }

        private void FrmMainOfProductsCost_FormClosed(object sender, FormClosedEventArgs e)
        {
            AppManagement.closeAllExcel();
        }
        /// <summary>
        /// 导入成衣成本。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tsBtnImportProductsCost_Click(object sender, EventArgs e)
        {
            //先判断品名是否填写。
            if (frmImportProductsCost == null || frmImportProductsCost.IsDisposed) {
                frmImportProductsCost = new FrmImportProductsCost();
            }
            frmImportProductsCost.MdiParent = this;
            frmImportProductsCost.Show();
        }

        private void tsBtnProductsCostSummary_Click(object sender, EventArgs e)
        {
            //先判断品名是否填写。
             if (frmProductsCostSummary == null || frmProductsCostSummary.IsDisposed)
            {
                frmProductsCostSummary = new FrmProductsCostSummary();
            }
            frmProductsCostSummary.MdiParent = this;
            frmProductsCostSummary.Show();
            frmProductsCostSummary.Focus();
        }
        /// <summary>
        /// 导出成品信息。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tsBtnExportProductsCostDetail_Click(object sender, EventArgs e)
        {
            //先判断品名是否填写。
            if (frmExportProductsCostDetail == null || frmExportProductsCostDetail.IsDisposed)
            {
                frmExportProductsCostDetail = new FrmExportProductsCostDetail();
            }
            frmExportProductsCostDetail.MdiParent = this;
            frmExportProductsCostDetail.Show();
        }

        private void tbProductsRecordReportExport_Click(object sender, EventArgs e)
        {
            //先判断品名是否填写。
            if (frmDLProductsRecordTemplate == null || frmDLProductsRecordTemplate.IsDisposed)
            {
                frmDLProductsRecordTemplate = new FrmDLProductsRecordTemplate();
            }
            frmDLProductsRecordTemplate.MdiParent = this;
            frmDLProductsRecordTemplate.Show();
        }
        /// <summary>
        /// 同名工序导出。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tsBtnDefaultProcessExport_Click(object sender, EventArgs e)
        {
            //先判断品名是否填写。
            if (frmSameProcessExport == null || frmSameProcessExport.IsDisposed)
            {
                frmSameProcessExport = new FrmSameProcessExport();
            }
            frmSameProcessExport.MdiParent = this;
            frmSameProcessExport.Show();
        }
        /// <summary>
        /// 导入小组月产量
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void importEachOneQuatitiesOfMonthReportToolStripButton_Click(object sender, EventArgs e)
        {
             //先判断品名是否填写。
            if (frmImportEachOneQuantitiesOfTheLine == null || frmImportEachOneQuantitiesOfTheLine.IsDisposed)
            {
                frmImportEachOneQuantitiesOfTheLine = new FrmImportEachOneQuantitiesOfTheLine();
            }
            frmImportEachOneQuantitiesOfTheLine.MdiParent = this;
            frmImportEachOneQuantitiesOfTheLine.Show();
        }

        private void queryQuantitiesOfTeamToolStripButton1_Click(object sender, EventArgs e)
        {
            if (frmQueryTeamAndLine_Quantities == null || frmQueryTeamAndLine_Quantities.IsDisposed)
            {
                frmQueryTeamAndLine_Quantities = new FrmQueryTeamAndLine_Quantities();
            }
            frmQueryTeamAndLine_Quantities.MdiParent = this;
            frmQueryTeamAndLine_Quantities.Show();
        }

        private void queryOddJobToolStripButton_Click(object sender, EventArgs e)
        {
            if (frmQueryOddJobAndExportToExcel == null || frmQueryOddJobAndExportToExcel.IsDisposed)
            {
                frmQueryOddJobAndExportToExcel = new FrmQueryOddJobAndExportToExcel();
            }
            frmQueryOddJobAndExportToExcel.MdiParent = this;
            frmQueryOddJobAndExportToExcel.Show();
        }

        private void importQuantitiesOfOddJob_Click(object sender, EventArgs e)
        {
            if (frmImportQuantitiesOfOddJob == null || frmImportQuantitiesOfOddJob.IsDisposed)
            {
                frmImportQuantitiesOfOddJob = new FrmImportQuantitiesOfOddJob();
            }
            frmImportQuantitiesOfOddJob.MdiParent = this;
            frmImportQuantitiesOfOddJob.Show();
        }

        private void lineInfoToolStripButton_Click(object sender, EventArgs e)
        {
            if (frmLineInfoConfig == null || frmLineInfoConfig.IsDisposed)
            {
                frmLineInfoConfig = new FrmLineInfoConfig();
            }
            frmLineInfoConfig.MdiParent = this;
            frmLineInfoConfig.Show();
        }
    }
}
