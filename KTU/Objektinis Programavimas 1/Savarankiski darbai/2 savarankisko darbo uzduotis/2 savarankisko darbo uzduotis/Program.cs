using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//kompiuterio nr 138

namespace _2_savarankisko_darbo_uzduotis
{
    class Program
    {
        static void Main(string[] args)
        {
            double functionResult;
            int x;
            Console.WriteLine("Iveskite x reiksme: ");
            x = int.Parse(Console.ReadLine());
            if (x <= -1 && x < 0)
                functionResult = Math.Pow(Math.Sin(x), 2);
            else if (x < 1)
                functionResult = Math.Pow(x - 1, 2);
            else
                functionResult = Math.Pow(x, 2) + x + 1;
            Console.WriteLine("Kai reiksme x = {0}, tai f(x) = {1}", x, functionResult); 


        }
    }
}
