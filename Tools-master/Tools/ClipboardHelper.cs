using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Drawing.Imaging;
using System.Windows;
using System.Runtime.InteropServices;
using System.Drawing;

namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class ClipboardHelper
    {
        /*
        tempWorkSheet.Range[tempWorkSheet.Cells[1, 1], tempWorkSheet.Cells[3, 3]].CopyPicture(Excel.XlPictureAppearance.xlScreen, Excel.XlCopyPictureFormat.xlPicture);

                // returns true
                var test = Clipboard.GetDataObject().GetDataPresent(DataFormats.EnhancedMetafile);

                // returns true
                var test2 = Clipboard.ContainsData(DataFormats.EnhancedMetafile);

                // returns null
                var test3 = Clipboard.GetData(DataFormats.EnhancedMetafile);

                // returns null
                var test4 = Clipboard.GetDataObject().GetData(DataFormats.EnhancedMetafile);
            
            */
            /*
        /// <summary>
        /// 
        /// </summary>
        /// <param name="filePath"></param>
        public static void SaveAsPicture(string filePath) {
          using(FileStream fileStream = new FileStream(filePath, FileMode.Create))
            {
                if (Clipboard.ContainsData(System.Windows.Forms.DataFormats.EnhancedMetafile)) {
                    Metafile metafile = (Metafile)Clipboard.GetData(System.Windows.Forms.DataFormats.EnhancedMetafile);
                    metafile.Save(filePath);
                }
                /*
                此段中的BitmapSource需要.Net 4.8 
                else if(Clipboard.ContainsData(System.Windows.Forms.DataFormats.Bitmap)) {
                    BitmapSource bitmapSource = (BitmapSource)Clipboard.GetData(System.Windows.Forms.DataFormats.Bitmap);
                    JpegBitmapEncoder encoder = new JpegBitmapEncoder();
                    encoder.Frames.Add(BitmapFrame.Create(bitmapSource));
                    encoder.QualityLevel = 100;
                    encoder.Save(fileStream);
                }
            }
        }
        */  
        [DllImport("user32.dll", SetLastError = true)]
        static extern bool OpenClipboard(IntPtr hWndNewOwner);

        [DllImport("user32.dll")]
        static extern IntPtr GetClipboardData(uint uFormat);

        [DllImport("user32.dll", SetLastError = true)]
        static extern bool CloseClipboard();

        [DllImport("user32.dll")]
        static extern bool EmptyClipboard();

        [DllImport("gdi32.dll")]
        static extern IntPtr CopyEnhMetaFile(IntPtr hemfSrc, string lpszFile);

        [DllImport("gdi32.dll")]
        static extern bool DeleteEnhMetaFile(IntPtr hemf);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static Image GetMetaImageFromClipboard(string filePath)
        {
            OpenClipboard(IntPtr.Zero);
            IntPtr pointer = GetClipboardData(14);
            //string fileName = @"C:\Test\" + Guid.NewGuid().ToString() + ".emf";

            IntPtr handle = CopyEnhMetaFile(pointer, filePath);
            Bitmap imgSrc = null;
            System.Drawing.Image bmp = System.Drawing.Image.FromFile(filePath);
            //imgSrc = new Bitmap(metafile.Width, metafile.Height);
            imgSrc = new Bitmap(new System.IO.MemoryStream(File.ReadAllBytes(filePath)));
            Graphics gs = Graphics.FromImage(imgSrc);
            gs.DrawImage(bmp, 0, 0);
            bmp.Dispose();

            EmptyClipboard();
            CloseClipboard();
            DeleteEnhMetaFile(handle);

            //File.Delete(filePath);
            return imgSrc;
        }
    }
}
