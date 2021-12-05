using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab2web
{
    public class Klases
    {
    }

    class Pirkejas
    {
        public string pavarde { get; set; }
        public string vardas { get; set; }
        public string pirktasKodas { get; set; }
        public int itaisuKiekis { get; set; }
        public Pirkejas kitas { get; set; }
        public Pirkejas()
        { }
        public Pirkejas(string pv, string vd, string pK, int itK, Pirkejas kt)
        {
            pavarde = pv;
            vardas = vd;
            pirktasKodas = pK;
            itaisuKiekis = itK;
            kitas = kt;
        }
    }

    class Itaisas
    {
        public string kodas { get; set; }
        public string pavadinimas { get; set; }
        public double kaina { get; set; }
        public Itaisas kitas { get; set; }
        public Itaisas()
        { }
        public Itaisas(string kd, string pav, double kn, Itaisas kt)
        {
            kodas = kd;
            pavadinimas = pav;
            kaina = kn;
            kitas = kt;
        }

    }

}