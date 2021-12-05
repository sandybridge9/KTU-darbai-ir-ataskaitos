using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DVD3
{
    class Branch
    {
        const int Cmax = 50;

        public DateTime start { get; set; }
        public DateTime end { get; set; }
        public MemberContainer players { get; private set; }
        public MemberContainer staff { get; private set; }

        public Branch(DateTime start, DateTime end)
        {
            this.start = start;
            this.end = end;
            this.players = new MemberContainer(Cmax);
            this.staff = new MemberContainer(Cmax);
        }
    }
}
