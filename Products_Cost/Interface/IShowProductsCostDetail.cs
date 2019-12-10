using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
namespace Products_Cost.Interface
{
    public interface IShowProductsCostDetail
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        DataTable getProductsDetail(string name);

    }
}
