using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab4Web
{
    public class Container<T> where T : IEquatable<T>, IComparable<T>
    {
        public List<T> list { get; set; }

        public Container()
        {
            list = new List<T>();
        }
        /// <summary>
        /// Objekto idejimo i konteineri metodas
        /// </summary>
        /// <param name="data">Kurios nors klases objektas</param>
        public void Add(T data)
        {
            list.Add(data);
        }
    }
}