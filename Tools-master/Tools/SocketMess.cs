using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Tools
{
    /// <summary>
    /// 回传给客户端的消息。
    /// </summary>
    public class SocketMess
    {
        private string _mess = string.Empty;

        //此标示标示为失败信息。
        public static  string _STR_FAIL = "_F_";
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_mess"></param>
        /// <param name="_currentValue"></param>
        /// <param name="_totalValue"></param>
        public SocketMess(string _mess)
        {
            this._mess = _mess;
        }
        /// <summary>
        /// 
        /// </summary>
        public SocketMess() { }
        /// <summary>
        /// 
        /// </summary>
        public string Mess
        {
            get
            {
                return _mess;
            }

            set
            {
                _mess = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="mess"></param>
        /// <returns></returns>
        public static SocketMess getSocketMessWithFailFlag(string mess) {
            return new SocketMess(_STR_FAIL + mess);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="mess"></param>
        /// <returns></returns>
        public static SocketMess getSocketMessWithSuccessFlag(string mess)
        {
            string successStr = XmlFlexflow.ReadXmlNodeValue("Tcp_Client_Success");
            return new SocketMess(successStr + mess);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string toString()
        {
            return _mess;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        //判断是否为失败信息。
        public bool ifFailMess() {
            //判断前3位是否为失败信息。
            if (_STR_FAIL.Equals(this._mess.Substring(0,3))) {
                return true;
            }
            return true;
        }
        //判断是否为成功信息。
        /// <summary>
        /// 
        /// </summary>
        /// <param name="strResult"></param>
        /// <returns></returns>
        public bool ifSuccess()
        {
            string successStr = XmlFlexflow.ReadXmlNodeValue("Tcp_Client_Success");
            if (successStr.Equals(this._mess))
            {
                return true;
            }
            return false;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="mess"></param>
        /// <returns></returns>
        public static bool ifSuccess(string mess) {
            string successStr = XmlFlexflow.ReadXmlNodeValue("Tcp_Client_Success");
            if (successStr.Equals(mess))
            {
                return true;
            }
            return false;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        //判断是否为失败信息。
        public static bool ifFailMess(string mess)
        {
            //判断前3位是否为失败信息。
            if (_STR_FAIL.Equals(mess.Substring(0, 3)))
            {
                return true;
            }
            return true;
        }
       
    }
}
