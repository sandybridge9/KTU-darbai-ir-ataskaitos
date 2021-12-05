using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Lab2web
{
    public partial class Forma1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile && FileUpload2.HasFile)
            {
                Main();
            }
            else
            {
                Label1.Text = " Pasirinkite duomenų failus";
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Visible = true;
            }
        }

        const int maxItaisuSk = 5;

        public void Main()
        {
            //skaitymas
            Sarasas<Itaisas> visiItaisai = skaitytiItaisuDuomenis();
            Sarasas<Pirkejas> visiPirkejai = skaitytiPirkejuDuomenis();

            //populiariausi itaisai
            int popItaisuKiek, vienosRusiesKiekis = 0;
            double suma1, suma2 = 0;
            string popItaisoPav = populiariausiasItaisas(visiItaisai, visiPirkejai, out popItaisuKiek, out suma1);

            //vienos rusies itaisu pirkejai
            string[] vienosRusiesPirkejai = tikVienosRusies("ranka", visiItaisai, visiPirkejai, out vienosRusiesKiekis, out suma2);

            //atrinkti i kita rinkini itaiasai
            Sarasas<Itaisas> atrinkti = KitasRinkinys(50, 16, visiItaisai, visiPirkejai);

            //spausdinimas
            Spausdinimas(popItaisoPav, popItaisuKiek, suma1, suma2, vienosRusiesPirkejai, vienosRusiesKiekis, atrinkti, visiItaisai, visiPirkejai);
        }

        public Sarasas<Itaisas> skaitytiItaisuDuomenis()
        {
            Sarasas<Itaisas> visiItaisai = new Sarasas<Itaisas>();

            using (StreamReader reader = new StreamReader(FileUpload1.FileContent))
            {
                string line = reader.ReadLine();
                if (line != null)
                {
                    string[] values = line.Split(';');
                    string kodas = values[0];
                    string pavadinimas = values[1];
                    int kaina = int.Parse(values[2]);
                    Itaisas temp = new Itaisas(kodas, pavadinimas, kaina);
                    visiItaisai.Add(temp);
                }
                else if (line == null)
                {
                    return null;
                }
                while (null != (line = reader.ReadLine()))
                {
                    string[] values = line.Split(';');
                    string kodas = values[0];
                    string pavadinimas = values[1];
                    int kaina = int.Parse(values[2]);
                    Itaisas temp = new Itaisas(kodas, pavadinimas, kaina);
                    visiItaisai.Add(temp);
                }
            }
            return visiItaisai;
        }
       
        public Sarasas<Pirkejas> skaitytiPirkejuDuomenis()
        {
            Sarasas<Pirkejas> visiPirkejai = new Sarasas<Pirkejas>();

            using (StreamReader reader = new StreamReader(FileUpload2.FileContent))
            {
                string line = reader.ReadLine();
                if (line != null)
                {
                    string[] values = line.Split(';');
                    string pavarde = values[0];
                    string vardas = values[1];
                    string kodas = values[2];
                    int itaisuKiekis = int.Parse(values[3]);
                    Pirkejas temp = new Pirkejas(pavarde, vardas, kodas, itaisuKiekis);
                    visiPirkejai.Add(temp);
                }
                else if (line == null)
                {
                    return null;
                }
                while (null != (line = reader.ReadLine()))
                {
                    string[] values = line.Split(';');
                    string pavarde = values[0];
                    string vardas = values[1];
                    string kodas = values[2];
                    int itaisuKiekis = int.Parse(values[3]);
                    Pirkejas temp = new Pirkejas(pavarde, vardas, kodas, itaisuKiekis);
                    visiPirkejai.Add(temp);
                }
            }
            return visiPirkejai;
        }
        
        public string populiariausiasItaisas(Sarasas<Itaisas> visiItaisai, Sarasas<Pirkejas> visiPirkejai, out int ind2, out double suma)
        {
            int ind1 = 0;
            ind2 = 0;
            suma = 0;
            string popItaisPav = "";
            Sarasas<Itaisas> visiItaisai2 = visiItaisai;
            for (int i = 0; i < visiItaisai.Count; i++)
            {
                ind1 = 0;
                for (int j = 0; j < visiPirkejai.Count; j++)
                {
                    if (visiItaisai.pradzia.informacija.kodas == visiPirkejai.pradzia.informacija.pirktasKodas)
                    {
                        ind1 += visiPirkejai.pradzia.informacija.itaisuKiekis;
                    }
                    visiPirkejai.pradzia = visiPirkejai.pradzia.kitas;
                }
                if (ind1 >= ind2)
                {
                    ind2 = ind1;
                    popItaisPav = visiItaisai.pradzia.informacija.pavadinimas;
                }
                visiItaisai.pradzia = visiItaisai.pradzia.kitas;
            }
            for (int i = 0; i < visiItaisai2.Count; i++)
            {
                if (popItaisPav == visiItaisai2.pradzia.informacija.pavadinimas)
                {
                    suma = ind2 * visiItaisai2.pradzia.informacija.kaina;
                }
                visiItaisai2.pradzia = visiItaisai2.pradzia.kitas;
            }
            return popItaisPav;
        }
        
        public string[] tikVienosRusies(string itaisoPavadinimas, Sarasas<Itaisas> visiItaisai, Sarasas<Pirkejas> visiPirkejai, out int kiekis, out double suma)
        {
            string kodas = "";
            double kaina = 0;
            suma = 0;
            kiekis = 0;
            int count = 0;
            int c = 0;
            for (int i = 0; i < visiItaisai.Count; i++)
            {
                if (itaisoPavadinimas == visiItaisai.pradzia.informacija.pavadinimas)
                {
                    kodas = visiItaisai.pradzia.informacija.kodas;
                    kaina = visiItaisai.pradzia.informacija.kaina;
                }
                visiItaisai.pradzia = visiItaisai.pradzia.kitas;
            }
            if (kodas == "" && kaina == 0)
            {
                Console.WriteLine("Itaiso tokiu pavadinimu nera.");
            }
            for (int i = 0; i < visiPirkejai.Count; i++)
            {
                if (visiPirkejai.pradzia.informacija.pirktasKodas == kodas)
                {
                    c++;
                }
                visiPirkejai.pradzia = visiPirkejai.pradzia.kitas;
            }
            string[] vardai = new string[c];
            for (int i = 0; i < visiPirkejai.Count; i++)
            {
                if (visiPirkejai.pradzia.informacija.pirktasKodas == kodas)
                {
                    vardai[count] = visiPirkejai.pradzia.informacija.vardas + " " + visiPirkejai.pradzia.informacija.pavarde;
                    kiekis += visiPirkejai.pradzia.informacija.itaisuKiekis;
                    suma += visiPirkejai.pradzia.informacija.itaisuKiekis * kaina;
                    count++;
                }
                visiPirkejai.pradzia = visiPirkejai.pradzia.kitas;
            }
            return vardai;
        }

        public Sarasas<Itaisas> KitasRinkinys(int n, double k, Sarasas<Itaisas> visiItaisai, Sarasas<Pirkejas> visiPirkejai)
        {
            int sk = 0;
            Sarasas<Itaisas> naujasRinkinys = new Sarasas<Itaisas>();
            Sarasas<Pirkejas> visiPirkejai2 = new Sarasas<Pirkejas>();
            for (int i = 0; i < visiItaisai.Count; i++)
            {
                if (visiItaisai.pradzia.informacija.kaina <= k)
                {
                    sk = 0;
                    visiPirkejai2 = visiPirkejai;
                    for (int j = 0; j < visiPirkejai2.Count; j++)
                    {
                        if (visiItaisai.pradzia.informacija.kodas == visiPirkejai2.pradzia.informacija.pirktasKodas)
                        {
                            sk = sk + visiPirkejai2.pradzia.informacija.itaisuKiekis;
                        }
                        visiPirkejai2.pradzia = visiPirkejai2.pradzia.kitas;
                    }
                    if (sk >= n)
                    {
                        Itaisas naujesnis = new Itaisas();
                        naujesnis.kodas = visiItaisai.pradzia.informacija.kodas;
                        naujesnis.pavadinimas = visiItaisai.pradzia.informacija.pavadinimas;
                        naujesnis.kaina = visiItaisai.pradzia.informacija.kaina;

                        naujasRinkinys.Add(naujesnis);
                    }
                }
                visiItaisai.pradzia = visiItaisai.pradzia.kitas;
            }
            return naujasRinkinys;
        }

        public void Spausdinimas(string popItPav, int popItKiek, double suma1, double suma2, string[] tikVienosRusies, int vienosRusiesKiekis, Sarasas<Itaisas> kitasRinkinys, Sarasas<Itaisas> itDuom, Sarasas<Pirkejas> pirkDuom)
        {
            using (StreamWriter writer = new StreamWriter(System.Web.HttpContext.Current.Server.MapPath("App_Data/Rezultatai.txt")))
            {
                writer.WriteLine("                                                                      Rezultatai: ");
                writer.WriteLine("--------------------------------------------------------------------------------------------------------------------------------------------------------");
                writer.WriteLine("Populiariausio prietaiso pavadinimas, jo pardavimo skaičius ir kaina: pavadinimas - {0}, skaicius - {1}, kaina - {2}euro.", popItPav, popItKiek, suma1);
                writer.WriteLine("Vienos rusies pirkeju sarasas, nupirktu itaisu skaicius ir uz juos sumoketu pinigu suma: ");
                writer.WriteLine("");
                writer.WriteLine("     Vardas,   Pavarde");
                writer.WriteLine("-----------------------");
                for (int i = 0; i < tikVienosRusies.Length - 1; i++)
                {
                    if(tikVienosRusies[i] != "")
                    {
                        writer.WriteLine("{0}. {1, -12}", i+1, tikVienosRusies[i]);
                    }
                }
                writer.WriteLine(" ");
                writer.WriteLine("Itaisu skaicius: {0} Sumoketa suma: {1}euro.", vienosRusiesKiekis, suma2);
                writer.WriteLine("-------------------------------------------");
                writer.WriteLine(" ");
                writer.WriteLine("I kita rinkini atrinkti itaisai: ");
                writer.WriteLine(" ");
                writer.WriteLine("Nr.  Pav.  Kodas  Kaina");
                writer.WriteLine("------------------------");
                for (int i = 0; i < kitasRinkinys.Count; i++)
                {
                    if (kitasRinkinys.pradzia.informacija.pavadinimas != "")
                    {
                        writer.Write("{0, -2}. {1, -6}, {2, -5}, {3, -5}", i + 1, kitasRinkinys.pradzia.informacija.pavadinimas, kitasRinkinys.pradzia.informacija.kodas, kitasRinkinys.pradzia.informacija.kaina);
                        kitasRinkinys.pradzia = kitasRinkinys.pradzia.kitas;
                    }
                }
                writer.WriteLine("");
                writer.WriteLine("                                                                     Pradiniai duomenys: ");
                writer.WriteLine("--------------------------------------------------------------------------------------------------------------------------------------------------------");
                writer.WriteLine("U24a.txt: ");
                writer.WriteLine("");
                for (int i = 0; i < itDuom.Count; i++)
                {
                    writer.WriteLine("|{0, -6}| {1, -6} | {2, -6} |", itDuom.pradzia.informacija.kodas, itDuom.pradzia.informacija.pavadinimas, itDuom.pradzia.informacija.kaina);
                    itDuom.pradzia = itDuom.pradzia.kitas;
                }
                writer.WriteLine("--------------------------------------------------------------------------------------------------------------------------------------------------------");
                writer.WriteLine("U24b.txt: ");
                writer.WriteLine("");
                for (int i = 0; i < pirkDuom.Count; i++)
                {
                    writer.WriteLine("|{0, -12}| {1, -12} | {2, -6} | {2, -2} |", pirkDuom.pradzia.informacija.vardas, pirkDuom.pradzia.informacija.pavarde, pirkDuom.pradzia.informacija.pirktasKodas, pirkDuom.pradzia.informacija.itaisuKiekis);
                    pirkDuom.pradzia = pirkDuom.pradzia.kitas;
                }
            }
        }
    }
}