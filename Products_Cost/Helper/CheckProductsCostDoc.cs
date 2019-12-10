using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Tools;
namespace Products_Cost.Helper
{
    public class CheckProductsCostDoc
    {
        private int _rowIndex;
        private string _summaryP;
        private string _specificP;

        public int RowIndex
        {
            get
            {
                return _rowIndex;
            }

            set
            {
                _rowIndex = value;
            }
        }

        public string SummaryP
        {
            get
            {
                return _summaryP;
            }

            set
            {
                _summaryP = value;
            }
        }

        public string SpecificP
        {
            get
            {
                return _specificP;
            }

            set
            {
                _specificP = value;
            }
        }

        public CheckProductsCostDoc(int _rowIndex, string _summaryP, string _specificP)
        {
            this.RowIndex = _rowIndex;
            this.SummaryP = _summaryP;
            this.SpecificP = _specificP;
        }
        /// <summary>
        /// 检查是否存在相同的工序。
        /// </summary>
        /// <returns></returns>
        public MSG ifExistsSameProcess() {
            string sqlStr = string.Format(@"select row_index,
                                                    seq_p_c_record
                                              from Check_Products_Cost_Doc
                                              where summary_Process= '{0}'
                                              and Specific_process = '{1}'",
                                                                            _summaryP,
                                                                            _specificP);
            System.Data.DataTable dt = OracleDaoHelper.getDTBySql(sqlStr);
            if (dt.Rows.Count>0) {
                string seq_p_c_record = dt.Rows[0]["seq_p_c_record"].ToString();
                MSG msg = new MSG(string.Format(@"序号{0},{1} {2}", seq_p_c_record, _summaryP,_specificP), true);
                return msg;
            }
            return new MSG("检查结果：不重复",false);
        }
        public void addProcess() {
            string sqlStr = string.Format(@"INSERT INTO 
                                                Check_Products_Cost_Doc(
                                                                        row_index,
                                                                        summary_process, 
                                                                        specific_process                                                                        
                                                                    )
                                                VALUES(
                                                        {0},
                                                        '{1}',
                                                        '{2}'
                                                        )",
                                                        _rowIndex,
                                                        _summaryP,
                                                        _specificP);
            OracleDaoHelper.executeSQL(sqlStr);
        }
        /// <summary>
        /// 删除Check_Products_Cost_Doc中的记录。
        /// </summary>
        public static void deleteAllRecord() {
            OracleDaoHelper.executeSQL("DELETE FROM Check_Products_Cost_Doc");
        }
    }
}
