using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class ProcessBarInfo
    {
        private string _promptStr =string.Empty;
        private int _currentValue = 0;
        private int _totalValue = 0;
        /// <summary>
        /// 
        /// </summary>
        public string PromptStr
        {
            get
            {
                return _promptStr;
            }

            set
            {
                _promptStr = value;
            }
        }

        public int CurrentValue
        {
            get
            {
                return _currentValue;
            }

            set
            {
                _currentValue = value;
            }
        }

        public int TotalValue
        {
            get
            {
                return _totalValue;
            }

            set
            {
                _totalValue = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public ProcessBarInfo() {
            
        }
        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="_promptStr"></param>
        /// <param name="_currentValue"></param>
        /// <param name="_totalValue"></param>
        public ProcessBarInfo(string _promptStr, int _currentValue, int _totalValue)
        {
            this.PromptStr = _promptStr;
            this.CurrentValue = _currentValue;
            this.TotalValue = _totalValue;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="mess"></param>
        /// <returns></returns>
        public static ProcessBarInfo getProcessBarInfo(string mess)
        {
            int firstIndex = mess.IndexOf("-");
            int lastIndex = mess.IndexOf("-");
            if (firstIndex > 0 && lastIndex > 0)
            {
                return new ProcessBarInfo(mess.Substring(firstIndex), int.Parse(mess.Substring(firstIndex + 1, lastIndex - firstIndex - 1)), int.Parse(mess.Substring(lastIndex + 1)));
            }
            return null;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string toString() {
            return this._promptStr + "-" + this._currentValue + "-" + this._totalValue;
        }
    }
}
