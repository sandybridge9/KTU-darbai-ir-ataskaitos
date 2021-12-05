using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//-----------------------------------------------------
//sveikuju reiksmiu ivedimas
//------------------------------------------------------

namespace ConsoleApplication3
{
    class Program
    {
        static void Main(string[] args)
        {
            int a;
            int b;
            int suma;
            Console.WriteLine("Iveskite sveikaja a reiksme: ");
            a = int.Parse(Console.ReadLine());
            Console.WriteLine("Iveskite sveikaja b reiksme: ");
            b = int.Parse(Console.ReadLine());
            suma = a + b;
            Console.WriteLine("{0} + {1} = {2}", a, b, suma);
        }
    }
}
