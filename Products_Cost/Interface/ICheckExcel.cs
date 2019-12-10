using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Products_Cost.Interface
{
    public interface ICheckExcel
    {
        bool check_P_C_Template(string xlsPath,out string msg); 
    }
}
