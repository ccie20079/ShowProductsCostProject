using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class ShowResult
    {
        private Label _lblResult;
        private Timer _timer;

        // this.timerClsResult.Interval = 5000;
        //  this.timerClsResult.Tick += new System.EventHandler(this.timerClsResult_Tick);
        #region 静态方法.
        /// <summary>
        /// 
        /// </summary>
        /// <param name="lbl"></param>
        /// <param name="mesStr"></param>
        /// <param name="flag"></param>
        public static void show(Label lbl,String mesStr,bool flag) {
            lbl.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            lbl.Text = mesStr;
            lbl.Visible = true;
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
        public static void show(Label lblPrompt,ProgressBar pb,Label lbl, String mesStr, bool flag)
        {
            lbl.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            lbl.Text = mesStr;
            lbl.Visible = true;
            lblPrompt.Visible = false;
            pb.Visible = false;
            //前景色
            if (flag)
            {
                lbl.ForeColor = System.Drawing.Color.White;
                lbl.BackColor = System.Drawing.Color.Green;
            }
            else
            {
                lbl.ForeColor = System.Drawing.Color.White;
                lbl.BackColor = System.Drawing.Color.Red;
            }
        }
        /// <summary>
        /// 提醒用户！
        /// </summary>
        /// <param name="lbl"></param>
        /// <param name="mesStr"></param>
        /// <param name="flag"></param>
        public static void prompt(Label lbl, String mesStr, bool flag)
        {
            lbl.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            lbl.Text = mesStr;
            lbl.Visible = true;
            //前景色
            if (flag)
            {
                lbl.ForeColor = System.Drawing.Color.Black;
                lbl.BackColor = System.Drawing.Color.Green;
            }
            else
            {
                lbl.ForeColor = System.Drawing.Color.Black;
                lbl.BackColor = System.Drawing.Color.Yellow;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="lbl"></param>
        /// <param name="mesStr"></param>
        /// <param name="flag"></param>
        public static void showByTimer(Label lbl, String mesStr, bool flag)
        {
            lbl.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            lbl.Text = mesStr;
            lbl.Visible = true;
            //前景色
            if (flag)
            {
                lbl.ForeColor = System.Drawing.Color.White;
                lbl.BackColor = System.Drawing.Color.Green;
            }
            else
            {
                lbl.ForeColor = System.Drawing.Color.White;
                lbl.BackColor = System.Drawing.Color.Red;
            }
        }
        #endregion
        #region 构造方法.
        /// <summary>
        /// 
        /// </summary>
        /// <param name="lblResult"></param>
        /// <param name="timer"></param>
        public ShowResult(Label lblResult,Timer timer) {
            this._timer = timer;
            this._lblResult = lblResult;
            lblResult.Visible = true;
            this._timer.Interval = 5000;
            this._timer.Tick += new System.EventHandler(this.timerClsResult_Tick);
        }
        #endregion
        private void timerClsResult_Tick(object sender, EventArgs e)
        {
            this._lblResult.Text = "";
            _lblResult.BackColor = this._lblResult.Parent.BackColor;
            this._timer.Enabled = false; //再次关闭该时钟。
        }
        /// <summary>
        /// 显示结果
        /// </summary>
        public void showResult(string msg,bool flag) {
            this._lblResult.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            _lblResult.Text = msg;
            //前景色
            if (flag)
            {
                _lblResult.ForeColor = System.Drawing.Color.White;
                _lblResult.BackColor = System.Drawing.Color.Green;
            }
            else
            {
                _lblResult.ForeColor = System.Drawing.Color.White;
                _lblResult.BackColor = System.Drawing.Color.Red;
            }
            //开启定时器.
            this._timer.Enabled = true; 
        }
    }
}
