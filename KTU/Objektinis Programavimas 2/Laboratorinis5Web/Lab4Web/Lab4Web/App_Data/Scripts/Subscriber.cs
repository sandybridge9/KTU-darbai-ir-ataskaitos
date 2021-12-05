using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab4Web
{
    public class Subscriber : IEquatable<Subscriber>, IComparable<Subscriber>
    {
        public string surname { get; set; }
        public string adress { get; set; }
        public int startingMonth { get; set; }
        public int duration { get; set; }
        public string code { get; set; }
        public int quantity { get; set; }

        public Subscriber() { }

        public Subscriber(string surname, string adress, int startingMonth, int duration, string code, int quantity)
        {
            this.surname = surname;
            this.adress = adress;
            this.startingMonth = startingMonth;
            this.duration = duration;
            this.code = code;
            this.quantity = quantity;
        }
        /// <summary>
        /// IEquatable igyvendinimas
        /// </summary>
        /// <param name="other">Subscriber klases objektas</param>
        /// <returns></returns>
        public bool Equals(Subscriber other)
        {
            return (code == other.code);
        }
        /// <summary>
        /// Icomparable igyvendinimas
        /// </summary>
        /// <param name="other">Subscriber klases objektas</param>
        /// <returns></returns>
        public int CompareTo(Subscriber other)
        {
            return (code.CompareTo(other.code));
        }
    }
}