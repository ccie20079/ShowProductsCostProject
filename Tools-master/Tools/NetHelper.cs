using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.NetworkInformation;
using System.Text.RegularExpressions;

namespace Tools
{/// <summary>
/// 
/// </summary>
    public class NetHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static  string getIPAddr() {
            System.Net.IPAddress addr;
            //获得本机局域网IP地址
            addr = new IPAddress(Dns.GetHostByName(Dns.GetHostName()).AddressList[0].Address);
            return addr.ToString();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static IList<string> GetMacsByNetworkInterface()
        {
            var macs = new List<string>();
            var interfaces = NetworkInterface.GetAllNetworkInterfaces();
            foreach (var @interface in interfaces)
            {
                var up = @interface.OperationalStatus == OperationalStatus.Up;
                var loopback = @interface.NetworkInterfaceType == NetworkInterfaceType.Loopback;
                if (up && !loopback)
                {
                    var address = @interface.GetPhysicalAddress().ToString();
                    // insert ":" then remove the last ":"
                    var result = Regex.Replace(address, ".{2}", "$0:");
                    var mac = result.Remove(result.Length - 1);
                    macs.Add(mac);
                }
            }
            return macs;
        }
    }
}
