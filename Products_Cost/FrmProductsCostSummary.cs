﻿using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using Tools;
using System.IO;
using Oracle.DataAccess.Client;
using Products_Cost.Interface;
using Products_Cost.ImplClass;
using Excel;

namespace Products_Cost
{
    public partial class FrmProductsCostSummary : Form
    {
        string defaultDir = Application.StartupPath + "\\ProductCost\\";
        IShowProductsCostSummary showProductsCostSummary = null;

        string destFilePath = string.Empty;
        public FrmProductsCostSummary()
        {
            InitializeComponent();
        }
      

         private void FrmProductsCostSummary_Load(object sender, EventArgs e)
        {
            showProductsCostSummary = new ShowProductsCostSummaryImpl();
            this.dgv.Click -= new System.EventHandler(this.dgv_Click);
            this.dgv.DataSource=showProductsCostSummary.getAllProductsCostSummary();
            dgv.RowPostPaint += new DataGridViewRowPostPaintEventHandler(DGVHelper.myDgv_RowPostPaint_Event);
            //DGVHelper.AutoSizeForDGV(dgv);
            //pictureBox.Focus();
            this.dgv.Click += new System.EventHandler(this.dgv_Click);
        }
        /// <summary>
        /// 删除某记录
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DelToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //获取当前行
            DataGridViewRow dr = dgv.CurrentRow;
            if (dr == null)
            {
                return;
            }
            string productName = dr.Cells["product_name"].Value.ToString();
            if (DialogResult.Cancel.Equals(MessageBox.Show("是否要删除指定的产品?", "提示：", MessageBoxButtons.OKCancel, MessageBoxIcon.Information))){
                return;
            }
            string sqlStr = string.Format(@"DELETE FROM Products_Cost WHERE Product_Name = '{0}'",productName);
            OracleDaoHelper.executeSQL(sqlStr);
            IShowProductsCostSummary showProductsCostSummary = new ShowProductsCostSummaryImpl();
            this.dgv.DataSource = showProductsCostSummary.getAllProductsCostSummary();
            //DGVHelper.AutoSizeForDGV(dgv);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void refreshToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.dgv.DataSource = showProductsCostSummary.getAllProductsCostSummary();
            //DGVHelper.AutoSizeForDGV(dgv);
        }
        /// <summary>
        /// 更新图片
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void updateToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //1.先获取产品名称。
            //获取当前行
            DataGridViewRow dr = dgv.CurrentRow;
            if (dr == null)
            {
                return;
            }
            string productName = dr.Cells["product_name"].Value.ToString();
            //保存照片存储的路径
            string thePathOfPictureOfProducts = string.Empty;
            FrmImportPictureOfProduct frmImportPictureOfProduct = new FrmImportPictureOfProduct();
            frmImportPictureOfProduct.ShowDialog();
            if (DialogResult.OK.Equals(frmImportPictureOfProduct.DialogResult)) {
                //返回 照片存储的路径
                thePathOfPictureOfProducts = frmImportPictureOfProduct.tbPath.Text.Trim();
                if (string.IsNullOrEmpty(thePathOfPictureOfProducts)) {
                    return;
                }
            }
            //
            //1.先判断有没有 products_picture中有没有 该名称对应的信息。
            string sqlStr = string.Format(@"SELECT 1 FROM Products_Picture WHERE Product_Name = '{0}'",productName);
            System.Data.DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            if (dt.Rows.Count == 0)
            {
                //调用插入图片方法
                addPictureOfProduct(productName, thePathOfPictureOfProducts);
            }
            else {
                //更新图片
                updatePictureOfProduct(productName, thePathOfPictureOfProducts);
                //更新完图片之后，重新刷新图片。
                //getPictureByProductName(productName, pictureBox);
                refreshToolStripMenuItem_Click(sender, e);
            }
        }
        /// <summary>
        /// 更新图片
        /// </summary>
        /// <param name="productName"></param>
        /// <param name="thePathOfPictureOfProducts"></param>
        public static void updatePictureOfProduct(string productName, string thePathOfPictureOfProducts)
        {
            FileStream fs = new FileStream(thePathOfPictureOfProducts, FileMode.Open, FileAccess.Read);
            byte[] imagebyte = new byte[fs.Length]; //把图片转成Byte型 erjin
            fs.Read(imagebyte, 0, (int)imagebyte.Length);       //把二进制流读入缓冲区
            fs.Close();
            OracleConnection conn = new OracleConnection(OracleDaoHelper.conn_str);
            try
            {
                conn.Open();
            }
            catch { }
            OracleCommand cmd = new OracleCommand(OracleDaoHelper.conn_str, conn);
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = string.Format(@"Update Products_Picture 
                                                SET Picture = :picture
                                                WHERE Product_Name = '{0}'
                                                                ",
                                                                productName);
            cmd.Parameters.Add("picture", OracleDbType.Blob, imagebyte.Length);
            cmd.Parameters[0].Value = imagebyte;

            //string zpStr = String_Byte_Helper.ByteToString(imagebyte);
            /*string strsql = string.Format(@"insert into picture_test(id,zp) values('{0}','{1}')",
                                        id,
                                        zpStr);
            OracleDaoHelper.executeSQL(strsql);                                                                                                                                                                                                                                                                                                                  
            return true;
            */
            try
            {
                cmd.ExecuteNonQuery();
                //MessageBox.Show("插入成功!");
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
                conn.Dispose();
            }
        }
        public static bool ifExistsRecordOfProducts_Picture(string product_name) {
            string sqlStr = string.Format(@"SELECT 1 FROM Products_Picture WHERE Product_Name = '{0}'", product_name);
            return OracleDaoHelper.getDTBySql(sqlStr).Rows.Count > 0 ? true : false;
        }
        /// <summary>
        /// 保存图片
        /// </summary>
        /// <param name="productName"></param>
        /// <param name="thePathOfPictureOfProducts"></param>
        public static void addPictureOfProduct(string productName, string thePathOfPictureOfProducts)
        {
            FileStream fs = new FileStream(thePathOfPictureOfProducts, FileMode.Open, FileAccess.Read);
            byte[] imagebyte = new byte[fs.Length]; //把图片转成Byte型 erjin
            fs.Read(imagebyte, 0, (int)imagebyte.Length);       //把二进制流读入缓冲区
            fs.Close();
            OracleConnection conn = new OracleConnection(OracleDaoHelper.conn_str);
            try
            {
                conn.Open();
            }
            catch { }
            OracleCommand cmd = new OracleCommand(OracleDaoHelper.conn_str, conn);
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = string.Format(@"insert into Products_Picture(    
                                                                             PRODUCT_NAME,
                                                                             PICTURE                                                                
                                                                ) 
                                                                values('{0}',:picture)",
                                                                productName);
            cmd.Parameters.Add("picture", OracleDbType.Blob, imagebyte.Length);
            cmd.Parameters[0].Value = imagebyte;

            //string zpStr = String_Byte_Helper.ByteToString(imagebyte);
            /*string strsql = string.Format(@"insert into picture_test(id,zp) values('{0}','{1}')",
                                        id,
                                        zpStr);
            OracleDaoHelper.executeSQL(strsql);                                                                                                                                                                                                                                                                                                                  
            return true;
            */
            try
            {
                cmd.ExecuteNonQuery();
                //MessageBox.Show("插入成功!");
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
                conn.Dispose();
            }
        }

        public static void getPictureByProductName(string productName,PictureBox pictureBox) {
            Image imageBlob = null;
            //  strid 主键字段名  strzp 照片字段名  strtb 数据库表名  strpath  存放照片的本地路径
            byte[] img = new byte[0];
            string sqlStr = string.Format(@"SELECT picture FROM Products_Picture where product_name = '{0}'",productName);
            OracleConnection conn = new OracleConnection(OracleDaoHelper.conn_str);
            OracleDataReader rs = OracleDaoHelper.getDR(sqlStr, out conn);
            if (!rs.HasRows) {
                pictureBox.Image = null;
                rs.Close();
                rs.Dispose();
                conn.Close();
                conn.Dispose();
                return;
            }
            while (rs.Read())
            {
                /*
                string idStr = rs["id"].ToString();
                //img = (byte[])(rs["zp"]);
                img = System.Text.Encoding.GetEncoding(-0).GetBytes(rs["zp"].ToString());
                System.IO.File.WriteAllBytes("C:\\" + idStr + ".jpg", img);
                */
                if (rs["picture"] != DBNull.Value)
                { //照片字段里有值才能进到方法体显示图片,否则清空pb{
                    MemoryStream ms = new MemoryStream((byte[])rs["picture"]);
                    imageBlob = Image.FromStream(ms, true);    //用流创建Image
                    pictureBox.Image = imageBlob;
                    try
                    {
                        pictureBox.Image.Save(string.Format(@"{0}\{1}.jpg",
                                                            Application.StartupPath + "\\pictures",
                                                            StringHelper.removeBlank(productName)
                                              ),
                                              pictureBox.Image.RawFormat); ;
                    }
                    catch (Exception ex) {
                        MessageBox.Show(ex.ToString());
                    }
                }
                else
                {//照片字段里没值,清空pb
                    pictureBox.Image = null;
                }
            }
            rs.Close();
            rs.Dispose();
            conn.Close();
            conn.Dispose();
        }
        /// <summary>
        /// 单击某行时，加载照片。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgv_Click(object sender, EventArgs e)
        {
            //1.先获取产品名称。
            //获取当前行
            DataGridViewRow dr = dgv.CurrentRow;
            if (dr == null)
            {
                return;
            }
            string productName = dr.Cells["product_name"].Value.ToString();
            //getPictureByProductName(productName, pictureBox);
        }
        private void dgv_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            //1.先获取产品名称。
            //获取当前行
            DataGridViewRow dr = dgv.CurrentRow;
            if (dr == null)
            {
                return;
            }
            string productName = dr.Cells["product_name"].Value.ToString();
            //getPictureByProductName(productName, pictureBox);
        }
        /// <summary>
        //  导出至Excel.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ExportToExceltoolStripMenuItem_Click(object sender, EventArgs e)
        {
            DataGridViewRowCollection drRows = this.dgv.Rows;
            if (drRows.Count == 0) return;

            
            //1. 先确定 image path
            if (CmdHelper.ifExistsTheProcessByName("excel")||CmdHelper.ifExistsTheProcessByName("et")) {
                Tools.FrmPrompt frmPrompt = new Tools.FrmPrompt("excel.exe|et.exe");
                frmPrompt.ShowDialog();
            }
               //2. 打开Excel
               //先获取时间字符串
            string currTimeStr = TimeHelper.getCurrentTimeStr();
            string xlsFileName= "成衣成本汇总_" + currTimeStr + ".xls";
            string srcFilePath = Application.StartupPath + "\\成本汇总\\ProductsCostSummaryTemplate.xls";
            string destDir = Application.StartupPath + "\\成本汇总\\";
            string destFileName = xlsFileName;
            CmdHelper.copyFileToDestDirWithNewFileName(srcFilePath, destDir, destFileName);
            //目的文件名为： 
            destFilePath = destDir + xlsFileName;
            MyExcel myExcel = new MyExcel(destFilePath);
            myExcel.open(true);
            Usual_Excel_Helper uEHelper = new Usual_Excel_Helper(myExcel.getFirstWorkSheetAfterOpen());
               
            for (int index = 0; index <= drRows.Count-1;index++ ) {
                DataGridViewRow currRow =drRows[index];
                
                string product_name = currRow.Cells["Product_Name"].Value.ToString();
                uEHelper.setSpecificCellValue("A" + (2 + index).ToString(), product_name);
                //(drRow.Cells["product_name"]
                uEHelper.setSpecificCellValue("B" + (2 + index).ToString(), currRow.Cells["total_man_hours"].Value.ToString());
                uEHelper.setSpecificCellValue("C" + (2 + index).ToString(), currRow.Cells["total_labour_cost"].Value.ToString());
                uEHelper.setSpecificCellValue("D" + (2 + index).ToString(), currRow.Cells["supplier"].Value.ToString());
                uEHelper.setSpecificCellValue("E" + (2 + index).ToString(), currRow.Cells["latest_update_time"].Value.ToString());
                //picture
                //保存此图片
                //Image image = ((Image)(currRow.Cells["picture"].Value));
                byte[] pictureByteArray =(byte[])currRow.Cells["picture"].Value;
                Image image = PictureHelper.ReturnPhoto(pictureByteArray);

                string picPath = string.Format(@"{0}\{1}.jpg", destDir, product_name);
                image.Save(picPath, image.RawFormat);
        
                Microsoft.Office.Interop.Excel.Range range = uEHelper.getRange("F" + (2 + index).ToString(), "F" + (2 + index).ToString());
                uEHelper.pastePicture(range, picPath);
            }
            myExcel.saveWithoutAutoFit();
            myExcel.close();

            ShowResult.show(lblResult, string.Format(@"导出完毕，存于：{0}",destFilePath), true);
            timerRestoreLabel.Start();

        }
        private void timerRestoreLabel_Tick(object sender, EventArgs e)
        {
            timerRestoreLabel.Stop();
            lblResult.BackColor = this.BackColor;
            lblResult.Text = "";

        }
        private void lblResult_Click(object sender, EventArgs e)
        {
            MyExcel myExcel = new MyExcel(destFilePath);
            myExcel.open(true);
        }
    }
}
