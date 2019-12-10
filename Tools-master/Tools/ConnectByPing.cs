using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.NetworkInformation;
namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class ConnectByPing
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ipAddr"></param>
        /// <returns></returns>
        public static bool pingTheAddress(string ipAddr) {
            Ping pingSender = new Ping();
            string data = "sendData: goodgoodgoodgoodgoodgood";
            byte[] buffer = Encoding.ASCII.GetBytes(data);
            int timeout = 120;
            PingReply reply = pingSender.Send(ipAddr, timeout, buffer);
            if (reply.Status == IPStatus.Success) {
                //结束该Ping
                CmdHelper.killTaskByImageName("PING.EXE");
                return true;
            }
            CmdHelper.killTaskByImageName("PING.EXE");
            return false;
        }
    }
}
