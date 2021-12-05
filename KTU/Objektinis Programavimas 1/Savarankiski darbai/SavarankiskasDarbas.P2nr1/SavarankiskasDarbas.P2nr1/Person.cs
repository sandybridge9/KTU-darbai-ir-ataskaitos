using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SavarankiskasDarbas.P2nr1
{
    class Person
    {
        public string name { get; set; }
        public int euros { get; set; }
        public int cents { get; set; }
        public double quarterMoney { get; set; }


        public Person()
        {
        }
        public Person(string Name, int Euros, int Cents)
        {
           name = Name;
           euros = Euros;
           cents = Cents;
            quarterMoney = (euros + (double)cents) * 0.25;
             
        }

    }
} 

