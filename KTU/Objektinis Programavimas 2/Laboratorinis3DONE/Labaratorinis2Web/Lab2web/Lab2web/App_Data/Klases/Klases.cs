using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;

namespace Lab2web
{
    public class Klases
    {
    }

    public class Sarasas<T> : IEnumerable where T : IComparable<T>
    {
        public Mazgas<T> pradzia;
        public Mazgas<T> pabaiga;
        public Mazgas<T> p;
        public int Count;

        public Sarasas()
        {
            Count = 0;
            pradzia = null;
            pabaiga = null;
            p = null;
        }

        public void Add(T item)
        {
            Count++;
            if (pradzia == null)
            {
                pradzia = pabaiga = new Mazgas<T>(item, pradzia);
                p = pabaiga;
            }
            else
            {
                Mazgas<T> laikinas = new Mazgas<T>(item, pradzia);
                pabaiga.kitas = laikinas;
                pabaiga = pabaiga.kitas;
                p = pabaiga;
            }
        }
        public IEnumerator GetEnumerator()
        {
            Mazgas<T> prad = pradzia;
            for (int i = 0; i < Count; i++)
            {
                yield return prad.informacija;
                prad = prad.kitas;
            }
        }
    }

    public class Mazgas<T>
    {
        public T informacija { get; set; }
        public Mazgas<T> kitas { get; set; }

        public Mazgas(T info, Mazgas<T> kt)
        {
            informacija = info;
            kitas = kt;
        }
    }

    public class Pirkejas : IComparable<Pirkejas>, IEquatable<Pirkejas>
    {
        public string pavarde { get; set; }
        public string vardas { get; set; }
        public string pirktasKodas { get; set; }
        public int itaisuKiekis { get; set; }

        public Pirkejas()
        {

        }

        public Pirkejas(string pv, string vd, string pK, int itK)
        {
            pavarde = pv;
            vardas = vd;
            pirktasKodas = pK;
            itaisuKiekis = itK;
        }

        public int CompareTo(Pirkejas kitas)
        {
            return this.vardas.CompareTo(kitas.vardas);
        }

        public bool Equals(Pirkejas kitas)
        {
            return this.vardas == kitas.vardas;
        }
    }

    public class Itaisas : IComparable<Itaisas>, IEquatable<Itaisas>
    {
        public string kodas { get; set; }
        public string pavadinimas { get; set; }
        public double kaina { get; set; }

        public Itaisas()
        {

        }

        public Itaisas(string kd, string pav, double kn)
        {
            kodas = kd;
            pavadinimas = pav;
            kaina = kn;
        }

        public int CompareTo(Itaisas kitas)
        {
            return this.kodas.CompareTo(kitas.kodas);
        }

        public bool Equals(Itaisas kitas)
        {
            return this.kodas == kitas.kodas;
        }
    }



}