using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DVD3
{
    class Personalas : Narys
        {
            public string duty { get; set; }

            public Personalas(string name, string surname, DateTime birth, string duty) : base(name, surname, birth)
            {
                this.duty = duty;
            }

            public override String ToString()
            {
                return String.Format("{0, -10}|{1, -10}|{2, -22}|{3}", name, surname,
                                birth, duty);
            }
        }
    }
