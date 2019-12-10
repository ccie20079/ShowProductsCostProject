using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Windows.Forms;
namespace tools
{
    public class XmlFlexflow
    {
        private XmlDocument xd = new XmlDocument();
        public string ReadXmlNodeValue(string NodeName)
        {
            String NodeVale = "";
            String paths = Environment.CurrentDirectory + "\\flexflow.cfg";
            try {
                xd.Load(paths);
            }
            catch(Exception ex){
                MessageBox.Show(ex.ToString(), "Ã· æ£∫", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return NodeVale;             
            }
            XmlNodeList xnl = xd.SelectSingleNode("flexflow_client.exe").ChildNodes;
            foreach (XmlNode xn in xnl)
            {
                XmlElement xe = (XmlElement)xn;
                XmlNodeList xnlsubs = xe.ChildNodes;
                foreach (XmlNode xnsb in xnlsubs)
                {
                    XmlElement exsub = (XmlElement)xnsb;
                    if (exsub.InnerText == NodeName)
                    {
                        NodeVale = exsub.NextSibling.InnerText.ToString();
                    }
                }
            }
            return NodeVale;
        }
    }
}
