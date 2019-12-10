using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Globalization;
using System.Windows.Forms;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class FTPHelper
    {

        private string _ftpServerIP;
        private string _ftpUserID;
        private string _ftpPassword;
        private string _ftpRemotePath;
        private string _ftpURI;
        /// <summary>
        /// 
        /// </summary>
        public string FtpServerIP
        {
            get
            {
                return _ftpServerIP;
            }

            set
            {
                _ftpServerIP = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public string FtpUserID
        {
            get
            {
                return _ftpUserID;
            }

            set
            {
                _ftpUserID = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public string FtpPassword
        {
            get
            {
                return _ftpPassword;
            }

            set
            {
                _ftpPassword = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public string FtpURI
        {
            get
            {
                return _ftpURI;
            }

            set
            {
                _ftpURI = value;
            }
        }

  /// <summary>
  /// 
  /// </summary>
  /// <param name="ftpServerIP"></param>
  /// <param name="ftpRemotePath"></param>
  /// <param name="ftpUserID"></param>
  /// <param name="ftpPassword"></param>
        public FTPHelper(string ftpServerIP,string ftpRemotePath,string ftpUserID,string ftpPassword) {
                this._ftpServerIP = ftpServerIP;
                this._ftpRemotePath = ftpRemotePath;
                this._ftpUserID = ftpUserID;
                this._ftpPassword = ftpPassword;
                FtpURI = "ftp://" + ftpServerIP + "/" + ftpRemotePath + "/";
        }
        /// <summary>
        /// 
        /// </summary>
        public FTPHelper() {
            this._ftpServerIP = XmlFlexflow.ReadXmlNodeValue("FTP_IPADDR");
            this.FtpUserID = XmlFlexflow.ReadXmlNodeValue("FTP_USER");
            this._ftpPassword = XmlFlexflow.ReadXmlNodeValue("FTP_PASSWORD");
            this._ftpRemotePath = XmlFlexflow.ReadXmlNodeValue("FTP_REMOTE_DIR");
            this._ftpURI = "ftp://" + this._ftpServerIP + "/" + this._ftpRemotePath + "/";
        }
        /// <summary>
        /// 
        /// </summary>
        public FTPHelper(string remoteDir)
        {
            XmlFlexflow xff = new XmlFlexflow();
            this._ftpServerIP = XmlFlexflow.ReadXmlNodeValue("FTP_IPADDR");
            this.FtpUserID = XmlFlexflow.ReadXmlNodeValue("FTP_USER");
            this._ftpPassword = XmlFlexflow.ReadXmlNodeValue("FTP_PASSWORD");
            this._ftpRemotePath = remoteDir;
            this._ftpURI = "ftp://" + this._ftpServerIP + "/" + this._ftpRemotePath + "/";
        }
        #region 上传文件
        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="localFile">要上传到FTP服务器的本地文件</param>
        /// <param name="ftpURI">ftp://</param>
        public void UpLoadFile(string localFile, string ftpURI)
            {
                if (!File.Exists(localFile))
                {
                    Console.Write("文件：“" + localFile + "” 不存在！");
                    return;
                }
                FileInfo fileInf = new FileInfo(localFile);
                FtpWebRequest reqFTP;

                reqFTP = (FtpWebRequest)FtpWebRequest.Create(ftpURI);// 根据uri创建FtpWebRequest对象 
                reqFTP.Credentials = new NetworkCredential(FtpUserID, FtpPassword);// ftp用户名和密码
                reqFTP.KeepAlive = false;// 默认为true，连接不会被关闭 // 在一个命令之后被执行
                reqFTP.Method = WebRequestMethods.Ftp.UploadFile;// 指定执行什么命令
                reqFTP.UseBinary = true;// 指定数据传输类型
                reqFTP.ContentLength = fileInf.Length;// 上传文件时通知服务器文件的大小
                int buffLength = 2048;// 缓冲大小设置为2kb
                byte[] buff = new byte[buffLength];
                int contentLen;

                // 打开一个文件流 (System.IO.FileStream) 去读上传的文件
                FileStream fs = fileInf.OpenRead();
                try
                {
                    Stream strm = reqFTP.GetRequestStream();// 把上传的文件写入流
                    contentLen = fs.Read(buff, 0, buffLength);// 每次读文件流的2kb

                    while (contentLen != 0)// 流内容没有结束
                    {
                        // 把内容从file stream 写入 upload stream
                        strm.Write(buff, 0, contentLen);
                        contentLen = fs.Read(buff, 0, buffLength);
                    }
                    // 关闭两个流
                    strm.Close();
                    fs.Close();
                    Console.Write("文件【" + ftpURI + "】上传成功！<br/>");
                }
                catch (Exception ex)
                {
                    Console.Write("上传文件【" + ftpURI +  "】时，发生错误：" + ex.Message + "<br/>");
                }
            }
            #endregion
            #region 上传文件夹

            /// <summary>
            /// 上传整个目录
            /// </summary>
            /// <param name="localDir">要上传的目录的上一级目录</param>
            /// <param name="ftpPath">FTP路径</param>
            /// <param name="dirName">要上传的目录名</param>
            /// <param name="ftpUser">FTP用户名（匿名为空）</param>
            /// <param name="_ftpPassword">FTP登录密码（匿名为空）</param>
            public void UploadDirectory(string localDir, string ftpPath, string dirName)
            {
                string dir = localDir + dirName + @"\"; //获取当前目录（父目录在目录名）
                                                        //检测本地目录是否存在
                if (!Directory.Exists(dir))
                {
                    Console.Write("本地目录：“" + dir + "” 不存在！<br/>");
                    return;
                }
                //检测FTP的目录路径是否存在
                if (!CheckDirectoryExist(ftpPath, dirName))
                {
                    MakeDir(ftpPath, dirName);//不存在，则创建此文件夹
                }
                List<List<string>> infos = GetDirDetails(dir); //获取当前目录下的所有文件和文件夹

                //先上传文件
                //Response.Write(dir + "下的文件数：" + infos[0].Count.ToString() + "<br/>");
                for (int i = 0; i < infos[0].Count; i++)
                {
                    Console.WriteLine(infos[0][i]);
                    UpLoadFile(dir + infos[0][i], ftpPath + dirName + @"/" + infos[0][i]);
                }
                //再处理文件夹
                //Response.Write(dir + "下的目录数：" + infos[1].Count.ToString() + "<br/>");
                for (int i = 0; i < infos[1].Count; i++)
                {
                    UploadDirectory(dir, ftpPath + dirName + @"/", infos[1][i]);
                    //Response.Write("文件夹【" + dirName + "】上传成功！<br/>");
                }
            }

            /// <summary>
            /// 判断ftp服务器上该目录是否存在
            /// </summary>
            /// <param name="ftpPath">FTP路径目录</param>
            /// <param name="dirName">目录上的文件夹名称</param>
            /// <returns></returns>
            private bool CheckDirectoryExist(string ftpPath, string dirName)
            {
                bool flag = true;
                try
                {
                    //实例化FTP连接
                    FtpWebRequest ftp = (FtpWebRequest)FtpWebRequest.Create(ftpPath + dirName);
                    ftp.Credentials = new NetworkCredential(FtpUserID, FtpPassword);
                    ftp.Method = WebRequestMethods.Ftp.ListDirectory;
                    FtpWebResponse response = (FtpWebResponse)ftp.GetResponse();
                    response.Close();
                }
                catch (Exception)
                {
                    flag = false;
                }
                return flag;
            }
            /// <summary>
            /// 删除目录。
            /// </summary>
            /// <param name="ftpPath"></param>
            /// <param name="dirName"></param>
            public void RemoveDir(string ftpPath,string dirName) {
                FtpWebRequest reqFTP;
                try {
                    string ui = (ftpPath + dirName).Trim();
                    reqFTP = (FtpWebRequest)FtpWebRequest.Create(ui);
                    reqFTP.Method = WebRequestMethods.Ftp.RemoveDirectory;
                    reqFTP.UseBinary = true;
                    reqFTP.Credentials = new NetworkCredential(FtpUserID, FtpPassword);
                    FtpWebResponse response = (FtpWebResponse)reqFTP.GetResponse();
                    Stream ftpStream = response.GetResponseStream();
                    ftpStream.Close();
                    response.Close();
                    Console.Write("文件夹【" + dirName + "】创建成功！<br/>");
                }
                catch (Exception ex) {
                    MessageBox.Show(ex.ToString());
                }

            }
            /// <summary>
            /// 创建文件夹  
            /// </summary>  
            /// <param name="ftpPath">FTP路径</param>  
            /// <param name="dirName">创建文件夹名称</param>  
            public void MakeDir(string ftpPath, string dirName)
            {

                FtpWebRequest reqFTP;
                try
                {
                    string ui = (ftpPath + dirName).Trim();
                    reqFTP = (FtpWebRequest)FtpWebRequest.Create(ui);
                    reqFTP.Method = WebRequestMethods.Ftp.MakeDirectory;
                    reqFTP.UseBinary = true;
                    reqFTP.Credentials = new NetworkCredential(FtpUserID, FtpPassword);
                    FtpWebResponse response = (FtpWebResponse)reqFTP.GetResponse();
                    Stream ftpStream = response.GetResponseStream();
                    ftpStream.Close();
                    response.Close();
                    Console.Write("文件夹【" + dirName + "】创建成功！<br/>");
                }

                catch (Exception ex)
                {
                    Console.Write("新建文件夹【" + dirName + "】时，发生错误：" + ex.Message);
                }
            }

            /// <summary>
            /// 获取目录下的详细信息
            /// </summary>
            /// <param name="localDir">本机目录</param>
            /// <returns></returns>
            private List<List<string>> GetDirDetails(string localDir)
            {
                List<List<string>> infos = new List<List<string>>();
                try
                {
                    infos.Add(Directory.GetFiles(localDir).ToList()); //获取当前目录的文件

                    infos.Add(Directory.GetDirectories(localDir).ToList()); //获取当前目录的目录

                    for (int i = 0; i < infos[0].Count; i++)
                    {
                        int index = infos[0][i].LastIndexOf(@"\");
                        infos[0][i] = infos[0][i].Substring(index + 1);
                    }
                    for (int i = 0; i < infos[1].Count; i++)
                    {
                        int index = infos[1][i].LastIndexOf(@"\");
                        infos[1][i] = infos[1][i].Substring(index + 1);
                    }
                }
                catch (Exception ex)
                {
                    ex.ToString();
                }
                return infos;
            }

            #endregion

            protected void Button1_Click(object sender, EventArgs e)
            {
                //FTP地址
                string ftpPath = "ftp://192.168.1.1/";
                //本机要上传的目录的父目录
                string localPath = "E:\\发布\\";
                //要上传的目录名
                string fileName = "test1";

                FileInfo fi = new FileInfo(localPath);
                //判断上传文件是文件还是文件夹
                if ((fi.Attributes & FileAttributes.Directory) != 0)
                {
                    //dir 如果是文件夹，则调用[上传文件夹]方法
                    UploadDirectory(localPath, ftpPath, fileName);
                }
                else
                {
                    //file 如果是文件，则调用[上传文件]方法
                    UpLoadFile(localPath + fileName, ftpPath);
                }
            }

        /// <summary>  
        /// 删除文件  
        /// </summary>  
        public void Delete(string fileName)
        {
            try
            {
                FtpWebRequest reqFTP;
                reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri(FtpURI + fileName));
                reqFTP.Credentials = new NetworkCredential(_ftpUserID, _ftpPassword);
                reqFTP.Method = WebRequestMethods.Ftp.DeleteFile;
                reqFTP.KeepAlive = false;
                string result = String.Empty;
                FtpWebResponse response = (FtpWebResponse)reqFTP.GetResponse();
                long size = response.ContentLength;
                Stream datastream = response.GetResponseStream();
                StreamReader sr = new StreamReader(datastream);
                result = sr.ReadToEnd();
                sr.Close();
                datastream.Close();
                response.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        /// <summary>  
        /// 获取FTP文件列表(包括文件夹)
        /// </summary>   
        public string[] GetAllList(string url)
        {
            List<string> list = new List<string>();
            FtpWebRequest req = (FtpWebRequest)WebRequest.Create(new Uri(url));
            req.Credentials = new NetworkCredential(_ftpUserID, _ftpPassword);
            req.Method = WebRequestMethods.Ftp.ListDirectory;
            req.UseBinary = true;
            req.UsePassive = true;
            try
            {
                using (FtpWebResponse res = (FtpWebResponse)req.GetResponse())
                {
                    using (StreamReader sr = new StreamReader(res.GetResponseStream(),Encoding.UTF8))
                    {
                        string s;
                        while ((s = sr.ReadLine()) != null)
                        {
                            list.Add(s);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return list.ToArray();
        }
        /// <summary>  
        /// 获取FTP文件列表(包括文件夹)
        /// </summary>   
        public string[] GetAllList(string url,string encodingName)
        {
            List<string> list = new List<string>();
            FtpWebRequest req = (FtpWebRequest)WebRequest.Create(new Uri(url));
            req.Credentials = new NetworkCredential(_ftpUserID, _ftpPassword);
            req.Method = WebRequestMethods.Ftp.ListDirectory;
           req.UseBinary = true;
            req.UsePassive = true;
            try
            {
                using (FtpWebResponse res = (FtpWebResponse)req.GetResponse())
                {
                    using (StreamReader sr = new StreamReader(res.GetResponseStream(), Encoding.GetEncoding(encodingName)))
                    {
                        string s;
                        while ((s = sr.ReadLine()) != null)
                        {
                            list.Add(s);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return list.ToArray();
        }
        /// <summary>
        /// 删除所有文件。
        /// </summary>
        public void delAllFile(string encodingName) {
            string[] fileArray =this.GetAllList(this._ftpURI, encodingName);
            //先删除服务器上的所有文件。
            foreach (string fileName in fileArray)
            {
                this.Delete(fileName);
            }
        }
    }
}
