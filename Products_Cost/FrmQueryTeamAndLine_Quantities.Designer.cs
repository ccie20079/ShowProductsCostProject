﻿namespace Products_Cost
{
    partial class FrmQueryTeamAndLine_Quantities
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
            this.lbl_Team_Name = new System.Windows.Forms.Label();
            this.cb_Team_name = new System.Windows.Forms.ComboBox();
            this.mCalendar = new System.Windows.Forms.MonthCalendar();
            this.dgv = new System.Windows.Forms.DataGridView();
            this.cms = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.ExportToExcelToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.delToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.lblPN = new System.Windows.Forms.Label();
            this.cb_PN = new System.Windows.Forms.ComboBox();
            this.btnQuery = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            this.cms.SuspendLayout();
            this.SuspendLayout();
            // 
            // lbl_Team_Name
            // 
            this.lbl_Team_Name.AutoSize = true;
            this.lbl_Team_Name.Font = new System.Drawing.Font("宋体", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lbl_Team_Name.Location = new System.Drawing.Point(309, 229);
            this.lbl_Team_Name.Name = "lbl_Team_Name";
            this.lbl_Team_Name.Size = new System.Drawing.Size(76, 19);
            this.lbl_Team_Name.TabIndex = 16;
            this.lbl_Team_Name.Text = "组编号:";
            // 
            // cb_Team_name
            // 
            this.cb_Team_name.Font = new System.Drawing.Font("宋体", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.cb_Team_name.FormattingEnabled = true;
            this.cb_Team_name.Location = new System.Drawing.Point(391, 223);
            this.cb_Team_name.Name = "cb_Team_name";
            this.cb_Team_name.Size = new System.Drawing.Size(136, 27);
            this.cb_Team_name.TabIndex = 15;
            this.cb_Team_name.SelectedIndexChanged += new System.EventHandler(this.cb_Team_name_SelectedIndexChanged);
            // 
            // mCalendar
            // 
            this.mCalendar.Location = new System.Drawing.Point(38, 70);
            this.mCalendar.Name = "mCalendar";
            this.mCalendar.TabIndex = 14;
            this.mCalendar.DateChanged += new System.Windows.Forms.DateRangeEventHandler(this.mCalendar_DateChanged);
            // 
            // dgv
            // 
            this.dgv.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.ContextMenuStrip = this.cms;
            this.dgv.Location = new System.Drawing.Point(38, 286);
            this.dgv.Name = "dgv";
            this.dgv.RowTemplate.Height = 23;
            this.dgv.Size = new System.Drawing.Size(1339, 323);
            this.dgv.TabIndex = 17;
            // 
            // cms
            // 
            this.cms.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.ExportToExcelToolStripMenuItem,
            this.delToolStripMenuItem});
            this.cms.Name = "cms";
            this.cms.Size = new System.Drawing.Size(225, 70);
            // 
            // ExportToExcelToolStripMenuItem
            // 
            this.ExportToExcelToolStripMenuItem.Name = "ExportToExcelToolStripMenuItem";
            this.ExportToExcelToolStripMenuItem.Size = new System.Drawing.Size(224, 22);
            this.ExportToExcelToolStripMenuItem.Text = "导出";
            this.ExportToExcelToolStripMenuItem.Click += new System.EventHandler(this.ExportToExcelToolStripMenuItem_Click);
            // 
            // delToolStripMenuItem
            // 
            this.delToolStripMenuItem.Name = "delToolStripMenuItem";
            this.delToolStripMenuItem.Size = new System.Drawing.Size(224, 22);
            this.delToolStripMenuItem.Text = "按日期、班组、产品名 删除";
            this.delToolStripMenuItem.Click += new System.EventHandler(this.delToolStripMenuItem_Click);
            // 
            // lblPN
            // 
            this.lblPN.AutoSize = true;
            this.lblPN.Font = new System.Drawing.Font("宋体", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblPN.Location = new System.Drawing.Point(573, 231);
            this.lblPN.Name = "lblPN";
            this.lblPN.Size = new System.Drawing.Size(85, 19);
            this.lblPN.TabIndex = 18;
            this.lblPN.Text = "产品名：";
            // 
            // cb_PN
            // 
            this.cb_PN.Font = new System.Drawing.Font("宋体", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.cb_PN.FormattingEnabled = true;
            this.cb_PN.Location = new System.Drawing.Point(655, 226);
            this.cb_PN.Name = "cb_PN";
            this.cb_PN.Size = new System.Drawing.Size(178, 27);
            this.cb_PN.TabIndex = 19;
            this.cb_PN.SelectedIndexChanged += new System.EventHandler(this.cb_PN_SelectedIndexChanged);
            // 
            // btnQuery
            // 
            this.btnQuery.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnQuery.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.btnQuery.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnQuery.Location = new System.Drawing.Point(1220, 223);
            this.btnQuery.Name = "btnQuery";
            this.btnQuery.Size = new System.Drawing.Size(157, 38);
            this.btnQuery.TabIndex = 20;
            this.btnQuery.Text = "查询";
            this.btnQuery.UseVisualStyleBackColor = false;
            this.btnQuery.Click += new System.EventHandler(this.btnQuery_Click);
            // 
            // FrmQueryTeamAndLine_Quantities
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.SkyBlue;
            this.ClientSize = new System.Drawing.Size(1405, 621);
            this.Controls.Add(this.btnQuery);
            this.Controls.Add(this.cb_PN);
            this.Controls.Add(this.lblPN);
            this.Controls.Add(this.dgv);
            this.Controls.Add(this.lbl_Team_Name);
            this.Controls.Add(this.cb_Team_name);
            this.Controls.Add(this.mCalendar);
            this.Name = "FrmQueryTeamAndLine_Quantities";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "组产量查询";
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.cms.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbl_Team_Name;
        private System.Windows.Forms.ComboBox cb_Team_name;
        private System.Windows.Forms.MonthCalendar mCalendar;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.Label lblPN;
        private System.Windows.Forms.ComboBox cb_PN;
        private System.Windows.Forms.Button btnQuery;
        private System.Windows.Forms.ContextMenuStrip cms;
        private System.Windows.Forms.ToolStripMenuItem delToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ExportToExcelToolStripMenuItem;
    }
}