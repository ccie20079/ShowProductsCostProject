using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
namespace Products_Cost.Interface
{
    public interface IShowProductsCostSummary
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        DataTable getAllProductsCostSummary();

        DataTable get_P_C_Summary_To_Export(string v_PN);

        DataTable get_P_C_Each_Port(string v_PN);
    }
}
