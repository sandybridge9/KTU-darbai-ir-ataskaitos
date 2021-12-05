using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace LaboratorinisNr2
{
    class Program
    {
        static void Main(string[] args)
        {
            Vykdyti();
        }

        //1.1 paprasta rekursija
        public static double Rekursija(int n)
        {
            double sum = 0;
            //Console.WriteLine("n pradzia: " + n + ", o suma: " + sum);

            if (n > 1)
            {
                sum += Rekursija(n - 1);
                //Console.WriteLine("n po pirmos rekursijos: " + n +", o suma: " +sum);
                sum += 8 * Rekursija(n - 4);
                //Console.WriteLine("n po antros rekursijos: " + n + ", o suma: " + sum);
                sum += 9 * Rekursija(n - 5);
                //Console.WriteLine("n po trecios rekursijos: " + n + ", o suma: " + sum);
                sum += (Math.Pow(n, 4))/3;
                //Console.WriteLine("n po kelimo ir dalybos: " + n + ", o suma: " + sum);
                return sum;
            }
            else
            {
                //Console.WriteLine("n maziau arba lygu 1. n = " + n);
                return 5;
            }
                
            //return 0;
        }

        //1.2 dinaminis programavimas
        public static double[] ReiksmesRekursijai(int n)
        {
            double[] reiksmes = new double[n];
            reiksmes[1] = 5;
            for (int i = 1; i < reiksmes.Length; i++)
            {
                reiksmes[i] = double.MinValue;
                //Console.WriteLine(reiksmes[i]);
            }
            return reiksmes;
        }

        public static double DinamineRekursija(double[] p, int n)
        {
            if(n <= 1)
            {
                return 5;
            }
            if(p[n] > 0)
            {
                //Console.WriteLine("F("+ n +") jau isspresta, atsakymas: " +p[n] +"------------------------------------------------------------------");
                return p[n];
            }
            else if(p[n] < 0)
            {
                double sum = 0;
                sum += DinamineRekursija(p, n - 1);
                //Console.WriteLine("n po pirmos rekursijos: " + n + ", o suma: " + sum);
                sum += 8 * DinamineRekursija(p, n - 4);
                //Console.WriteLine("n po antros rekursijos: " + n + ", o suma: " + sum);
                sum += 9 * DinamineRekursija(p, n - 5);
                //Console.WriteLine("n po trecios rekursijos: " + n + ", o suma: " + sum);
                sum += (Math.Pow(n, 4)) / 3;
                //Console.WriteLine("n po kelimo ir dalybos: " + n + ", o suma: " + sum);
                p[n] = sum;
                return sum;
            }
            return 0;
        }

        //2 zodinis uzdavinys
        public static double[] ReiksmesTriusiam(int n)
        {
            double[] reiksmes = new double[n];
            for (int i = 0; i < reiksmes.Length; i++)
            {
                reiksmes[i] = int.MinValue;
            }
            return reiksmes;
        }
        
        public static double SokantisTriusis(double[] p, int n)
        {
            double sum = 0;
            if (n == 2 || n == 3 || n == 4)
            {
                return 1;
            }
            else if(n == 1)
            {
                return 0;
            }
            else if(p[n] > 1)
            {
                return p[n];
            }
            else
            {
                sum += SokantisTriusis(p, n - 2) + SokantisTriusis(p, n - 3);
                p[n] = sum;
                return sum;
            }
        }

        //laiko tyrimai
        public static void LaikoTyrimas1Rekursija(int n)
        {
            Stopwatch timer = new Stopwatch();
            timer.Start();
            double sum = Rekursija(n);
            timer.Stop();
            Console.WriteLine("Gauta reiksme: " + sum);
            TimeSpan t = timer.Elapsed;
            Console.WriteLine("Pirmos uzduoties sprendimas rekursijos budu truko: " + t + " valandu");
        }

        public static void LaikoTyrimas1Dinaminis(int n)
        {
            double[] reiksmes = ReiksmesRekursijai(n*3);
            Stopwatch timer = new Stopwatch();
            timer.Start();
            double sum = DinamineRekursija(reiksmes, n);
            timer.Stop();
            Console.WriteLine("Gauta reiksme: " + sum);
            TimeSpan t = timer.Elapsed;
            Console.WriteLine("Pirmos uzduoties sprendimas dinaminiu budu truko: " + t + " valandu");
        }

        public static void LaikoTyrimas2(int n)
        {
            double[] reiksmes = ReiksmesTriusiam(n * 2);
            Stopwatch timer = new Stopwatch();
            timer.Start();
            double sum = SokantisTriusis(reiksmes, n);
            timer.Stop();
            Console.WriteLine("Gauta reiksme: " + sum);
            TimeSpan t = timer.Elapsed;
            Console.WriteLine("Antros uzduoties sprendimas truko: " + t +" valandu");
        }

        //metodas vykdantis kitus metodus
        public static void Vykdyti()
        {
            int n = 0;
            while(n != 3)
            {
                
                Console.WriteLine("Pasirinkite norima uzduoti: 1/2 (Iveskite norima skaiciu 1 arba 2) arba spauskite 3 kad baigti");
                n = Convert.ToInt32(Console.ReadLine());
                if(n == 1)
                {
                    Console.WriteLine("Pasirinkote uzduoti nr. 1");
                    Console.WriteLine("Iveskite norima skaiciu/reiksme kuri bus naudojama funkcijose ");
                    int nn = Convert.ToInt32(Console.ReadLine());
                    LaikoTyrimas1Rekursija(nn);
                    LaikoTyrimas1Dinaminis(nn);
                    Console.WriteLine("------------Uzduotis nr. 1 baigta vykdyti!-------------");
                }
                else if(n == 2)
                {
                    Console.WriteLine("Pasirinkote uzduoti nr. 2");
                    Console.WriteLine("Iveskite norima skaiciu/reiksme kuri bus naudojama funkcijose ");
                    int nn = Convert.ToInt32(Console.ReadLine());
                    LaikoTyrimas2(nn);
                    Console.WriteLine("------------Uzduotis nr. 2 baigta vykdyti!-------------");
                }
            }
        }
    }
}
