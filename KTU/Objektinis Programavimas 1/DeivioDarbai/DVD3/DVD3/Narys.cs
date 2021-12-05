using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DVD3
{
    class Narys
    {
        public string name { get; set; }
        public string surname { get; set; }
        public DateTime birth { get; set; }

        public Narys(string name, string surname, DateTime birth)
        {
            this.name = name;
            this.surname = surname;
            this.birth = birth;
        }
    }
}
