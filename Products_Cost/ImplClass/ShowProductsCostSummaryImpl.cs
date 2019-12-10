using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Products_Cost.Interface;
using Oracle.DataAccess.Client;
using Tools;
namespace Products_Cost.ImplClass
{
    public class ShowProductsCostSummaryImpl : IShowProductsCostSummary
    {
        private OracleHelper oH = OracleHelper.getBaseDao();
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public DataTable getAllProductsCostSummary()
        {
            DataTable dt = null;
            string procName = "Show_Products_Cost.getAllProductsCostSummary";
            OracleParameter paramCursor = new OracleParameter("v_Cur", OracleDbType.RefCursor, 20);
            paramCursor.Direction = ParameterDirection.ReturnValue;
            OracleParameter[] parameters = new OracleParameter[1] { paramCursor };
            dt = oH.getDT(procName, parameters);
            return dt;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="v_PN"></param>
        /// <returns></returns>
        public DataTable get_P_C_Summary_To_Export(string v_PN)
        {
            DataTable dt = null;
            //先进行分析。
            string procName = "pkg_analyze_products_cost.analyze_P_C";
            OracleParameter param_PN = new OracleParameter("v_product_name", OracleDbType.NVarchar2, ParameterDirection.Input);
            param_PN.Size = 20;
            param_PN.Value = v_PN;
            OracleParameter[] parameters = new OracleParameter[1] { param_PN };
            oH.ExecuteNonQuery(procName, parameters);
            
            procName = "Show_Products_Cost.get_P_C_Summary_To_Export";
            OracleParameter paramCursor = new OracleParameter("v_Cur", OracleDbType.RefCursor, 20);
            OracleParameter paramPN = new OracleParameter("v_PN",OracleDbType.NVarchar2,20);
            paramCursor.Direction = ParameterDirection.ReturnValue;
            paramPN.Direction = ParameterDirection.Input;
            paramPN.Value = v_PN;
            parameters = new OracleParameter[2] { paramCursor,paramPN };
            dt = oH.getDT(procName, parameters);
            return dt;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="v_PN"></param>
        /// <returns></returns>
        public DataTable get_P_C_Each_Port(string v_PN) {
            string procName = "Show_Products_Cost.get_P_C_Summary_By_Each_Part";
            OracleParameter paramCursor = new OracleParameter("v_Cur", OracleDbType.RefCursor, 20);
            OracleParameter paramPN = new OracleParameter("v_PN", OracleDbType.NVarchar2, 20);
            paramCursor.Direction = ParameterDirection.ReturnValue;
            paramPN.Direction = ParameterDirection.Input;
            paramPN.Value = v_PN;
            OracleParameter[] parameters = new OracleParameter[2] { paramCursor, paramPN };
            DataTable dt = oH.getDT(procName, parameters);
            return dt;
        }
    }
}
