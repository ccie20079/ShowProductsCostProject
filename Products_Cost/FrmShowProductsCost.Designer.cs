namespace Products_Cost
{
    partial class FrmShowProductsCost
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要修改
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmShowProductsCost));
            this.btnLater = new System.Windows.Forms.Button();
            this.btnPrevious = new System.Windows.Forms.Button();
            this.pB = new System.Windows.Forms.PictureBox();
            this.lblProductsCost = new System.Windows.Forms.Label();
            this.lblPN = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pB)).BeginInit();
            this.SuspendLayout();
            // 
            // btnLater
            // 
            this.btnLater.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnLater.AutoSize = true;
            this.btnLater.Font = new System.Drawing.Font("宋体", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnLater.Location = new System.Drawing.Point(406, 580);
            this.btnLater.Name = "btnLater";
            this.btnLater.Size = new System.Drawing.Size(82, 41);
            this.btnLater.TabIndex = 3;
            this.btnLater.Text = ">>";
            this.btnLater.UseVisualStyleBackColor = true;
            // 
            // btnPrevious
            // 
            this.btnPrevious.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnPrevious.Font = new System.Drawing.Font("宋体", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnPrevious.Location = new System.Drawing.Point(12, 580);
            this.btnPrevious.Name = "btnPrevious";
            this.btnPrevious.Size = new System.Drawing.Size(82, 41);
            this.btnPrevious.TabIndex = 4;
            this.btnPrevious.Text = "<<";
            this.btnPrevious.UseVisualStyleBackColor = true;
            // 
            // pB
            // 
            this.pB.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.pB.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pB.Image = ((System.Drawing.Image)(resources.GetObject("pB.Image")));
            this.pB.Location = new System.Drawing.Point(12, 33);
            this.pB.Name = "pB";
            this.pB.Size = new System.Drawing.Size(476, 529);
            this.pB.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pB.TabIndex = 2;
            this.pB.TabStop = false;
            this.pB.Click += new System.EventHandler(this.pB_Click);
            // 
            // lblProductsCost
            // 
            this.lblProductsCost.AutoSize = true;
            this.lblProductsCost.Font = new System.Drawing.Font("宋体", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblProductsCost.Location = new System.Drawing.Point(339, 649);
            this.lblProductsCost.Name = "lblProductsCost";
            this.lblProductsCost.Size = new System.Drawing.Size(149, 24);
            this.lblProductsCost.TabIndex = 5;
            this.lblProductsCost.Text = "成本：999元";
            this.lblProductsCost.Click += new System.EventHandler(this.lblProductsCost_Click);
            // 
            // lblPN
            // 
            this.lblPN.Font = new System.Drawing.Font("宋体", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblPN.Location = new System.Drawing.Point(12, 649);
            this.lblPN.Name = "lblPN";
            this.lblPN.Size = new System.Drawing.Size(299, 31);
            this.lblPN.TabIndex = 6;
            this.lblPN.Text = "复古英伦男士西装";
            // 
            // FrmShowProductsCost
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.SkyBlue;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.ClientSize = new System.Drawing.Size(492, 682);
            this.Controls.Add(this.lblPN);
            this.Controls.Add(this.lblProductsCost);
            this.Controls.Add(this.btnPrevious);
            this.Controls.Add(this.btnLater);
            this.Controls.Add(this.pB);
            this.Name = "FrmShowProductsCost";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "成衣造价显示";
            this.Load += new System.EventHandler(this.FrmShowProductsCost_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pB)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button btnLater;
        private System.Windows.Forms.Button btnPrevious;
        private System.Windows.Forms.PictureBox pB;
        private System.Windows.Forms.Label lblProductsCost;
        private System.Windows.Forms.Label lblPN;
    }
}

