using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.Windows.Forms;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class MyTcpClient
    {
        private TcpClient _client = null;
        NetworkStream _stream = null;
        private string _getResultStr = string.Empty;
        private string _getSuccessStr = string.Empty;
        string _serverIP = null;
        Int32 _port = 0;
        /// <summary>
        /// 
        /// </summary>
        public string GetResultStr
        {
            get
            {
                return _getResultStr;
            }

            set
            {
                _getResultStr = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public string GetSuccessStr
        {
            get
            {
                return _getSuccessStr;
            }

            set
            {
                _getSuccessStr = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="server"></param>
        /// <param name="port"></param>
        /// <returns></returns>
        public static TcpClient getTcpClient(string server,Int32 port) {
            TcpClient client = new TcpClient(server, port);
            return client;
        }
        /// <summary>
        /// 
        /// </summary>
        public MyTcpClient() {
            _serverIP = XmlFlexflow.ReadXmlNodeValue("Tcp_Listener_IP");
            _port = Int32.Parse(XmlFlexflow.ReadXmlNodeValue("Tcp_Listener_Port"));
            this._getResultStr = XmlFlexflow.ReadXmlNodeValue("Tcp_Client_Get_Result");
            this._getSuccessStr = XmlFlexflow.ReadXmlNodeValue("Tcp_Client_Success");
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="mess"></param>
        public void sendMessage(string mess) {
            Byte[] data = new Byte[256];
            try {
                _client = new TcpClient(_serverIP, _port);
                data = Encoding.GetEncoding(0).GetBytes(mess);
                _stream = this._client.GetStream();
                _stream.Write(data, 0, data.Length);
            }
            catch (ArgumentNullException e)
            {
                Console.WriteLine("ArgumentNullException: {0}", e);
            }
            catch (SocketException e)
            {
                Console.WriteLine("SocketException: {0}", e);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ReceiveData() {
            Byte[] msg = new Byte[256];
            string responseData = string.Empty;
            try {
                _stream.Read(msg, 0, msg.Length);
                responseData = Encoding.GetEncoding(0).GetString(msg);
            }
            catch (ArgumentNullException e)
            {
                Console.WriteLine("ArgumentNullException: {0}", e);
            }
            catch (SocketException e)
            {
                Console.WriteLine("SocketException: {0}", e);
            }
            //关闭stream。
            _stream.Close();
            _client.Close();
            return responseData;
        }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="server"></param>
       /// <param name="port"></param>
       /// <param name="message"></param>
        public static void Connect(String server,Int32 port, String message)
        {
            try
            {
                // Create a TcpClient.
                // Note, for this client to work you need to have a TcpServer 
                // connected to the same address as specified by the server, port
                // combination.
                TcpClient client = new TcpClient(server, port);

                // Translate the passed message into ASCII and store it as a Byte array.
                Byte[] data = System.Text.Encoding.GetEncoding(-0).GetBytes(message);

                // Get a client stream for reading and writing.
                //  Stream stream = client.GetStream();

                NetworkStream stream = client.GetStream();

                // Send the message to the connected TcpServer. 
                stream.Write(data, 0, data.Length);

                Console.WriteLine("Sent: {0}", message);
                // Receive the TcpServer.response.

                // Buffer to store the response bytes.
                data = new Byte[256];

                // String to store the response ASCII representation.
                String responseData = String.Empty;

                // Read the first batch of the TcpServer response bytes.
                Int32 bytes = stream.Read(data, 0, data.Length);
                responseData = System.Text.Encoding.GetEncoding(-0).GetString(data, 0, bytes);
                Console.WriteLine("Received: {0}", responseData);
                // Close everything.
                stream.Close();
                client.Close();
            }
            catch (ArgumentNullException e)
            {
                Console.WriteLine("ArgumentNullException: {0}", e);
            }
            catch (SocketException e)
            {
                Console.WriteLine("SocketException: {0}", e);
            }

            Console.WriteLine("\n Press Enter to continue...");
            Console.ReadLine();
        }
    }
}
