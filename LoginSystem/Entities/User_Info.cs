using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace LoginSystem.Entities
{
    public class User_Info
    {
        private string _user_Name;
        private string _password;
        private string _department;
        private string _action;
        private string _update_time;
      

        public string Password
        {
            get
            {
                return _password;
            }

            set
            {
                _password = value;
            }
        }

        public string Department
        {
            get
            {
                return _department;
            }

            set
            {
                _department = value;
            }
        }



        public string User_Name
        {
            get
            {
                return _user_Name;
            }

            set
            {
                _user_Name = value;
            }
        }

        public string Update_time
        {
            get
            {
                return _update_time;
            }

            set
            {
                _update_time = value;
            }
        }

        public string Action
        {
            get
            {
                return _action;
            }

            set
            {
                _action = value;
            }
        }
    }
}
