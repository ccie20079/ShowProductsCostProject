using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.Net;
using System.Threading;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class MyTCPListener
    {
        private TcpListener _server = null;
        private NetworkStream _stream = null;
        /// <summary>
        /// 
        /// </summary>
        public TcpListener Server
        {
            get
            {
                return _server;
            }

            set
            {
                _server = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public NetworkStream Stream
        {
            get
            {
                return _stream;
            }

            set
            {
                _stream = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public MyTCPListener(string ipAddr,Int32 port) {
            IPAddress localAddr = IPAddress.Parse(ipAddr);
            _server = new TcpListener(localAddr, port);
        }
        /// <summary>
        /// 
        /// </summary>
        public MyTCPListener() {
            string _serverIP = XmlFlexflow.ReadXmlNodeValue("Tcp_Listener_IP");
            Int32 _port = Int32.Parse(XmlFlexflow.ReadXmlNodeValue("Tcp_Listener_Port"));
            IPAddress localAddr = IPAddress.Parse(_serverIP);
            _server = new TcpListener(localAddr, _port);
            this.start();
        }
      
        /// <summary>
        /// 获取Listener
        /// </summary>
        /// <returns></returns>
        public static  TcpListener getTcpListener(string ipAddr, Int32 port) {
            IPAddress localAddr = IPAddress.Parse(ipAddr);
            TcpListener _server = new TcpListener(localAddr, port);
            return _server;
        }

        /// <summary>
        /// 开启服务.
        /// </summary>
        public void start( ){

            try {
                _server.Start();
                //Buffer for reading data;
                Byte[] bytes = new Byte[256];
                string data = null;


                //Enter the listening loop;
                while (true)
                {
                    Console.Write("Waiting for a connection...");
                    // Perform a blocking call to accept requests.
                    // You could also user server.AcceptSocket() here.
                    TcpClient client = this._server.AcceptTcpClient();
                    Console.WriteLine("Connected!");

                    data = null;

                    // Get a stream object for reading and writing
                    NetworkStream stream = client.GetStream();

                    int i;

                    //loop to receive all the data send by the client
                    while ((i = stream.Read(bytes, 0, bytes.Length)) != 0)
                    {
                        // Translate data bytes to a ASCII string.
                        data = Encoding.GetEncoding(-0).GetString(bytes, 0, i);

                        Console.WriteLine("Received: {0}", data);

                        // Process the data sent by the client.
                        data = data.ToUpper();

                        byte[] msg = System.Text.Encoding.GetEncoding(-0).GetBytes("你好，客户端！");

                        // Send back a response.
                        stream.Write(msg, 0, msg.Length);
                        Console.WriteLine("Sent: {0}", data);
                    }
                    client.Close();
                }
            }
            catch (SocketException e)
            {
                Console.WriteLine("SocketException: {0}", e);
            }
            finally
            {
                // Stop listening for new clients.
                this._server.Stop();
            }
        }

    }
}
