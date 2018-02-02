using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mommosoft.ExpertSystem;
using System.Diagnostics;

namespace JakaGra {
    public class DebugRouter : Router{
        public override string Name {
            get { return "DebugRouter"; }
        }

        public override int Priority {
            get { return 10; }
        }

        public override bool Query(string logicalName)
        {
            return true;
        }

        public override int Print(string logicalName, string message) {
            Debug.Write(message);
            Console.Write(message);
            return 1;
        }
    }
}
