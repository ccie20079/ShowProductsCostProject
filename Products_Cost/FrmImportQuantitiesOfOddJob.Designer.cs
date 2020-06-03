namespace Products_Cost
{
    partial class FrmImportQuantitiesOfOddJob

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
            this.btnImportExcelToDB = new System.Windows.Forms.Button();
            this.tbPath = new System.Windows.Forms.TextBox();
            this.pb = new System.Windows.Forms.ProgressBar();
            this.dgv = new System.Windows.Forms.DataGridView();
            this.lblResult = new System.Windows.Forms.Label();
            this.timerRestoreLblResult = new System.Windows.Forms.Timer(this.components);
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            this.SuspendLayout();
            // 
            // btnImportExcelToDB
            // 
            this.btnImportExcelToDB.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnImportExcelToDB.Location = new System.Drawing.Point(35, 82);
            this.btnImportExcelToDB.Name = "btnImportExcelToDB";
            this.btnImportExcelToDB.Size = new System.Drawing.Size(177, 42);
            this.btnImportExcelToDB.TabIndex = 0;
            this.btnImportExcelToDB.Text = "导入零活";
            this.btnImportExcelToDB.UseVisualStyleBackColor = true;
            this.btnImportExcelToDB.Click += new System.EventHandler(this.btnImportProductsCost_Click);
            // 
            // tbPath
            // 
            this.tbPath.Font = new System.Drawing.Font("宋体", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.tbPath.Location = new System.Drawing.Point(242, 86);
            this.tbPath.Name = "tbPath";
            this.tbPath.Size = new System.Drawing.Size(1122, 38);
            this.tbPath.TabIndex = 1;
            // 
            // pb
            // 
            this.pb.ForeColor = System.Drawing.Color.White;
            this.pb.Location = new System.Drawing.Point(1001, 669);
            this.pb.Name = "pb";
            this.pb.Size = new System.Drawing.Size(363, 37);
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
            this.lblResult.Size = new System.Drawing.Size(960, 39);
            this.lblResult.TabIndex = 4;
            // 
            // timerRestoreLblResult
            // 
            this.timerRestoreLblResult.Interval = 9000;
            this.timerRestoreLblResult.Tick += new System.EventHandler(this.timerRestoreLblResult_Tick);
            // 
            // label1
            // 
            this.label1.Font = new System.Drawing.Font("宋体", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label1.Location = new System.Drawing.Point(1082, 40);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(282, 24);
            this.label1.TabIndex = 22;
            this.label1.Text = "复制后，请修改窗体name属性！";
            this.label1.Visible = false;
            // 
            // FrmImportQuantitiesOfOddJob
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.SkyBlue;
            this.ClientSize = new System.Drawing.Size(1395, 715);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.lblResult);
            this.Controls.Add(this.dgv);
            this.Controls.Add(this.pb);
            this.Controls.Add(this.tbPath);
            this.Controls.Add(this.btnImportExcelToDB);
            this.Name = "FrmImportQuantitiesOfOddJob";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "导入零活记录";
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }
        #endregion
        private System.Windows.Forms.Button btnImportExcelToDB;
        private System.Windows.Forms.TextBox tbPath;
        private System.Windows.Forms.ProgressBar pb;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.Label lblResult;
        private System.Windows.Forms.Timer timerRestoreLblResult;
        private System.Windows.Forms.Label label1;
    }
}