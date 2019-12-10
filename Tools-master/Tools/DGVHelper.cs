using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Drawing;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class DGVHelper
    {
        //private DataGridView dgv;
        //public DGVHelper(DataGridView dgv) {
        //    this.dgv = dgv;
        //}
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dgv"></param>
        public  static void AutoSizeForDGV(DataGridView dgv) {
            //设置行的高度
            dgv.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            dgv.ColumnHeadersHeight = 40;
            dgv.RowTemplate.Height = 30;
            DataGridViewCellStyle dataGridViewCellStyle = new DataGridViewCellStyle();
            
            dataGridViewCellStyle.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dataGridViewCellStyle.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            dgv.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle;
            dgv.ColumnHeadersHeight = 53;
            //dgv.ColumnHeadersDefaultCellStyle.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dgv.DefaultCellStyle.Font = new System.Drawing.Font("宋体", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dgv.AllowUserToAddRows = false;
            dgv.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            dgv.AlternatingRowsDefaultCellStyle.BackColor = Color.LightGray;     //RGB: 211,211,211
            dgv.RowPostPaint += new DataGridViewRowPostPaintEventHandler(myDgv_RowPostPaint_Event);
            AutoSizeColumn(dgv);
            dgv.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgv.CellMouseMove += new DataGridViewCellMouseEventHandler(dgv_CellMouseMove);
            dgv.CellMouseLeave += new DataGridViewCellEventHandler(dgv_CellMouseLeave);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public static  void myDgv_RowPostPaint_Event(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            Rectangle rectangle = new Rectangle(e.RowBounds.Location.X, e.RowBounds.Location.Y, dgv.RowHeadersWidth - 4, e.RowBounds.Height);
            TextRenderer.DrawText(e.Graphics, (e.RowIndex + 1).ToString(), dgv.RowHeadersDefaultCellStyle.Font, rectangle, dgv.RowHeadersDefaultCellStyle.ForeColor, TextFormatFlags.VerticalCenter | TextFormatFlags.Right);
        }

        private static void dgv_CellMouseMove(object sender, DataGridViewCellMouseEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            if (e.RowIndex > -1)
            {
                dgv.Rows[e.RowIndex].DefaultCellStyle.BackColor = Color.PowderBlue;
            }
        }

        private static void dgv_CellMouseLeave(object sender, DataGridViewCellEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            if (e.RowIndex > -1)
            {
                if (e.RowIndex % 2 == 0)
                {
                    dgv.Rows[e.RowIndex].DefaultCellStyle.BackColor = Color.White;
                }
                else
                    dgv.Rows[e.RowIndex].DefaultCellStyle.BackColor = Color.AliceBlue;
            }
        }
        /// <summary>
        /// 使DataGridView的列自适应宽度
        /// </summary>
        /// <param name="dgViewFiles"></param>
        private static void AutoSizeColumn(DataGridView dgViewFiles)
        {
            if (dgViewFiles.Columns.Count==0) {
                return;
            }
            //先解冻
            if (dgViewFiles.Columns.Count>2) {
                dgViewFiles.Columns[0].Frozen = false;
                dgViewFiles.Columns[1].Frozen = false;
            }
            int width = 0;
            //使列自使用宽度
            //对于DataGridView的每一个列都调整
            for (int i = 0; i < dgViewFiles.Columns.Count; i++)
            {
                //将每一列都调整为自动适应模式
                dgViewFiles.AutoResizeColumn(i, DataGridViewAutoSizeColumnMode.AllCells);
                //记录整个DataGridView的宽度
                width += dgViewFiles.Columns[i].Width;
            }
            //判断调整后的宽度与原来设定的宽度的关系，如果是调整后的宽度大于原来设定的宽度，
            //则将DataGridView的列自动调整模式设置为显示的列即可，
            //如果是小于原来设定的宽度，将模式改为填充。
            if (width > dgViewFiles.Size.Width)
            {
                dgViewFiles.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells;
            }
            else
            {
                dgViewFiles.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            }
            dgViewFiles.AutoGenerateColumns = false;
            if (dgViewFiles.Columns.Count >= 2) {
                //冻结某列 从左开始 0，1，2
                dgViewFiles.Columns[1].Frozen = true;
            }
        }
        /// <summary>
        /// 解冻DataGridView
        /// </summary>
        /// <param name="dgViewFiles"></param>
        public  static void unFreezeTheFirstTwoColumns(DataGridView dgViewFiles) {
            //先解冻
            if (dgViewFiles.Columns.Count > 2)
            {
                dgViewFiles.Columns[0].Frozen = false;
                dgViewFiles.Columns[1].Frozen = false;
            }
        }
        /// <summary>
        /// 选择所有行
        /// </summary>
        public static void SelectAllRows(DataGridView dgViewFiles,string columnName) {
            for (int i=0;i<= dgViewFiles.Rows.Count-1;i++) {
                DataGridViewCheckBoxCell checkCell = (DataGridViewCheckBoxCell)dgViewFiles.Rows[i].Cells[columnName];
                checkCell.Value = true;
            }
        }
    }
}
