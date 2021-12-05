using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Laboratorinis1
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] arr = GenerateArray(50);
            Sort(arr);
            //arr = PerformInsertionSort(arr);
            foreach(int n in arr)
            {
                Console.WriteLine(n);
            }
        }

        static int[] PerformInsertionSort(int[] array)
        {
            int length = array.Length;

            for (int i = 1; i < length; i++)
            {
                int j = i;

                while ((j > 0) && (array[j] < array[j - 1]))
                {
                    int k = j - 1;
                    int temp = array[k];
                    array[k] = array[j];
                    array[j] = temp;

                    j--;
                }
            }
            return array;
        }

        static void Sort(int[] arr)
        {
            int i, j;
            int[] tmp = new int[arr.Length];
            for (int shift = 31; shift > -1; --shift)
            {
                j = 0;
                for (i = 0; i < arr.Length; ++i)
                {
                    bool move = (arr[i] << shift) >= 0;
                    if (shift == 0 ? !move : move)
                        arr[i - j] = arr[i];
                    else
                        tmp[j++] = arr[i];
                }
                Array.Copy(tmp, 0, arr, arr.Length - j, j);
            }
        }

        static int[] GenerateArray(int n)
        {
            Random rnd = new Random();
            int[] array = new int[n];
            for (int i = 0; i < array.Length; i++)
            {
                int c = rnd.Next(100);
                array[i] = c;
                Console.WriteLine(array[i]);
            }
            Console.WriteLine("-------------");
            return array;
        }

        static void ReadData(string file)
        {
            using (StreamReader reader = new StreamReader(@file))
            {
                string line = null;

                line = reader.ReadLine();

                if (line != null)
                    branchNumber = line;

                line = reader.ReadLine();

                if (line != null)
                    date = line;
                while (null != (line = reader.ReadLine()))
                {
                    string[] value = line.Split();
                    string firstName = value[0];
                    string lastName = value[1];
                    string team = value[2];
                    string position = value[3];
                    string champion = value[4];
                    int kills = int.Parse(value[5]);
                    int assists = int.Parse(value[6]);

                    Player player = new Player(firstName, lastName, team, position, champion, kills, assists);
                    branch.players.AddPlayer(player);
                }
            }
        }
    }
}
