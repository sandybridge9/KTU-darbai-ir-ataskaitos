using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace L5Tekstas
{
    class Program
    {
        const string file1 = @"..\..\Knyga1.txt";
        const string file2 = @"..\..\Knyga2.txt";
        const string analysis = @"..\..\Analize.txt";
        const string results = @"..\..\ManoKnyga.txt";
        const int maxNumberOfWords = 95829;

        static void Main(string[] args)
        {
            char[] punctuation = { '.', ',', ' ', ';', '(', ')', '-', '?', '!', '"', '\n', ':', '/', '}', '{', '[', ']', '&', '*'};
            int count;
            string[] words1 = GetWordsFromText(file1, punctuation);
            string[] words2 = GetWordsFromText(file2, punctuation);
            words1 = words1.OrderBy(aux => aux.Length).ToArray();
            string[] filteredWords = FilteredWordArray(words1, words2, out count);
            filteredWords = filteredWords.Where(aux => !string.IsNullOrEmpty(aux)).ToArray();
            string[] longestWords = LongestWordArray(filteredWords);
            longestWords = longestWords.Where(aux => !string.IsNullOrEmpty(aux)).ToArray();
            int[] repeatings = LongestWordRepeatings(longestWords, filteredWords);
            string[] fragmentArray = FragmentArray(file1, file2);
            WriteAnalysis(analysis, longestWords, repeatings, fragmentArray);
            string[] textWithout1 = GetText(file1, punctuation);
            string[] textWithout2 = GetText(file2, punctuation);
            //foreach(string c in textWithoutSpaces2)
            //{
            //    Console.WriteLine(c);
            //}
            List<string> myBook = GetMyBook(textWithout1, textWithout2, punctuation);
            Console.WriteLine(myBook.Count);
            foreach(string c in myBook)
            {
                Console.Write("{0} ", c);
            }


        }
        /// <summary>
        /// Israso visus zodzius i zodziu masyva is teksto
        /// </summary>
        /// <param name="file"></param>
        /// <param name="punctuation"></param>
        /// <returns>grazina zodziu be skirikliu masyva</returns>
        static string[] GetWordsFromText(string file, char[] punctuation)
        {
            string lines = File.ReadAllText(file, Encoding.GetEncoding(1257));
            string[] words = lines.Split(punctuation, StringSplitOptions.RemoveEmptyEntries);
            return words;
        }
        /// <summary>
        /// Isfiltruoja zodzius (palieka tik tuos zodzius kurie yra pirmame faile bet nera antrame)
        /// </summary>
        /// <param name="words1"></param>
        /// <param name="words2"></param>
        /// <param name="count"></param>
        /// <returns>grazina filtruotu zodziu masyva</returns>
        static string[] FilteredWordArray(string[] words1, string[] words2, out int count)
        {
            string[] filteredWords = new string[words1.Length];
            count = 0;

            for (int i = 0; i < words1.Length; i++)
            {
                if (!words2.Contains(words1[i]))
                {
                    if (!filteredWords.Contains(words1[i]))
                    {
                        filteredWords[count] = words1[i];
                        count++;
                    }
                }
            }
            return filteredWords;
        }
        /// <summary>
        /// Sudaro ilgiausiu zodziu masyva
        /// </summary>
        /// <param name="filteredWords"></param>
        /// <returns>grazina ilgiausiu zodziu masyva</returns>
        static string[] LongestWordArray(string[] filteredWords)
        {
            string[] longestWords = new string[filteredWords.Length];
            int count = 0;
            for (int i = filteredWords.Length - 1; i >= filteredWords.Length - 10; i--)
            {
                longestWords[count] = filteredWords[i];
                count++;
            }
            return longestWords;
        }
        /// <summary>
        /// Suskaiciuoja kiek kartu karojasi kiekvienas ilgiausias zodis
        /// </summary>
        /// <param name="longestWords"></param>
        /// <param name="filteredWords"></param>
        /// <returns> grazina ilgiausiu zodziu pasikartojimu masyva</returns>
        static int[] LongestWordRepeatings(string[] longestWords, string[] filteredWords)
        {
            int[] repeatings = new int[longestWords.Length];
            for (int i = 0; i < longestWords.Length; i++)
            {
                if (filteredWords.Contains(longestWords[i]))
                {
                    repeatings[i]++;
                }
                else
                {
                    repeatings[i] = 0;
                }
            }
            return repeatings;
        }
        /// <summary>
        /// suraso tarpinius rezultatus i analizes faila "Analize.txt"
        /// </summary>
        /// <param name="file"></param>
        /// <param name="longestWords"></param>
        /// <param name="repeatings"></param>
        /// <param name="fragmentArray"></param>
        static void WriteAnalysis(string file, string[] longestWords, int[] repeatings, string[] fragmentArray)
        {
            
            using (StreamWriter writer = new StreamWriter(file))
            {
                writer.Write("Ilgiausi žodžiai mažėjimo tvarka: ");
                for(int i = 0; i < longestWords.Length; i++)
                {
                    writer.WriteLine("Zodis nr.{0} \"{1}\" kartojasi {2} kartu.", i+1, longestWords[i], repeatings[i]);
                }
                for(int i = 0; i < fragmentArray.Length; i++)
                {
                    writer.Write("{0} ", fragmentArray[i]);
                }
            }
        }
        /// <summary>
        /// Israso ilgiausia fragmenta kuris yra abiejuose tekstiniuose failuose
        /// </summary>
        /// <param name="file1"></param>
        /// <param name="file2"></param>
        /// <returns>grazina fragmentu masyva</returns>
        static string[] FragmentArray(string file1, string file2)
        {
            string text1 = File.ReadAllText(file1, Encoding.GetEncoding(1257));
            string text2 = File.ReadAllText(file2, Encoding.GetEncoding(1257));
            string[] splitText1 = text1.Split(' ');
            string[] splitText2 = text2.Split(' ');
            string[] fragmentArray = new string[splitText1.Length];
            int count = 0;
            int[] index = new int[fragmentArray.Length];
            foreach(string fragment in splitText1)
            {
                if(splitText2.Contains(fragment))
                {
                    fragmentArray[count] = fragment;
                    count++;
                }
            }
            for(int i = 0; i < fragmentArray.Length; i++)
            {
                index[i] = Array.IndexOf(splitText2, fragmentArray[i]);
            }
            //int Count = 0;
            //int str = Array.IndexOf(fragmentArray, fragmentArray[1]);
            //foreach(int indx in index)
            //{
            //    if(indx == str)
            //    {

            //    }
            //}
            return fragmentArray;
        }
        /// <summary>
        /// sudaro viso teksto isskirstyto ir skaityto pagal reikalavimus masyva
        /// </summary>
        /// <param name="file1"></param>
        /// <param name="file2"></param>
        /// <returns>grazina viso teksto sudaryto pagal reikalavimus masyva</returns>
        //static string[] MyBook(string file1, string file2)
        //{
        //    string txt1 = File.ReadAllText(file1);
        //    string txt2 = File.ReadAllText(file2);
        //    string[] text1 = txt1.Split(' ');
        //    string[] text2 = txt2.Split(' ');
        //    string[] fullText = new string[text1.Length + text2.Length];
        //    bool text1End = false;
        //    bool text2End = false;
        //    bool contains = false;
        //    int count = 0;
        //    int index1 = 0;
        //    int index2 = 0;
        //    while((text2End = false) || (text1End = false))
        //    {
        //        while(contains == false)
        //        {
        //            for(int i = index1; i < text1.Length; i++)
        //            {
        //                if((!text2.Contains(text1[i])) && (text1End = false))
        //                {
        //                    fullText[count] = text1[i];
        //                    index1 = i;
        //                    count++;
        //                }
        //                else if(text2.Contains(text1[i]))
        //                {
        //                    contains = true;
        //                    index1 = i;
        //                }
        //                else if (text1[i] == null)
        //                {
        //                    text1End = true;
        //                }
        //            }
        //        }
        //        contains = false;
        //        while(contains == false)
        //        {
        //            for (int i = index2; i < text2.Length; i++)
        //            {
        //                if ((!text1.Contains(text2[i])) && (text2End = false))
        //                {
        //                    fullText[count] = text1[i];
        //                    index2 = i;
        //                    count++;
        //                }
        //                else if (text2.Contains(text1[i]))
        //                {
        //                    contains = true;
        //                    index2 = i;
        //                }
        //                else if (text1[i] == null)
        //                {
        //                    text2End = true;
        //                }
        //            }
        //        }
        //    }
        //    if(text1End == true)
        //    {
        //        while(text2End != true)
        //        {
        //            if (text2[index2] != null)
        //            {
        //                fullText[count] = text2[index2];
        //                index2++;
        //                count++;
        //            }
        //            else if(text2[index2] == null)
        //            {
        //                text2End = true;
        //            }
        //        }
        //    }
        //    if(text2End == true)
        //    {
        //        while(text1End != true)
        //        {
        //            if(text1[index1] != null)
        //            {
        //                fullText[count] = text1[index1];
        //                index1++;
        //                count++;
        //            }
        //            else if(text2[index1] == null)
        //            {
        //                text1End = true;
        //            }
        //        }
        //    }
        //    return fullText;
        //}
        /// <summary>
        /// suraso duomenis is fullText masyvo i faila "ManoKnyga.txt"
        /// </summary>
        /// <param name="results"></param>
        /// <param name="fullText"></param>
        static void WriteMyBookIntoFile(string results, List<string> myBook)
        {
            using (StreamWriter writer = new StreamWriter(results))
            {
                writer.WriteLine("Tekstas sudarytas is abieju tekstu, pagal reikalavimus: \n");
                for (int i = 0; i < myBook.Count; i++)
                {
                    writer.Write("{0} ", myBook[i]);
                }
            }
        }
        static string[] GetText(string file, char[] punctuation)
        {
            string text = File.ReadAllText(file);
            string[] textWithoutSpaces = text.Split(' ');
            return textWithoutSpaces;
        }
        static string Spring(string word, char[] punctuation)
        {
            bool g = false; 
            if (word.Contains('\n'))
            {
                g = true;
            }
            string[] wordz = word.Split(punctuation, StringSplitOptions.RemoveEmptyEntries);
            if (g == true)
            {
                return wordz[1];
            }
            else
                return wordz[0];
        }
        static List<string> GetMyBook(string[] text1, string[] text2, char[] punctuation)
        {
            List<string> myBook = new List<string>();
            string sTW = text2[0];
            bool file1End = false;
            bool file2End = false;
            int index1 = 0;
            int index2 = 0;
            while((file1End != true) && (file2End != true))
            {
                if (file1End == false)
                {
                    for (int i = index1; i < text1.Length; i++)
                    {
                        if (!text1[i].Contains(sTW))
                        {
                            myBook.Add(text1[i]);
                        }
                        else if (text1[i].Contains(sTW) && text1.Length - 1 > i)
                        {
                            sTW = text1[i + 1];
                            sTW = Spring(sTW, punctuation);
                            index1 = i + 1;
                            break;
                        }
                        if (text1.Length - 1 <= i)
                        {
                            file1End = true;
                            break;
                        }
                    }
                }
                if (file2End == false)
                {
                    for (int i = index2; i < text2.Length; i++)
                    {
                        if (!text2[i].Contains(sTW))
                        {
                            myBook.Add(text2[i]);
                        }
                        else if (text2[i].Contains(sTW) && text2.Length - 1 > i)
                        {
                            sTW = text2[i + 1];
                            sTW = Spring(sTW, punctuation);
                            index2 = i + 1;
                            break;
                        }
                        if (text2.Length - 1 <= i)
                        {
                            file2End = true;
                            break;
                        }
                    }
                }

            }
            return myBook;
        }
    }
}
