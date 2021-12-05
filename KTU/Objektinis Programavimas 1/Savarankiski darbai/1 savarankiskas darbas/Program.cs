using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1_savarankiskas_darbas
{
    class Program
    {
        static void Main(string[] args)
        {
            char character;
            int totalNumberOfSymbols;
            int numberOfSymbolsPerLine;

            Console.WriteLine("Input the symbol: ");
            character = char.Parse(Console.ReadLine());
            Console.WriteLine("Input the total number of symbols: ");
            totalNumberOfSymbols = int.Parse(Console.ReadLine());
            Console.WriteLine("Input the number of symbols per line: ");
            numberOfSymbolsPerLine = int.Parse(Console.ReadLine());

            for (int i = 1; i <= totalNumberOfSymbols; i++)
            {
                for (int j = 1; j < numberOfSymbolsPerLine; j++)
                {
                    Console.Write(character);
                }
                Console.WriteLine(character);
            }
        }
    }
}