using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tools
{
    public struct FileStruct
    {
        public string Flags;
        public string Owner;
        public string Group;
        public bool IsDirectory;
        public DateTime CreateTime;
        public string Name;
    }
}
