using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab4Web
{
    public class Print : IEquatable<Print>, IComparable<Print>
    {
        public string code { get; set; }
        public string title { get; set; }
        public string publisher { get; set; }
        public double price { get; set; }

        public Print() { }

        public Print(string code, string title, string publisher, double price)
        {
            this.code = code;
            this.title = title;
            this.publisher = publisher;
            this.price = price;
        }
        /// <summary>
        /// IEquatable igyvendinimas
        /// </summary>
        /// <param name="other">Print klases objektas</param>
        /// <returns></returns>
        public bool Equals(Print other)
        {
            return (price == other.price);
        }
        /// <summary>
        /// Icomparable igyvendinimas
        /// </summary>
        /// <param name="other">Print klases objektas</param>
        /// <returns></returns>
        public int CompareTo(Print other)
        {
            return (price.CompareTo(other.price));
        }
    }
}