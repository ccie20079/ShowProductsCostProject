namespace Products_Cost
{
    partial class FrmDLProductsRecordTemplate
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.btnExport = new System.Windows.Forms.Button();
            this.lblPN = new System.Windows.Forms.Label();
            this.cbPN = new System.Windows.Forms.ComboBox();
            this.timerRestoreLblResult = new System.Windows.Forms.Timer(this.components);
            this.lblResult = new System.Windows.Forms.Label();
            this.dgv = new System.Windows.Forms.DataGridView();
            this.pb = new System.Windows.Forms.ProgressBar();
            this.lblPrompt = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            this.SuspendLayout();
            // 
            // btnExport
            // 
            this.btnExport.Font = new System.Drawing.Font("宋体", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnExport.Location = new System.Drawing.Point(1160, 108);
            this.btnExport.Name = "btnExport";
            this.btnExport.Size = new System.Drawing.Size(163, 42);
            this.btnExport.TabIndex = 6;
            this.btnExport.Text = "导出";
            this.btnExport.UseVisualStyleBackColor = true;
            this.btnExport.Click += new System.EventHandler(this.btnExport_Click);
            // 
            // lblPN
            // 
            this.lblPN.AutoSize = true;
            this.lblPN.Font = new System.Drawing.Font("宋体", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblPN.Location = new System.Drawing.Point(46, 108);
            this.lblPN.Name = "lblPN";
            this.lblPN.Size = new System.Drawing.Size(120, 27);
            this.lblPN.TabIndex = 5;
            this.lblPN.Text = "成衣名称";
            // 
            // cbPN
            // 
            this.cbPN.Font = new System.Drawing.Font("宋体", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.cbPN.FormattingEnabled = true;
            this.cbPN.Location = new System.Drawing.Point(183, 105);
            this.cbPN.Name = "cbPN";
            this.cbPN.Size = new System.Drawing.Size(589, 35);
            this.cbPN.TabIndex = 4;
            this.cbPN.SelectedIndexChanged += new System.EventHandler(this.cbPN_SelectedIndexChanged);
            // 
            // timerRestoreLblResult
            // 
            this.timerRestoreLblResult.Interval = 5000;
            this.timerRestoreLblResult.Tick += new System.EventHandler(this.timerRestoreLblResult_Tick);
            // 
            // lblResult
            // 
            this.lblResult.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblResult.Location = new System.Drawing.Point(33, 665);
            this.lblResult.Name = "lblResult";
            this.lblResult.Size = new System.Drawing.Size(1290, 39);
            this.lblResult.TabIndex = 7;
            this.lblResult.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblResult.Click += new System.EventHandler(this.lblResult_Click);
            // 
            // dgv
            // 
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Location = new System.Drawing.Point(33, 236);
            this.dgv.Name = "dgv";
            this.dgv.RowTemplate.Height = 23;
            this.dgv.Size = new System.Drawing.Size(1290, 406);
            this.dgv.TabIndex = 8;
            // 
            // pb
            // 
            this.pb.ForeColor = System.Drawing.Color.White;
            this.pb.Location = new System.Drawing.Point(183, 667);
            this.pb.Name = "pb";
            this.pb.Size = new System.Drawing.Size(1140, 37);
            this.pb.TabIndex = 9;
            this.pb.Visible = false;
            // 
            // lblPrompt
            // 
            this.lblPrompt.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblPrompt.ForeColor = System.Drawing.Color.Black;
            this.lblPrompt.Location = new System.Drawing.Point(35, 665);
            this.lblPrompt.Name = "lblPrompt";
            this.lblPrompt.Size = new System.Drawing.Size(131, 38);
            this.lblPrompt.TabIndex = 10;
            this.lblPrompt.Text = "请稍等：";
            this.lblPrompt.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblPrompt.Visible = false;
            // 
            // FrmDLProductsRecordTemplate
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.SkyBlue;
            this.ClientSize = new System.Drawing.Size(1371, 713);
            this.Controls.Add(this.lblPrompt);
            this.Controls.Add(this.pb);
            this.Controls.Add(this.dgv);
            this.Controls.Add(this.lblResult);
            this.Controls.Add(this.btnExport);
            this.Controls.Add(this.lblPN);
            this.Controls.Add(this.cbPN);
            this.Name = "FrmDLProductsRecordTemplate";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "报工单模板下载";
            this.Load += new System.EventHandler(this.FrmDLTemplate_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnExport;
        private System.Windows.Forms.Label lblPN;
        private System.Windows.Forms.ComboBox cbPN;
        private System.Windows.Forms.Timer timerRestoreLblResult;
        private System.Windows.Forms.Label lblResult;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.ProgressBar pb;
        private System.Windows.Forms.Label lblPrompt;
    }
}