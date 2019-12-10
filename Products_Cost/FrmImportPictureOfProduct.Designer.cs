namespace Products_Cost
{
    partial class FrmImportPictureOfProduct
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
            this.tbPath = new System.Windows.Forms.TextBox();
            this.btnImportProductsCost = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // tbPath
            // 
            this.tbPath.Font = new System.Drawing.Font("宋体", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.tbPath.Location = new System.Drawing.Point(284, 90);
            this.tbPath.Name = "tbPath";
            this.tbPath.Size = new System.Drawing.Size(878, 38);
            this.tbPath.TabIndex = 3;
            // 
            // btnImportProductsCost
            // 
            this.btnImportProductsCost.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnImportProductsCost.Location = new System.Drawing.Point(33, 83);
            this.btnImportProductsCost.Name = "btnImportProductsCost";
            this.btnImportProductsCost.Size = new System.Drawing.Size(203, 45);
            this.btnImportProductsCost.TabIndex = 2;
            this.btnImportProductsCost.Text = "导入成衣图片";
            this.btnImportProductsCost.UseVisualStyleBackColor = true;
            this.btnImportProductsCost.Click += new System.EventHandler(this.btnImportProductsCost_Click);
            // 
            // FrmImportPictureOfProduct
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.SkyBlue;
            this.ClientSize = new System.Drawing.Size(1217, 306);
            this.Controls.Add(this.tbPath);
            this.Controls.Add(this.btnImportProductsCost);
            this.Name = "FrmImportPictureOfProduct";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "导入成品图片";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.FrmImportPictureOfProduct_FormClosed);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.TextBox tbPath;
        private System.Windows.Forms.Button btnImportProductsCost;
    }
}