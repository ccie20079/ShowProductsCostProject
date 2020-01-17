using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using System.IO;

namespace Tools
{
    public class PictureHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="streamByte"></param>
        /// <returns></returns>
        public static Image ReturnPhoto(byte[] streamByte) {
            System.IO.MemoryStream ms = new System.IO.MemoryStream(streamByte);
            Image img = Image.FromStream(ms);
            return img;
        }
        public void writePhoto(byte[] streamByte) {
            /*
            Response.ContentType = "image/GIF";
            Response.BinaryWrite(streamByte);
            */
        }
        public byte[] GetPictureData(string imagePath) {
            FileStream fs = new FileStream(imagePath, FileMode.Open);
            byte[] byteData = new byte[fs.Length];
            fs.Read(byteData, 0, byteData.Length);
            fs.Close();
            return byteData;
        }
        public byte[] photoImageInsert(Image imgPhoto) {
            MemoryStream mstream = new MemoryStream();
            imgPhoto.Save(mstream, System.Drawing.Imaging.ImageFormat.Bmp);
            byte[] byData = new Byte[mstream.Length];
            mstream.Position = 0;
            mstream.Read(byData, 0, byData.Length);
            mstream.Close();
            return byData;
        }

    }
}
