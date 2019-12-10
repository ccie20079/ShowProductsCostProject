using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.DataAccess;
using System.Data;
using Oracle.DataAccess.Client;
using System.IO;
using Tools;
using System.Windows.Forms;
using System.Drawing;

namespace Products_Cost.Helper
{
    public class Test
    {
        /*
        private void test() {
           /*
            //  strid 主键字段名  strzp 照片字段名  strtb 数据库表名  strpath  存放照片的本地路径
            byte[] img = new byte[0];
            OracleCommand cmd = new OracleCommand();
            OracleDataReader rs;
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select " + strid + ", " + strzp + " from " + strtb;
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                img = (byte[])rs[1];
                System.IO.File.WriteAllBytes(strpath + "\\" + rs[0].ToString() + ".jpg", img);
            }
            rs.Close();
        }   
    */
        //参数说明：数据库表名，主键字段名，照片字段名，写入主键值，本地照片文件名，含完整路径
        public  static Boolean insertpic(string id, string filename)
        {
            /*
             if (filePhoto.HasFile)
            {
                byte[] fileBytePicture = new byte[filePhoto.PostedFile.ContentLength];//用图片的长度来初始化一个字节数组存储临时的图片文件
                System.IO.Stream fileStream = filePhoto.PostedFile.InputStream;//建立文件流对象
                fileStream.Read(fileBytePicture, 0, filePhoto.PostedFile.ContentLength);
                photo = ByteToString(fileBytePicture);
            }
            */

            // FileStream fs = System.IO.File.OpenRead(filename);
            FileStream fs = new FileStream(filename, FileMode.Open, FileAccess.Read);
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
            cmd.CommandText = "insert into picture_test(id,picture) values('1',:zp)";
            cmd.Parameters.Add("zp", OracleDbType.Blob, imagebyte.Length);
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
                MessageBox.Show("插入成功!");
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
            finally {
                cmd.Dispose();
                conn.Close();
                conn.Dispose();
            }
            return true;
        }
       
        public static void read(PictureBox pictureBox) {
            //  strid 主键字段名  strzp 照片字段名  strtb 数据库表名  strpath  存放照片的本地路径
            byte[] img = new byte[0];
            string sqlStr = string.Format(@"SELECT id,picture FROM Picture_Test where id = 1");
            OracleConnection conn = new OracleConnection(OracleDaoHelper.conn_str);
            OracleDataReader rs = OracleDaoHelper.getDR(sqlStr,out conn);
            while (rs.Read()) {
                string idStr = rs["id"].ToString();
                /*
                string idStr = rs["id"].ToString();
                //img = (byte[])(rs["zp"]);
                img = System.Text.Encoding.GetEncoding(-0).GetBytes(rs["zp"].ToString());
                System.IO.File.WriteAllBytes("C:\\" + idStr + ".jpg", img);
                */
                if (rs["picture"] != DBNull.Value)
                { //照片字段里有值才能进到方法体显示图片,否则清空pb{
                    MemoryStream ms = new MemoryStream((byte[])rs["picture"]);
                    Image imageBlob = Image.FromStream(ms, true);    //用流创建Image
                    pictureBox.Image = imageBlob;
                    pictureBox.Image.Save("E:\\1.jpg", pictureBox.Image.RawFormat);
                }
                else {//照片字段里没值,清空pb
                    pictureBox.Image = null;
                }
            }
            rs.Close();
            rs.Dispose();
            conn.Close();
            conn.Dispose();
        }
    }
}
