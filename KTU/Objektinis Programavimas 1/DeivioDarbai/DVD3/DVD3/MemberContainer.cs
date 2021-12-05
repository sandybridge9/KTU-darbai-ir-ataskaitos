using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DVD3
{
    class MemberContainer
    {
        private Narys[] member { get; set; }
        public int Count { get; private set; }

        public MemberContainer(int size)
        {
            member = new Narys[size];
            Count = 0;
        }

        public void AddMember(Narys member)
        {
            this.member[Count++] = member;
        }

        public Narys GetMember(int index)
        {
            return member[index];
        }
    }
}
