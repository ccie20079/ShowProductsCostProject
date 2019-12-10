using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Excel
{
    public class TemplateProperty
    {
        private decimal _row_index;
        private string _property_name;
        private string _property_chinese_name;
        private decimal _visible;



        public string Property_name
        {
            get
            {
                return _property_name;
            }

            set
            {
                _property_name = value;
            }
        }

        public string Property_chinese_name
        {
            get
            {
                return _property_chinese_name;
            }

            set
            {
                _property_chinese_name = value;
            }
        }

        public decimal Visible
        {
            get
            {
                return _visible;
            }

            set
            {
                _visible = value;
            }
        }

        public decimal Row_index
        {
            get
            {
                return _row_index;
            }

            set
            {
                _row_index = value;
            }
        }
    }
}
