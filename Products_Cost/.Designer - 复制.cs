namespace Products_Cost
{
    partial class FrmLineInfoConfig
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
            this.dgv = new System.Windows.Forms.DataGridView();
            this.cms = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.delToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.timerRestoreTheLblResult = new System.Windows.Forms.Timer(this.components);
            this.btnAdd = new System.Windows.Forms.Button();
            this.lblLineName = new System.Windows.Forms.Label();
            this.tbLineName = new System.Windows.Forms.TextBox();
            this.lblResult = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            this.cms.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgv
            // 
            this.dgv.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.ContextMenuStrip = this.cms;
            this.dgv.Location = new System.Drawing.Point(36, 226);
            this.dgv.MultiSelect = false;
            this.dgv.Name = "dgv";
            this.dgv.ReadOnly = true;
            this.dgv.RowTemplate.Height = 23;
            this.dgv.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgv.Size = new System.Drawing.Size(987, 371);
            this.dgv.TabIndex = 2;
            // 
            // cms
            // 
            this.cms.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.delToolStripMenuItem});
            this.cms.Name = "cms";
            this.cms.Size = new System.Drawing.Size(101, 26);
            // 
            // delToolStripMenuItem
            // 
            this.delToolStripMenuItem.Name = "delToolStripMenuItem";
            this.delToolStripMenuItem.Size = new System.Drawing.Size(100, 22);
            this.delToolStripMenuItem.Text = "删除";
            this.delToolStripMenuItem.Click += new System.EventHandler(this.delToolStripMenuItem_Click);
            // 
            // timerRestoreTheLblResult
            // 
            this.timerRestoreTheLblResult.Interval = 7000;
            this.timerRestoreTheLblResult.Tick += new System.EventHandler(this.timerRestoreTheLblResult_Tick);
            // 
            // btnAdd
            // 
            this.btnAdd.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAdd.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.btnAdd.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnAdd.Location = new System.Drawing.Point(865, 139);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(158, 40);
            this.btnAdd.TabIndex = 12;
            this.btnAdd.Text = "增加线体";
            this.btnAdd.UseVisualStyleBackColor = false;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // lblLineName
            // 
            this.lblLineName.Location = new System.Drawing.Point(45, 139);
            this.lblLineName.Name = "lblLineName";
            this.lblLineName.Size = new System.Drawing.Size(86, 27);
            this.lblLineName.TabIndex = 13;
            this.lblLineName.Text = "线体名：";
            // 
            // tbLineName
            // 
            this.tbLineName.Location = new System.Drawing.Point(147, 136);
            this.tbLineName.Name = "tbLineName";
            this.tbLineName.Size = new System.Drawing.Size(185, 29);
            this.tbLineName.TabIndex = 14;
            this.tbLineName.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.tbLineName_KeyPress);
            // 
            // lblResult
            // 
            this.lblResult.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblResult.Location = new System.Drawing.Point(36, 626);
            this.lblResult.Name = "lblResult";
            this.lblResult.Size = new System.Drawing.Size(987, 40);
            this.lblResult.TabIndex = 3;
            // 
            // FrmLineInfoConfig
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 19F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.SkyBlue;
            this.ClientSize = new System.Drawing.Size(1058, 675);
            this.Controls.Add(this.tbLineName);
            this.Controls.Add(this.lblLineName);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.lblResult);
            this.Controls.Add(this.dgv);
            this.Font = new System.Drawing.Font("宋体", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.Margin = new System.Windows.Forms.Padding(5);
            this.MaximizeBox = false;
            this.Name = "FrmLineInfoConfig";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "设定线体";
            this.Load += new System.EventHandler(this.FrmLineInfoConfig_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.cms.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.Timer timerRestoreTheLblResult;
        private System.Windows.Forms.ContextMenuStrip cms;
        private System.Windows.Forms.ToolStripMenuItem delToolStripMenuItem;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Label lblLineName;
        private System.Windows.Forms.TextBox tbLineName;
        private System.Windows.Forms.Label lblResult;
    }
}