using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;

namespace Lab4Web
{
    public partial class Forma1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Container<Subscriber> subscribers = new Container<Subscriber>();
            Container<Print> allPrints = new Container<Print>();
            Container<Publisher> publishers = new Container<Publisher>();

            ReadSubscriberData(subscribers);
            ReadPrintData(allPrints);
            GetPublishers(allPrints, publishers);
            Profits(12, subscribers, allPrints, publishers);

            publishers.list = publishers.list.OrderByDescending(o => o.profit).ThenBy(o => o.name).ToList();

            ShowData(publishers);
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Container<Subscriber> subscribers = new Container<Subscriber>();
            Container<Print> allPrints = new Container<Print>();
            Container<Publisher> publishers = new Container<Publisher>();

            ReadSubscriberData(subscribers);
            ReadPrintData(allPrints);
            GetPublishers(allPrints, publishers);
            Profits(12, subscribers, allPrints, publishers);

            publishers.list = publishers.list.OrderByDescending(o => o.profit).ToList();

            PrintToFile(subscribers, allPrints, publishers);
        }
        void Main()
        {
        }
        /// <summary>
        /// Perskaito prenumeratoiu duomenis
        /// </summary>
        /// <param name="subs">Prenumeratoriu konteineris</param>
        public void ReadSubscriberData(Container<Subscriber> subs)
        {
            string[] paths = Directory.GetFiles(System.Web.HttpContext.Current.Server.MapPath(@"App_Data/Data/Subscribers"));
            try
            {
                foreach (string path in paths)
                {
                    using (StreamReader reader = new StreamReader(path))
                    {
                        string line = "";
                        while (null != (line = reader.ReadLine()))
                        {
                            string[] values = line.Split(';');
                            string surname = values[0];
                            string adress = values[1];
                            int startingMonth = int.Parse(values[2]);
                            int duration = int.Parse(values[3]);
                            string code = values[4];
                            int quantity = int.Parse(values[5]);

                            Subscriber temp = new Subscriber(surname, adress, startingMonth, duration, code, quantity);
                            subs.Add(temp);
                        }
                    }
                }
            }
            catch
            {
                throw new Exception("There are no files to read (1). ");
            }
        }
        /// <summary>
        /// Perskaito leidiniu duomenis
        /// </summary>
        /// <param name="prints">leidiniu konteineris</param>
        public void ReadPrintData(Container<Print> prints)
        {
            string[] paths = Directory.GetFiles(System.Web.HttpContext.Current.Server.MapPath(@"App_Data/Data/Prints"));
            try
            {
                foreach (string path in paths)
                {
                    using (StreamReader reader = new StreamReader(@path))
                    {
                        string line = "";
                        while (null != (line = reader.ReadLine()))
                        {
                            string[] values = line.Split(';');
                            string code = values[0];
                            string title = values[1];
                            string publisher = values[2];
                            double price = double.Parse(values[3]);

                            Print temp = new Print(code, title, publisher, price);
                            prints.Add(temp);
                        }
                    }
                }
            }
            catch
            {
                throw new Exception("There are no files to read (2). ");
            }
        }
        /// <summary>
        /// Suranda visus leidejus is leidiniu konteinerio bei sudeda juos i atskira konteineri
        /// </summary>
        /// <param name="prints">leidiniu konteineris</param>
        /// <param name="pubs">leideju konteineris</param>
        public void GetPublishers(Container<Print> prints, Container<Publisher> pubs)
        {
            try
            {
                foreach (Print p in prints.list)
                {
                    Publisher pub1 = new Publisher(p.publisher, 0, p.title);
                    pubs.Add(pub1);
                }
            }
            catch(NullReferenceException ex)
            {
                throw new Exception("Exception message: " +ex.Message);
            }
        }
        /// <summary>
        /// Suskaiciuoja leideju pelnus
        /// </summary>
        /// <param name="month">Ranka ivedamas menuo</param>
        /// <param name="subs">Prenumeratoriu konteineris</param>
        /// <param name="prints">Leidiniu konteineris</param>
        /// <param name="pubs">Leideju konteineris</param>
        public void Profits(int month, Container<Subscriber> subs, Container<Print> prints, Container<Publisher> pubs)
        {
            foreach (Publisher pub in pubs.list)
            {
                foreach (Print p in prints.list)
                {
                    foreach (Subscriber s in subs.list)
                    {
                        if (pub.name == p.publisher)
                        {
                            if (p.code == s.code)
                            {
                                if ((s.startingMonth + s.duration) / 12 >= month / 12)
                                {
                                    pub.profit += (s.quantity * p.price);
                                }
                            }
                        }
                    }
                }
            }
        }
        /// <summary>
        /// Spausdina duomenis ir rezultatus lentelemis faile
        /// </summary>
        /// <param name="subscribers">Prenumeratoriu Konteineris</param>
        /// <param name="allPrints">Leidiniu Konteineris</param>
        /// <param name="publishers">Leideju konteineris</param>
        public void PrintToFile(Container<Subscriber> subscribers, Container<Print> allPrints, Container<Publisher> publishers)
        {
            using (StreamWriter writer = new StreamWriter(System.Web.HttpContext.Current.Server.MapPath("App_Data/Rezultatai.txt")))
            {
                writer.WriteLine("Pradiniai duomenys: ");
                writer.WriteLine(" ");
                writer.WriteLine("| {0, -12} | {1, -12} | {2, -12} | {3, -14} | {4, -14} | {5, -14} | ", "Pavarde", "Adresas", "Prad. Men.", "Trukme", "Kodas", "Kiekis");
                writer.WriteLine("-------------------------------------------------------------------------------------------------");
                foreach (Subscriber s in subscribers.list)
                {
                    writer.WriteLine("| {0, -12} | {1, -12} | {2, -12} | {3, -14} | {4, -14} | {5, -14} | ", s.surname, s.adress, s.startingMonth, s.duration, s.code, s.quantity);
                }
                writer.WriteLine(" ");
                writer.WriteLine("| {0, -12} | {1, -12} | {2, -12} | {3, -14} | ", "Kodas", "Pavadinimas", "Leidejas", "Kaina");
                writer.WriteLine("---------------------------------------------------------------");
                foreach (Print p in allPrints.list)
                {
                    writer.WriteLine("| {0, -12} | {1, -12} | {2, -12} | {3, -14} | ", p.code, p.title, p.publisher, p.price);
                }
                writer.WriteLine(" ");
                writer.WriteLine("Surikiuoti rezultatai: ");
                writer.WriteLine(" ");
                writer.WriteLine("| {0, -12} | {1, -12} | {2, -12} |", "Pelnas", "Leidejas", "Leidinys");
                writer.WriteLine("----------------------------------------------");
                foreach (Publisher pub in publishers.list)
                {
                    writer.WriteLine("| {0, -12} | {1, -12} | {2, -12} | ", pub.profit, pub.name, pub.title);
                }
            }
        }
        /// <summary>
        /// Parodo rezultatus lenteles pavidalu grafineje sasajoje
        /// </summary>
        /// <param name="publishers">Leideju konteineris</param>
        public void ShowData(Container<Publisher> publishers)
        {
            TableCell profit1 = new TableCell();
            TableCell name1 = new TableCell();
            TableCell title1 = new TableCell();
            TableRow infRow = new TableRow();
            profit1.Text = "Profit";
            name1.Text = "Name";
            title1.Text = "Title";
            infRow.Cells.Add(profit1);
            infRow.Cells.Add(name1);
            infRow.Cells.Add(title1);
            Table1.Rows.Add(infRow);
            foreach (Publisher pub in publishers.list)
            {
                TableCell profit = new TableCell();
                TableCell name = new TableCell();
                TableCell title = new TableCell();
                profit.Text = "" + pub.profit;
                name.Text = "" + pub.name;
                title.Text = "" + pub.title;

                TableRow row = new TableRow();
                row.Cells.Add(profit);
                row.Cells.Add(name);
                row.Cells.Add(title);
                Table1.Rows.Add(row);
            }
        }
    }
}