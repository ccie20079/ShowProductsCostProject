using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace tools
{
    //declare the general Class 
    public class SingleListHelper<T>
    {
        private IList<T> list = null;

        public IList<T> List
        {
            get { return list; }
            set { list = value; }
        }
        /// <summary>
        /// 将某个元素上移
        /// </summary>
        /// <param name="index">元素索引</param>
        public void upElement(T obj) {
            //obj所在的位置索引
            int index = list.IndexOf(obj); 
            if(index <= 0){
                return;
            }
            //删除此位置的元素
            list.Remove(obj); 
            //上一个位置添加此元素
            list.Insert(index-1, obj);
        }
        /// <summary>
        /// 向下移动某个元素
        /// </summary>
        /// <param name="obj"></param>
        public void downElement(T obj)
        {
            //obj所在的位置索引
            int index = list.IndexOf(obj);
            if (index ==list.Count-1)
            {
                return;
            }
            //删除此位置的元素
            list.Remove(obj);
            //上一个位置添加此元素
            list.Insert(index+1, obj);
        }
  
    }
}
