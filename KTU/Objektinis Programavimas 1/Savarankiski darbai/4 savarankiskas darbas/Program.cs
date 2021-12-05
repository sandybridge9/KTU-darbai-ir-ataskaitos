using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace savarankiskas_darbas_nr_keturi
{
    class Program
    {
        static void Main(string[] args)
        {
            string vardas;
            Console.WriteLine("Parasykite savo vardą: ");
            vardas = (string)Console.ReadLine();

            if (vardas[vardas.Length - 2] == 'a' && vardas[vardas.Length - 1] == 's')
            {
                Console.WriteLine("Labas ");
                for (int i = 0; i < vardas.Length - 2; i++)
                    Console.Write(vardas[i]);
                Console.WriteLine("ai");
            }
            else
                if (vardas[vardas.Length - 2] == 'i' && vardas[vardas.Length - 1] == 's')
            {
                Console.WriteLine("Labas ");
                for (int i = 0; i < vardas.Length - 2; i++)
                    Console.Write(vardas[i]);
                Console.WriteLine("i");
            }
            else
                 if (vardas[vardas.Length - 2] == 'y' && vardas[vardas.Length - 1] == 's')
            {
                Console.WriteLine("Labas ");
                for (int i = 0; i < vardas.Length - 2; i++)
                    Console.Write(vardas[i]);
                Console.WriteLine("y");
            }
            else
                if (vardas[vardas.Length - 2] == 'a' && vardas[vardas.Length - 1] == 's')
            {
                Console.WriteLine("Labas ");
                for (int i = 0; i < vardas.Length - 2; i++)
                    Console.Write(vardas[i]);
                Console.WriteLine("ai");
            }
            else
                 if (vardas[vardas.Length - 1] == 'ė')
            {
                Console.WriteLine("Labas ");
                for (int i = 0; i < vardas.Length - 2; i++)
                    Console.Write(vardas[i]);
                Console.WriteLine("e");
            }
            else Console.WriteLine("Labas + vardas");
        }
    }
}

