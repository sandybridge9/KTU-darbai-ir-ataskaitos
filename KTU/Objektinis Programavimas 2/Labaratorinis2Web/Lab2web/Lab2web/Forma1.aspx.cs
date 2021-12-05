using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
/// <summary>
/// Tadas Laurinaitis IFF-6/8
/// </summary>
namespace Lab2web
{
    public partial class Forma1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Main();
        }

        const int maxItaisuSk = 5;
        const string failas1 = @"..\..\U24a.txt";
        const string failas2 = @"..\..\U24b.txt";
        const string file = @"D:\Rezultatai.txt";

        static void Main()
        {

            Itaisas visiItaisai = skaitytiItaisuDuomenis(failas1);
            Pirkejas visiPirkejai = skaitytiPirkejuDuomenis(failas2);
            int popItaisuKiek, vienosRusiesKiekis = 0;
            double suma1, suma2 = 0;
            string popItaisoPav = populiariausiasItaisas(visiItaisai, visiPirkejai, out popItaisuKiek, out suma1);
            string[] vienosRusiesPirkejai = tikVienosRusies("ranka", visiItaisai, visiPirkejai, out vienosRusiesKiekis, out suma2);
            Itaisas kitasRinkinys = KitasRinkinys(1, 1000, visiItaisai, visiPirkejai);
            Spausdinimas(file, popItaisoPav, popItaisuKiek, suma1, suma2, vienosRusiesPirkejai, vienosRusiesKiekis, kitasRinkinys);
        }
        /// <summary>
        /// perskaito Itaisu duomenis
        /// </summary>
        /// <param name="failas"></param>
        /// <returns></returns>
        static Itaisas skaitytiItaisuDuomenis(string failas)
        {
            Itaisas visiItaisai = new Itaisas();

            using (StreamReader reader = new StreamReader(@failas))
            {
                string line = reader.ReadLine();
                if (line != null)
                {
                    string[] values = line.Split(';');
                    visiItaisai.kodas = values[0];
                    visiItaisai.pavadinimas = values[1];
                    visiItaisai.kaina = int.Parse(values[2]);
                }
                else if (line == null)
                {
                    return null;
                }
                while (null != (line = reader.ReadLine()))
                {
                    string[] values = line.Split(';');
                    Itaisas itaisas = new Itaisas();
                    itaisas.kodas = values[0];
                    itaisas.pavadinimas = values[1];
                    itaisas.kaina = int.Parse(values[2]);

                    itaisas.kitas = visiItaisai;
                    visiItaisai = itaisas;
                }
            }
            return visiItaisai;
        }
        /// <summary>
        /// perskaito pirkeju duomenis
        /// </summary>
        /// <param name="failas"></param>
        /// <returns></returns>
        static Pirkejas skaitytiPirkejuDuomenis(string failas)
        {
            Pirkejas visiPirkejai = new Pirkejas();

            using (StreamReader reader = new StreamReader(@failas))
            {
                string line = reader.ReadLine();
                if (line != null)
                {
                    string[] values = line.Split(';');
                    visiPirkejai.pavarde = values[0];
                    visiPirkejai.vardas = values[1];
                    visiPirkejai.pirktasKodas = values[2];
                    visiPirkejai.itaisuKiekis = int.Parse(values[3]);
                }
                else if (line == null)
                {
                    return null;
                }
                while (null != (line = reader.ReadLine()))
                {
                    string[] values = line.Split(';');
                    Pirkejas pirkejas = new Pirkejas();
                    pirkejas.pavarde = values[0];
                    pirkejas.vardas = values[1];
                    pirkejas.pirktasKodas = values[2];
                    pirkejas.itaisuKiekis = int.Parse(values[3]);

                    pirkejas.kitas = visiPirkejai;
                    visiPirkejai = pirkejas;
                }
            }
            return visiPirkejai;
        }
        /// <summary>
        /// suranda populiariausio itaiso pavadinima, taip pat grazina ju skaiciu ir kainu suma
        /// </summary>
        /// <param name="visiItaisai"></param>
        /// <param name="visiPirkejai"></param>
        /// <param name="ind2"></param>
        /// <param name="suma"></param>
        /// <returns></returns>
        static string populiariausiasItaisas(Itaisas visiItaisai, Pirkejas visiPirkejai, out int ind2, out double suma)
        {
            int ind1 = 0;
            ind2 = 0;
            suma = 0;
            string popItaisPav = "";
            Pirkejas visiPirkejai2 = new Pirkejas();
            Itaisas visiItaisai2 = new Itaisas();
            visiItaisai2 = visiItaisai;
            while (visiItaisai != null)
            {
                visiPirkejai2 = visiPirkejai;
                ind1 = 0;
                while (visiPirkejai2 != null)
                {
                    if (visiItaisai.kodas == visiPirkejai2.pirktasKodas)
                    {
                        ind1 += visiPirkejai2.itaisuKiekis;
                    }
                    visiPirkejai2 = visiPirkejai2.kitas;
                }
                if (ind1 >= ind2)
                {
                    ind2 = ind1;
                    popItaisPav = visiItaisai.pavadinimas;
                }
                visiItaisai = visiItaisai.kitas;
            }

            while (visiItaisai2 != null)
            {
                if (popItaisPav == visiItaisai2.pavadinimas)
                {
                    suma = ind2 * visiItaisai2.kaina;
                }
                visiItaisai2 = visiItaisai2.kitas;
            }
            return popItaisPav;
        }
        /// <summary>
        /// suranda tik vienos rusies itaiso pirkejus, ju kieki, pinigu suma
        /// </summary>
        /// <param name="itaisoPavadinimas"></param>
        /// <param name="visiItaisai"></param>
        /// <param name="visiPirkejai"></param>
        /// <param name="kiekis"></param>
        /// <param name="suma"></param>
        /// <returns></returns>
        static string[] tikVienosRusies(string itaisoPavadinimas, Itaisas visiItaisai, Pirkejas visiPirkejai, out int kiekis, out double suma)
        {
            string kodas = "";
            double kaina = 0;
            suma = 0;
            kiekis = 0;
            int count = 0;
            string[] vardai = new string[maxItaisuSk];
            while (visiItaisai != null)
            {
                if (itaisoPavadinimas == visiItaisai.pavadinimas)
                {
                    kodas = visiItaisai.kodas;
                    kaina = visiItaisai.kaina;
                }
                visiItaisai = visiItaisai.kitas;
            }
            if (kodas == "" && kaina == 0)
            {
                Console.WriteLine("Itaiso tokiu pavadinimu nera.");
            }
            while (visiPirkejai != null)
            {
                if (visiPirkejai.pirktasKodas == kodas)
                {
                    vardai[count] = visiPirkejai.vardas + " " + visiPirkejai.pavarde;
                    kiekis += visiPirkejai.itaisuKiekis;
                    suma += visiPirkejai.itaisuKiekis * kaina;
                    count++;
                }
                visiPirkejai = visiPirkejai.kitas;
            }
            return vardai;
        }
        /// <summary>
        /// atrenka itaisus pagal uzduoties nurodymus
        /// </summary>
        /// <param name="n"></param>
        /// <param name="k"></param>
        /// <param name="visiItaisai"></param>
        /// <param name="visiPirkejai"></param>
        /// <returns></returns>
        static Itaisas KitasRinkinys(int n, double k, Itaisas visiItaisai, Pirkejas visiPirkejai)
        {
            int sk = 0;
            Itaisas naujasRinkinys = new Itaisas();
            Pirkejas visiPirkejai2 = new Pirkejas();
            while (visiItaisai != null)
            {
                if (visiItaisai.kaina <= k)
                {
                    sk = 0;
                    visiPirkejai2 = visiPirkejai;
                    while (visiPirkejai2 != null)
                    {
                        if (visiItaisai.kodas == visiPirkejai2.pirktasKodas)
                        {
                            sk = sk + visiPirkejai2.itaisuKiekis;
                        }
                        visiPirkejai2 = visiPirkejai2.kitas;
                    }
                    if (sk >= n)
                    {
                        Itaisas naujesnis = new Itaisas();
                        naujesnis.kodas = visiItaisai.kodas;
                        naujesnis.pavadinimas = visiItaisai.pavadinimas;
                        naujesnis.kaina = visiItaisai.kaina;

                        naujesnis.kitas = naujasRinkinys;
                        naujasRinkinys = naujesnis;

                    }
                }
                visiItaisai = visiItaisai.kitas;
            }
            return naujasRinkinys;
        }
        /// <summary>
        /// spausdina rezultatus faile
        /// </summary>
        /// <param name="file"></param>
        /// <param name="popItPav"></param>
        /// <param name="popItKiek"></param>
        /// <param name="suma1"></param>
        /// <param name="suma2"></param>
        /// <param name="tikVienosRusies"></param>
        /// <param name="vienosRusiesKiekis"></param>
        /// <param name="kitasRinkinys"></param>
        static void Spausdinimas(string file, string popItPav, int popItKiek, double suma1, double suma2, string[] tikVienosRusies, int vienosRusiesKiekis, Itaisas kitasRinkinys)
        {
            using (StreamWriter writer = new StreamWriter(@file))
            {
                writer.WriteLine("Populiariausio prietaiso pavadinimas, jo pardavimo skaičius ir kaina: pavadinimas - {0}, skaicius - {1}, kaina - {2}euro.", popItPav, popItKiek, suma1);
                writer.WriteLine("Vienos rusies pirkeju sarasas, nupirktu itaisu skaicius ir uz juos sumoketu pinigu suma: ");
                for(int i = 0; i < tikVienosRusies.Length-1; i++)
                {
                    writer.WriteLine("|{0, 15}|", tikVienosRusies[i]);
                }
                writer.WriteLine("Itaisu skaicius: {0} Sumoketa suma: {1}euro.", vienosRusiesKiekis, suma2);
                while (kitasRinkinys != null)
                {
                    if (kitasRinkinys.pavadinimas != "")
                    {
                        writer.Write("|{0, 4}", kitasRinkinys.pavadinimas);
                        kitasRinkinys = kitasRinkinys.kitas;
                    }
                }
            }
        }
    }
}