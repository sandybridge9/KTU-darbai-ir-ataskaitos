using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace DVD3
{
    class Program
    {
        const int NmbOfBranches = 3;
        const int maxPlayers = 50;

        static void Main(string[] args)
        {
            string[] clubs = new string[maxPlayers];
            Branch[] branches = new Branch[NmbOfBranches];
            int branchCount = 0;

            string[] filePath = Directory.GetFiles(Directory.GetCurrentDirectory(), "*.csv");
            foreach (string file in filePath)
            {
                branchCount = Read(file, branches, branchCount);
            }

            MemberContainer partList = PartisipatingList(branches);
            PrintParticipants(partList);
            MemberContainer forward = Forwards(branches, "puolejas");
            PrintForwards(forward);
            MemberContainer invitedPlayers = Invited(branches);
            PrintInvitedPlayers(@"..\..\Rinktinė.csv", invitedPlayers);
            printCampPart(branches);
        }
        /// <summary>
        /// gauna branches masyvo elementa kuris atitinka start ir end datas
        /// </summary>
        /// <param name="branches">masyvas saugantis zaideju ir personalo konteinerius</param>
        /// <param name="start">stovyklos pradzios data</param>
        /// <param name="end">stovyklos pabaigos data</param>
        /// <returns></returns>
        private static Branch GetBranchByYear(Branch[] branches, DateTime start, DateTime end)
        {
            for (int i = 0; i < NmbOfBranches; i++)
            {
                if (branches[i].start == start && branches[i].end == end)
                {
                    return branches[i];
                }
            }
            return null;
        }
        /// <summary>
        /// Nuskaitymo funkcija
        /// </summary>
        /// <param name="file">duomenu failo pavadinimas</param>
        /// <param name="branches">masyvas saugantis zaideju ir personalo konteinerius</param>
        /// <param name="branchCount">branches amsyvo skaitliukas</param>
        /// <returns>grazina branshes skaitliuko reiksme</returns>
        private static int Read(string file, Branch[] branches, int branchCount)
        {
            DateTime start = new DateTime();
            using (StreamReader reader = new StreamReader(file))
            {
                string line = null;
                line = reader.ReadLine();
                if (line != null)
                {
                    start = DateTime.Parse(line);
                }
                line = reader.ReadLine();
                DateTime end = DateTime.Parse(line);
                branches[branchCount++] = new Branch(start, end);
                Branch branch = GetBranchByYear(branches, start, end);
                while ((line = reader.ReadLine()) != null)
                {
                    string[] values = line.Split(' ');
                    char type = Convert.ToChar(line[0]);
                    string name = values[1];
                    string surname = values[2];
                    DateTime birth = DateTime.Parse(values[3]);

                    if (type == 'K')
                    {
                        double height = double.Parse(values[4]);
                        string position = values[5];
                        string club = values[6];
                        bool invitation = bool.Parse(values[7]);
                        bool indication = bool.Parse(values[8]);
                        Players player = new Players(name, surname, birth, height, position, club, invitation, indication);
                        branch.players.AddMember(player);
                    }
                    else
                    {
                        string duty = values[4];
                        Personalas staff = new Personalas(name, surname, birth, duty);
                        branch.staff.AddMember(staff);
                    }
                }
            }
            return branchCount;
        }
        /// <summary>
        /// sudro dalyviu sarasa
        /// </summary>
        /// <param name="branches">masyvas saugantis zaideju ir personalo konteinerius</param>
        /// <returns>dalyviu konteineri</returns>
        static MemberContainer PartisipatingList(Branch[] branches)
        {
            MemberContainer partList = new MemberContainer(maxPlayers);
            for (int i = 0; i < branches[0].players.Count; i++)
            {
                for (int j = 0; j < branches[1].players.Count; j++)
                {
                    if (branches[0].players.GetMember(i).name == branches[1].players.GetMember(j).name)
                    {
                        for (int k = 0; k < branches[2].players.Count; k++)
                        {
                            if (branches[0].players.GetMember(i).name == branches[2].players.GetMember(k).name)
                            {
                                partList.AddMember(branches[0].players.GetMember(i));
                            }
                        }
                    }
                }
            }
            for (int i = 0; i < branches[0].staff.Count; i++)
            {
                for (int j = 0; j < branches[1].staff.Count; j++)
                {
                    if (branches[0].staff.GetMember(i).name == branches[1].staff.GetMember(j).name)
                    {
                        for (int k = 0; k < branches[2].staff.Count; k++)
                        {
                            if (branches[0].staff.GetMember(i).name == branches[2].staff.GetMember(k).name)
                            {
                                partList.AddMember(branches[0].staff.GetMember(i));
                            }
                        }
                    }
                }
            }
            return partList;
        }
        /// <summary>
        /// spausdina dalyviu sarasa
        /// </summary>
        /// <param name="partList">dalyviu konteineris</param>
        static void PrintParticipants(MemberContainer partList)
        {
            Console.WriteLine("Zaidejai dalyvave visose 3 stovyklose: ");
            for (int i = 0; i < partList.Count; i++)
            {
                Console.WriteLine("Nr. {0}: {1}", (i + 1), partList.GetMember(i).ToString());
            }
        }
        /// <summary>
        /// sudaro puoleju konteineri
        /// </summary>
        /// <param name="branches">masyvas saugantis zaideju ir personalo konteinerius</param>
        /// <param name="position">pozicija(puolejas)</param>
        /// <returns>puoleju konteineris</returns>
        static MemberContainer Forwards(Branch[] branches, string position)
        {
            MemberContainer forward = new MemberContainer(maxPlayers);
            for (int k = 0; k < 3; k++)
            {
                for (int i = 0; i < branches[k].players.Count; i++)
                {
                    Players player = branches[k].players.GetMember(i) as Players;
                    if (player.position == position)
                    {
                        if (!AlreadyHave(forward, branches[k].players.GetMember(i).name))
                            forward.AddMember(player);
                    }
                }
            }
            return forward;
        }
        /// <summary>
        /// tikrina ar puoleju konteineris jau turi tikrinama puoleja
        /// </summary>
        /// <param name="forward">puoleju konteineris</param>
        /// <param name="plName">tikrinamas puolejas</param>
        /// <returns>ar turi ar ne</returns>
        static bool AlreadyHave(MemberContainer forward, string plName)
        {
            for (int i = 0; i < forward.Count; i++)
            {
                if (forward.GetMember(i).name == plName)
                {
                    return true;
                }
            }
            return false;
        }
        /// <summary>
        /// spausdina puolejus
        /// </summary>
        /// <param name="forward">puoleju konteineris</param>
        static void PrintForwards(MemberContainer forward)
        {
            Console.WriteLine("Puoleju sarasas: ");
            for (int i = 0; i < forward.Count; i++)
            {
                Players player = forward.GetMember(i) as Players;
                Console.WriteLine("Nr. {0}: {1, -10} {2, -10} {3, -5}", (i + 1), forward.GetMember(i).name,
                    forward.GetMember(i).surname, player.height);
            }
        }
        /// <summary>
        /// sudaro pakviestuju konteineri
        /// </summary>
        /// <param name="branches">masyvas saugantis zaideju ir personalo konteinerius</param>
        /// <returns>pakviestuju konteineris</returns>
        static MemberContainer Invited(Branch[] branches)
        {
            MemberContainer invitedPlayers = new MemberContainer(maxPlayers);
            for (int k = 0; k < 3; k++)
            {
                for (int i = 0; i < branches[k].players.Count; i++)
                {
                    Players player = branches[k].players.GetMember(i) as Players;
                    if (player.invitation == true)
                    {
                        if (!AlreadyHave(invitedPlayers, branches[k].players.GetMember(i).name))
                            invitedPlayers.AddMember(player);
                    }
                }
            }
            return invitedPlayers;
        }
        /// <summary>
        /// spausdina pakviestuosius
        /// </summary>
        /// <param name="file">failo i kuri spausdinti pavadinimas</param>
        /// <param name="invited">pakviestuju konteineris</param>
        static void PrintInvitedPlayers(string file, MemberContainer invited)
        {
            using (StreamWriter writer = new StreamWriter(file))
            {
                for (int i = 0; i < invited.Count; i++)
                {
                    writer.WriteLine("{0}", invited.GetMember(i).ToString());
                }
            }
        }
        /// <summary>
        /// sudaro stovykloje dalyvavusiu konteineri
        /// </summary>
        /// <param name="branch">masyvas saugantis zaideju ir personalo konteinerius</param>
        /// <returns>pakviestuju konteineris</returns>
        static MemberContainer makeCmapPart(Branch branch)
        {
            MemberContainer campPart = new MemberContainer(maxPlayers);
            for (int i = 0; i < branch.players.Count; i++)
            {
                Players player = branch.players.GetMember(i) as Players;
                campPart.AddMember(player);
            }
            for (int j = 0; j < branch.staff.Count; j++)
            {
                Personalas staff = branch.staff.GetMember(j) as Personalas;
                campPart.AddMember(staff);
            }
            campPart = sortPart(campPart);
            return campPart;
        }
        /// <summary>
        /// rikiuoja stovykloje dalyvavusiu sarasa
        /// </summary>
        /// <param name="campPart">stovyklos dalyviu konteineris</param>
        /// <returns>isrikiotas stovyklos dalyviu sarasas</returns>
        static MemberContainer sortPart(MemberContainer campPart)
        {

            for (int i = 0; i < campPart.Count; i++)
            {
                for (int j = 1; j < campPart.Count; j++)
                {
                    if (campPart.GetMember(j - 1).birth > campPart.GetMember(j).birth)
                    {
                        DateTime a = campPart.GetMember(j - 1).birth;
                        campPart.GetMember(j - 1).birth = campPart.GetMember(j).birth;
                        campPart.GetMember(j).birth = a;
                    }
                }
            }
            return campPart;
        }
        /// <summary>
        /// spausdina stovyklos dalyvius
        /// </summary>
        /// <param name="branches">masyvas saugantis zaideju ir personalo konteinerius</param>
        static void printCampPart(Branch[] branches)
        {
            MemberContainer Campers = new MemberContainer(maxPlayers);
            for (int i = 0; i < NmbOfBranches; i++)
            {
                Console.WriteLine("{0} stovyklos sarasas:", (i + 1));
                Campers = makeCmapPart(branches[i]);
                for (int j = 0; j < Campers.Count; j++)
                {
                    Console.WriteLine("{0, -10}|{1, -10}|{2}", Campers.GetMember(j).name, Campers.GetMember(j).surname,
                            Campers.GetMember(j).birth);
                }
            }
        }
    }
}
