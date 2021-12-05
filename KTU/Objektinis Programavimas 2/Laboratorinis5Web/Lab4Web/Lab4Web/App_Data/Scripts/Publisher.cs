using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab4Web
{
    public class Publisher : IEquatable<Publisher>, IComparable<Publisher>
    {
        public string name { get; set; }
        public double profit { get; set; }
        public string title { get; set; }

        public Publisher() { }

        public Publisher(string name, double profit, string title)
        {
            this.name = name;
            this.profit = profit;
            this.title = title;
        }
        /// <summary>
        /// IEquatable igyvendinimas
        /// </summary>
        /// <param name="other">Publisher klases objektas</param>
        /// <returns></returns>
        public bool Equals(Publisher other)
        {
            return (profit == other.profit);
        }
        /// <summary>
        /// Icomparable igyvendinimas
        /// </summary>
        /// <param name="other">Publisher klases objektas</param>
        /// <returns></returns>
        public int CompareTo(Publisher other)
        {
            return (profit.CompareTo(other.profit));
        }
    }
}