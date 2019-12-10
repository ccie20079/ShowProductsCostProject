using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace tools
{
    public class ListHelper 
    {
        String temp = "";
        //add info from list to result;
        public void addInfoToListResult(int index,List<String> list,List<String> listResult) {
            temp = list[index];
            list.Remove(temp);
            listResult.Add(temp);
        }
        //back to info to list from result;
        public void backInfoToList(int index,List<String> list,List<String> listResult) {
            temp = listResult[index];
            listResult.Remove(temp);
            list.Add(temp);
        }
        //move info
        public void upInfoInListResult(int index, List<String> list, List<String> listResult)
        {
            temp = listResult[index];
            listResult[index] = listResult[index-1];
            listResult[index - 1] = temp; 
        }
        //move info down
        public void downInfoInListResult(int index, List<String> list, List<String> listResult)
        {
            temp = listResult[index];
            listResult[index] = listResult[index + 1];
            listResult[index + 1] = temp;
        }
    }
}
