using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Core;
using Excel;
namespace Products_Cost.Interface
{
    public interface IDownloadTemplate
    {
        //依据DataTable 下载成衣模板
        MyExcel getTemplate();
        //写模板。
        MyExcel writeTemplate();
        //
        MyExcel write_Template_For_Record_P_C();
    }
}
