using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class ClientSocket
    {
        private Socket _theclientSocket;
        private byte[] MsgBuffer = new byte[4096];
        /// <summary>
        /// 
        /// </summary>
        public Socket TheclientSocket
        {
            get
            {
                return _theclientSocket;
            }

            set
            {
                _theclientSocket = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public ClientSocket() {
            this._theclientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ip"></param>
        /// <param name="port"></param>
        public void Connect(IPAddress ip, int port)
        {
            this._theclientSocket.BeginConnect(ip, port, new AsyncCallback(ConnectCallback), this._theclientSocket);
        }

        private void ConnectCallback(IAsyncResult ar)
        {
            try
            {
                Socket handler = (Socket)ar.AsyncState;
                handler.EndConnect(ar);
            }
            catch (SocketException ex)
            { }
        }
        /// <summary>
        /// 发送数据.
        /// </summary>
        /// <param name="data"></param>
        public void Send(string data)
        {
            Send(System.Text.Encoding.UTF8.GetBytes(data));
        }

        private void Send(byte[] byteData)
        {
            try
            {
                int length = byteData.Length;
                byte[] head = BitConverter.GetBytes(length);
                byte[] data = new byte[head.Length + byteData.Length];
                Array.Copy(head, data, head.Length);
                Array.Copy(byteData, 0, data, head.Length, byteData.Length);
                this._theclientSocket.BeginSend(data, 0, data.Length, 0, new AsyncCallback(SendCallback), this._theclientSocket);
            }
            catch (SocketException ex)
            { }
        }

        private void SendCallback(IAsyncResult ar)
        {
            try
            {
                Socket handler = (Socket)ar.AsyncState;
                handler.EndSend(ar);
            }
            catch (SocketException ex)
            { }
        }
        /// <summary>
        /// 
        /// </summary>
        public void ReceiveData()
        {
            _theclientSocket.BeginReceive(MsgBuffer, 0, MsgBuffer.Length, 0, new AsyncCallback(ReceiveCallback), null);
        }

        private void ReceiveCallback(IAsyncResult ar)
        {
            try
            {
                int REnd = _theclientSocket.EndReceive(ar);
                if (REnd > 0)
                {
                    byte[] data = new byte[REnd];
                    Array.Copy(MsgBuffer, 0, data, 0, REnd);

                    //在此次可以对data进行按需处理

                    _theclientSocket.BeginReceive(MsgBuffer, 0, MsgBuffer.Length, 0, new AsyncCallback(ReceiveCallback), null);
                }
                else
                {
                    dispose();
                }
            }
            catch (SocketException ex)
            { }
        }

        private void dispose()
        {
            try
            {
                this._theclientSocket.Shutdown(SocketShutdown.Both);
                this._theclientSocket.Close();
            }
            catch (Exception ex)
            { }
        }

    }
}
