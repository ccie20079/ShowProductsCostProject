namespace Products_Cost
{
    partial class FrmTeamInfoConfig
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
            this.tbMonitor = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.tbTeam_name = new System.Windows.Forms.TextBox();
            this.lblLineName = new System.Windows.Forms.Label();
            this.btnAdd = new System.Windows.Forms.Button();
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
            this.dgv.Location = new System.Drawing.Point(43, 174);
            this.dgv.MultiSelect = false;
            this.dgv.Name = "dgv";
            this.dgv.ReadOnly = true;
            this.dgv.RowTemplate.Height = 23;
            this.dgv.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgv.Size = new System.Drawing.Size(987, 371);
            this.dgv.TabIndex = 17;
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
            // tbMonitor
            // 
            this.tbMonitor.Location = new System.Drawing.Point(457, 116);
            this.tbMonitor.Name = "tbMonitor";
            this.tbMonitor.Size = new System.Drawing.Size(114, 29);
            this.tbMonitor.TabIndex = 23;
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(391, 119);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(76, 27);
            this.label1.TabIndex = 22;
            this.label1.Text = "班长：";
            // 
            // tbTeam_name
            // 
            this.tbTeam_name.Location = new System.Drawing.Point(154, 113);
            this.tbTeam_name.Name = "tbTeam_name";
            this.tbTeam_name.Size = new System.Drawing.Size(181, 29);
            this.tbTeam_name.TabIndex = 21;
            this.tbTeam_name.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.tbTeam_name_KeyPress);
            // 
            // lblLineName
            // 
            this.lblLineName.Location = new System.Drawing.Point(52, 116);
            this.lblLineName.Name = "lblLineName";
            this.lblLineName.Size = new System.Drawing.Size(86, 27);
            this.lblLineName.TabIndex = 20;
            this.lblLineName.Text = "班组名：";
            // 
            // btnAdd
            // 
            this.btnAdd.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAdd.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.btnAdd.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnAdd.Location = new System.Drawing.Point(872, 113);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(158, 40);
            this.btnAdd.TabIndex = 19;
            this.btnAdd.Text = "增加班组";
            this.btnAdd.UseVisualStyleBackColor = false;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // lblResult
            // 
            this.lblResult.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblResult.Location = new System.Drawing.Point(43, 568);
            this.lblResult.Name = "lblResult";
            this.lblResult.Size = new System.Drawing.Size(987, 40);
            this.lblResult.TabIndex = 18;
            // 
            // FrmTeamInfoConfig
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 19F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.SkyBlue;
            this.ClientSize = new System.Drawing.Size(1082, 627);
            this.Controls.Add(this.dgv);
            this.Controls.Add(this.tbMonitor);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.tbTeam_name);
            this.Controls.Add(this.lblLineName);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.lblResult);
            this.Font = new System.Drawing.Font("宋体", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.Margin = new System.Windows.Forms.Padding(5);
            this.Name = "FrmTeamInfoConfig";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "班组设置";
            this.Load += new System.EventHandler(this.FrmTeamInfoConfig_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.cms.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.ContextMenuStrip cms;
        private System.Windows.Forms.ToolStripMenuItem delToolStripMenuItem;
        private System.Windows.Forms.Timer timerRestoreTheLblResult;
        private System.Windows.Forms.TextBox tbMonitor;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tbTeam_name;
        private System.Windows.Forms.Label lblLineName;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Label lblResult;
    }
}