using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
namespace tools
{
    public class ShowResult
    {
        public static void show(Label lbl,String mesStr,bool flag) {
            lbl.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            lbl.Text = mesStr;
            //前景色
            if (flag)
            {
                lbl.ForeColor = System.Drawing.Color.White;
                lbl.BackColor = System.Drawing.Color.Green;
            }
            else {
                lbl.ForeColor = System.Drawing.Color.White;
                lbl.BackColor = System.Drawing.Color.Red;            
            }
        }
    }
}
