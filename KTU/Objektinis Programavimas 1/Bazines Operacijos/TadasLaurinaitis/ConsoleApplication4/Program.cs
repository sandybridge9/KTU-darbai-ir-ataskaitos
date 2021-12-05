using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//---------------------------------------------------
//Programa skaiciuoja kugio turi v, kai kugio pagrindu spinduliai R, r ir Aukstine H ivedami klaviatura
//---------------------------------------------------

namespace ConsoleApplication4
{
    class Program
    {
        static void Main(string[] args)
        {
            double pi = 3.1415; //konstanta
            double H;           //aukstine
            double R, r;        //kugio pagr spinduliai
            double V;           //kugio turis
            Console.WriteLine("Iveskite kugio aukstines reiksme");
            H = double.Parse(Console.ReadLine());
            Console.WriteLine("Iveskite kugio virsutinio pagrindo spindulio reiksme");
            r = double.Parse(Console.ReadLine());
            Console.WriteLine("Iveskite kugio apatinio pagrindo spindulio reiksme");
            R = double.Parse(Console.ReadLine());
            V = (1.0 / 3) * pi * H * (R *R + R * r + r * r);
            Console.WriteLine("Kugio Turis = {0, 5:f}", V);
        }
    }
}
