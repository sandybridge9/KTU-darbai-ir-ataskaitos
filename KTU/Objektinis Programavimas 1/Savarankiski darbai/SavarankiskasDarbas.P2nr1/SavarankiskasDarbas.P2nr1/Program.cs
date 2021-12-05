using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace SavarankiskasDarbas.P2nr1
{
    class Program
    {
        const int MaxNumberOfPeople = 15255454;
        static void Main(string[] args)
        {
            Person[] people;
            int NumberOfPeople;
            ReadPersonData(out people, out NumberOfPeople);

            double AllMoney = WholeSum(people, NumberOfPeople);
            Console.WriteLine("Bendra pinigu suma: {0}", AllMoney);
            WriteAllDonators(people, NumberOfPeople);

        }
        static void ReadPersonData(out Person[] People, out int NumberOfPeople)
        {
            NumberOfPeople = 0;
            People = new Person[MaxNumberOfPeople];
            using (StreamReader reader = new StreamReader(@"E:/KTU projektai/Visual Studio stuff/Savarankiski darbai/SavarankiskasDarbas.P2nr1/SavarankiskasDarbas.P2nr1/Data.csv"))
            {
                string line = null;
                while (null != (line = reader.ReadLine()))
                {
                    string[] values = line.Split(';');
                    string name = values[0];
                    int euros = int.Parse(values[1]);
                    int cents = int.Parse(values[2]);

                    Person person = new Person(name, euros, cents);
                    People[NumberOfPeople++] = person;
                }


            }


        }
        static double WholeSum(Person[] people, int NumberOfPeople)
        {
            double Sum = 0;
            for (int i = 0; i <= NumberOfPeople; i++)
            {

                Sum += people[i].quarterMoney;

            }
            return Sum;
        }


        static void WriteAllDonators(Person[] people, int NumberOfPeople)
        {
            for (int i = 0; i <= NumberOfPeople; i++)
            {
                if (people[i].quarterMoney > 0)
                {
                    Console.WriteLine(people[i].name);
                }
            }
        }
        static int DonatedMost(Person[] people, int NumberOfPeople)
        {
            double biggestDonation = 0;
            int k = 0;
            for(int i = 0; i <= NumberOfPeople; i++)
            {
                if(biggestDonation < people[i].quarterMoney)
                {
                    biggestDonation = people[i].quarterMoney;
                    k = i;
                }
            }
            return k;
        }
    }
}
