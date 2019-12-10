using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tools
{
    /// <summary>
    /// 
    /// </summary>
    public class MSG
    {
        private string _msg=string.Empty;
        private bool _flag = false;
        /// <summary>
        /// 用于标识 程序是否完成.
        /// </summary>
        private bool _complete_flag;
        /// <summary>
        /// 
        /// </summary>
        public MSG() {

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="msg"></param>
        /// <param name="flag"></param>
        public MSG(string msg, bool flag) {
            this._flag = flag;
            this._msg = msg;
        }
        /// <summary>
        /// 
        /// </summary>
        public string Msg
        {
            get
            {
                return _msg;
            }

            set
            {
                _msg = value;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool Flag
        {
            get
            {
                return _flag;
            }

            set
            {
                _flag = value;
            }
        }
    }
}
