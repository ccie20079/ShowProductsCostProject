namespace Products_Cost
{
    partial class FrmImportProductsCost
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
            this.btnImportProductsCost = new System.Windows.Forms.Button();
            this.tbPath = new System.Windows.Forms.TextBox();
            this.pb = new System.Windows.Forms.ProgressBar();
            this.dgv = new System.Windows.Forms.DataGridView();
            this.lblResult = new System.Windows.Forms.Label();
            this.timerRestoreLblResult = new System.Windows.Forms.Timer(this.components);
            this.lblPromptForPB = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            this.SuspendLayout();
            // 
            // btnImportProductsCost
            // 
            this.btnImportProductsCost.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnImportProductsCost.Location = new System.Drawing.Point(35, 82);
            this.btnImportProductsCost.Name = "btnImportProductsCost";
            this.btnImportProductsCost.Size = new System.Drawing.Size(203, 45);
            this.btnImportProductsCost.TabIndex = 0;
            this.btnImportProductsCost.Text = "导入成衣工时表";
            this.btnImportProductsCost.UseVisualStyleBackColor = true;
            this.btnImportProductsCost.Click += new System.EventHandler(this.btnImportProductsCost_Click);
            // 
            // tbPath
            // 
            this.tbPath.Font = new System.Drawing.Font("宋体", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.tbPath.Location = new System.Drawing.Point(289, 86);
            this.tbPath.Name = "tbPath";
            this.tbPath.Size = new System.Drawing.Size(1075, 38);
            this.tbPath.TabIndex = 1;
            // 
            // pb
            // 
            this.pb.ForeColor = System.Drawing.Color.White;
            this.pb.Location = new System.Drawing.Point(325, 669);
            this.pb.Name = "pb";
            this.pb.Size = new System.Drawing.Size(1039, 37);
            this.pb.TabIndex = 2;
            this.pb.Visible = false;
            // 
            // dgv
            // 
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Location = new System.Drawing.Point(36, 172);
            this.dgv.Name = "dgv";
            this.dgv.RowTemplate.Height = 23;
            this.dgv.Size = new System.Drawing.Size(1329, 466);
            this.dgv.TabIndex = 3;
            // 
            // lblResult
            // 
            this.lblResult.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblResult.Location = new System.Drawing.Point(35, 667);
            this.lblResult.Name = "lblResult";
            this.lblResult.Size = new System.Drawing.Size(1330, 39);
            this.lblResult.TabIndex = 4;
            // 
            // timerRestoreLblResult
            // 
            this.timerRestoreLblResult.Interval = 9000;
            this.timerRestoreLblResult.Tick += new System.EventHandler(this.timerRestoreLblResult_Tick);
            // 
            // lblPromptForPB
            // 
            this.lblPromptForPB.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblPromptForPB.Location = new System.Drawing.Point(35, 667);
            this.lblPromptForPB.Name = "lblPromptForPB";
            this.lblPromptForPB.Size = new System.Drawing.Size(284, 39);
            this.lblPromptForPB.TabIndex = 5;
            this.lblPromptForPB.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // FrmImportProductsCost
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.SkyBlue;
            this.ClientSize = new System.Drawing.Size(1395, 715);
            this.Controls.Add(this.lblPromptForPB);
            this.Controls.Add(this.lblResult);
            this.Controls.Add(this.dgv);
            this.Controls.Add(this.pb);
            this.Controls.Add(this.tbPath);
            this.Controls.Add(this.btnImportProductsCost);
            this.Name = "FrmImportProductsCost";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "导入成衣工价表";
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();
        }
        #endregion
        private System.Windows.Forms.Button btnImportProductsCost;
        private System.Windows.Forms.TextBox tbPath;
        private System.Windows.Forms.ProgressBar pb;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.Label lblResult;
        private System.Windows.Forms.Timer timerRestoreLblResult;
        private System.Windows.Forms.Label lblPromptForPB;
    }
}