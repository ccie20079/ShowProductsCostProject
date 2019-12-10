using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Tools;
namespace UpdateProgram
{
    public partial class FrmUpdateProgram : Form
    {
        BackgroundWorker bgWorker = new BackgroundWorker();
        TheFTPHelper theFtpHelper = null;
        string programName = string.Empty;
        string versionOfProgram = string.Empty;
        string[] args;
        public FrmUpdateProgram(string[] args)
        {
            InitializeComponent();
            this.args = args;
        }

        private void RunWorkerCompleted_Handler(object sender, RunWorkerCompletedEventArgs e)
        {
            this.Hide();
            MessageBox.Show(string.Format(@"已更新至{1},请重新启动: {0}！", programName, versionOfProgram), "提示：", MessageBoxButtons.OK, MessageBoxIcon.Information);
            this.Close();
        }

        private void ProgressChanged_Handler(object sender, ProgressChangedEventArgs e)
        {
            pb.Value = e.ProgressPercentage;
            lblFileName.Text =e.UserState.ToString();
        }

        private void DoWork_Handler(object sender, DoWorkEventArgs e)
        {
            theFtpHelper.DownloadFtpDirWithBackgroudWorker(string.Format(@"{0}/{1}/{2}", theFtpHelper.getFtpHost(), programName, versionOfProgram), DirectoryHelper.getParentDir(), bgWorker);
        }
     

        private void timerStartUpdate_Tick(object sender, EventArgs e)
        {
            timerStartUpdate.Stop();
            theFtpHelper = new TheFTPHelper(Program.ftpIPADDR, "Anonymous", "");
            programName = args[0];
            versionOfProgram = args[1];
            string FtpIddr = Program.ftpIPADDR;
            string saveFileUrl = Application.StartupPath;
            //获取对应目录下的文件个数。
            //int count = theFtpHelper.getFileCountsInFtpDir();
            pb.Visible = true;
            pb.Value = 0;
            pb.Maximum = theFtpHelper.getFileCountsInFtpDir(string.Format(@"{0}/{1}/{2}", theFtpHelper.getFtpHost(), programName, versionOfProgram));
            bgWorker.DoWork += DoWork_Handler;
            bgWorker.WorkerReportsProgress = true;
            bgWorker.ProgressChanged += ProgressChanged_Handler;
            bgWorker.RunWorkerCompleted += RunWorkerCompleted_Handler;
            bgWorker.RunWorkerAsync();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FrmUpdateProgram_Activated(object sender, EventArgs e)
        {
            timerStartUpdate.Start();
        }
    }
}
