using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Products_Cost.Interface;
using Tools;
using Oracle.DataAccess.Client;
namespace Products_Cost.ImplClass
{
    public class ShowProductsCostDetailImpl : IShowProductsCostDetail
    {
        private OracleHelper oH = OracleHelper.getBaseDao();

   
        public DataTable getProductsDetail(string name)
        {
            DataTable dt = null;
            string procName = "Show_Products_Cost.getProductsCostDetail";
            OracleParameter paramCursor = new OracleParameter("v_Cur", OracleDbType.RefCursor, 20);
            OracleParameter paramPN = new OracleParameter("v_PN", OracleDbType.NVarchar2, 20);
            paramCursor.Direction = ParameterDirection.ReturnValue;
            paramPN.Direction = ParameterDirection.Input;
            paramPN.Value = name;
            OracleParameter[] parameters = new OracleParameter[2] { paramCursor, paramPN };
            dt = oH.getDT(procName, parameters);
            return dt;
        }
    }
}
