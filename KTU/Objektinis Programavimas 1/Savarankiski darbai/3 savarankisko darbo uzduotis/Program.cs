using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_savarankisko_darbo_uzduotis
{
    class Program
    {
        static void Main(string[] args)
        {
            double firstNumber;
            double secondNumber;
            double answer;
            char Sign;
            
            Console.WriteLine("Input the first number: ");
            firstNumber = double.Parse(Console.ReadLine());
            Console.WriteLine("Input the action sign");
            Sign = char.Parse(Console.ReadLine());
            Console.WriteLine("Input the second number: ");
            secondNumber = double.Parse(Console.ReadLine());
            

            if (Sign == '+')
            {
                answer = firstNumber + secondNumber;
                Console.WriteLine("answer = {0}", answer);
            }
            else if (Sign == '-')
            {
                answer = firstNumber - secondNumber;
                Console.WriteLine("answer = {0}", answer);
            }
            else if (Sign == '*')
            {
                answer = firstNumber * secondNumber;
                Console.WriteLine("answer = {0}", answer);
            }
            else if (Sign == '/')
            {
                answer = firstNumber / secondNumber;
                Console.WriteLine("answer = {0}", answer);
            }
            else Console.WriteLine("Error");

        }
    }
}

