using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace U4WCG19
{
    class Program
    {
        const int maxNumberOfPlayers = 90;
        const int numberOfBranches = 3;

        static void Main(string[] args)
        {
            int indexB;
            int indexE;
            int indexB2;
            int indexE2;
            Branch[] branches = Branches();
            Read(branches);
            BestLoLPlayer(branches, out indexB, out indexE);
            Console.WriteLine("Geriausias LOL žaidėjas yra: {0} {1} iš {2} komandos", branches[indexB].AllPlayers.GetPlayer(indexE).name,
                branches[indexB].AllPlayers.GetPlayer(indexE).surname, branches[indexB].AllPlayers.GetPlayer(indexE).team);
            BestCSGOPlayer(branches, out indexB2, out indexE2);
            Console.WriteLine("Geriausias CSGO žaidėjas yra: {0} {1} iš {2} komandos.", branches[indexB2].AllPlayers.GetPlayer(indexE2).name,
                branches[indexB2].AllPlayers.GetPlayer(indexE2).surname, branches[indexB2].AllPlayers.GetPlayer(indexE2).team);
            FindAndPrintTeams(branches, @"..\..\Komandos.csv");

            string a = "abc";
            string b = "defg";
            Console.WriteLine("{0}", string.Compare(a, b));
            //Console.WriteLine(branches[1].AllPlayers.Count);
            //int index1;
            //int index2;
            //int index3;
            //int index4;
            //string[] teams = new string[maxNumberOfPlayers];
            //PlayersContainer Lolplayers = new PlayersContainer(maxNumberOfPlayers);
            //int teamCount = GetTeams(branches, teams);
            //PrintTeams(teams, teamCount, @"..\..\Komandos.csv");
            //BestLOLPlayer(branches, out index1, out index2);
            //LOLPlayers player = branches[index1].LOLplayers.GetPlayer(index2) as LOLPlayers;
            //Console.WriteLine("Geriausias Lol zaidejas yra: {0} {1} is {2} komandos", player.name, player.surname, player.team);
            //BestCSPlayer(branches, out index3, out index4);
            //CSGOPlayers players = branches[index3].CSGOplayers.GetPlayer(index4) as CSGOPlayers;
            //Console.WriteLine("Geriausias Lol zaidejas yra: {0} {1} is {2} komandos", players.name, players.surname, players.team);
            //PlayersContainer participants = AllParticipants(branches);
            //PrintSortedParticipants(participants, @"..\..\Visi.csv");
            



        }
        private static Branch[] Branches()
        {
            Branch[] branches = new Branch[numberOfBranches];
            for(int i = 0; i < numberOfBranches; i++)
            {
                branches[i] = new Branch(i + 1);
            }
            return branches;
        }
        private static Branch GetBranchByTour(Branch[] branches, int tour)
        {
            for (int i = 0; i < numberOfBranches; i++)
            {
                if (branches[i].tour == tour)
                {
                    return branches[i];
                }
            }
            return null;
        }
        private static void ReadPlayerData(string file, Branch[] branches)
        {
            int tour = 0;
            using (StreamReader reader = new StreamReader(@file))
            {
                string line = null;
                line = reader.ReadLine();
                if (line != null)
                {
                    tour = int.Parse(line);
                }
                Branch branch = GetBranchByTour(branches, tour);
                line = reader.ReadLine();
                string date = line;
                while ((line = reader.ReadLine()) != null)
                {
                    string[] values = line.Split(';');
                    string game = values[0];
                    if (game == "LOL")
                    {
                        //string position = values[4];
                        //string champion = values[5];
                        //int kills = int.Parse(values[6]);
                        //int deaths = int.Parse(values[7]);
                        //int assists = int.Parse(values[8]);
                        LOLPlayers LOLPlayer = new LOLPlayers();
                        LOLPlayer.SetData(line);
                        branch.AllPlayers.AddPlayer(LOLPlayer);
                        //Console.WriteLine(LOLPlayer.game);
                    }
                    else if (game == "CS")
                    {
                        //int kills = int.Parse(values[4]);
                        //int deaths = int.Parse(values[5]);
                        //string favouriteWeapon = values[6];
                        CSGOPlayers CSGOPlayer = new CSGOPlayers();
                        CSGOPlayer.SetData(line);
                        branch.AllPlayers.AddPlayer(CSGOPlayer);
                        //Console.WriteLine(CSGOPlayer.game);
                    }
                }
            }
        }
        private static void Read(Branch[] branches)
        {
            string[] filePath = Directory.GetFiles(Directory.GetCurrentDirectory(), "*.csv");
            foreach (string file in filePath)
            {
                ReadPlayerData(file, branches);
            }
        }
        private static void BestLoLPlayer(Branch[] branches, out int indexB, out int indexE)
        {
            int maxKDA = 0;
            indexB = 0;
            indexE = 0;
            for (int i = 0; i < branches.Length; i++)
            {
                for (int j = 0; j < branches[i].AllPlayers.Count; j++)
                {
                    LOLPlayers players = branches[i].AllPlayers.GetPlayer(j) as LOLPlayers;
                    if (branches[i].AllPlayers.GetPlayer(j).game == "LOL")
                    {
                        if(((players.kills + players.assists)/players.deaths) > maxKDA)
                        {
                            maxKDA = ((players.kills + players.assists) / players.deaths);
                            indexB = i;
                            indexE = j;
                        }
                    }
                }
            }
        }
        private static void BestCSGOPlayer(Branch[] branches, out int indexB2, out int indexE2)
        {
            int maxKDA = 0;
            indexB2 = 0;
            indexE2 = 0;
            for (int i = 0; i < branches.Length; i++)
            {
                for (int j = 0; j < branches[i].AllPlayers.Count; j++)
                {
                    CSGOPlayers players = branches[i].AllPlayers.GetPlayer(j) as CSGOPlayers;
                    if (branches[i].AllPlayers.GetPlayer(j).game == "CS")
                    {
                        if (players.kills / players.deaths > maxKDA)
                        {
                            maxKDA = players.kills / players.deaths;
                            indexB2 = i;
                            indexE2 = j;
                        }
                    }
                }
            }
        }
        private static void FindAndPrintTeams(Branch[] branches, string file)
        {
            using (StreamWriter writer = new StreamWriter(@file))
            {
                writer.WriteLine("Komandų sąrašas: ");
                for (int i = 0; i < branches.Length; i++)
                {
                    for (int j = 1; j < branches[i].AllPlayers.Count; j++)
                    {
                        if (branches[i].AllPlayers.GetPlayer(j).team != branches[i].AllPlayers.GetPlayer(j - 1).team)
                        {
                            writer.WriteLine("{0}", branches[i].AllPlayers.GetPlayer(j-1).team);
                            writer.WriteLine("{0}", branches[i].AllPlayers.GetPlayer(j).team);
                        }
                    }
                }
            }
        }
        //private static List<object> SortObjectList(Branch[] branches)
        //{
        //    List<object> allPlayers = new List<object>();
        //    int count = 0;
        //    for(int i = 0; i < branches.Length; i++)
        //    {
        //        for(int j = 0; j < branches[i].AllPlayers.Count; j++)
        //        {
        //            Players players = branches[i].AllPlayers.GetPlayer(j) as Players;
        //            allPlayers[count] = players;
        //        }
        //    }

        //}
        private static PlayersContainer allPlayers(Branch[] branches)
        {
            PlayersContainer allplayas = new PlayersContainer(maxNumberOfPlayers);
            for (int i = 0; i < branches.Length; i++)
            {
                for (int j = 0; j < branches[i].AllPlayers.Count; j++)
                {
                    allplayas.AddPlayer(branches[i].AllPlayers.GetPlayer(j));
                }
            }
            return allplayas;
        }


        static PlayersContainer Sort(PlayersContainer allplayers)
        {
            for (int i = 0; i < allplayers.Count; i++)
            {
                for (int j = 1; j < allplayers.Count - 1; j++)
                {
                    if (allplayers.GetPlayer(j - 1).surname[0] <= allplayers.GetPlayer(j).surname[0])
                    {
                        Players a = allplayers.GetPlayer(j - 1);
                        allplayers.GetPlayer(j - 1) = allplayers.GetPlayer(j);
                        allplayers.GetPlayer(j) = a;
                    }
                }
            }
            return allplayers;
        }




        //static int GetTeams(Branch[] branches, string[] teams)
        //{
        //    int teamCount = 1;
        //    bool same;
        //    teams[0] = branches[0].AllPlayers.GetPlayer(0).team;
        //    for (int i = 0; i < branches[0].AllPlayers.Count; i++)
        //    {
        //        same = false;
        //        for (int j = 0; j < teamCount; j++)
        //        {
        //            if (teams[j] == branches[0].AllPlayers.GetPlayer(i).team)
        //                same = true;
        //        }
        //        if (same == false)
        //        {
        //            teams[teamCount++] = branches[0].AllPlayers.GetPlayer(i).team;
        //        }
        //    }
        //    for (int i = 0; i < branches[1].AllPlayers.Count; i++)
        //    {
        //        same = false;
        //        for (int j = 0; j < teamCount; j++)
        //        {
        //            if (teams[j] == branches[1].AllPlayers.GetPlayer(i).team)
        //                same = true;
        //        }
        //        if (same == false)
        //        {
        //            teams[teamCount++] = branches[1].AllPlayers.GetPlayer(i).team;
        //        }
        //    }
        //    for (int i = 0; i < branches[2].AllPlayers.Count; i++)
        //    {
        //        same = false;
        //        for (int j = 0; j < teamCount; j++)
        //        {
        //            if (teams[j] == branches[2].AllPlayers.GetPlayer(i).team)
        //                same = true;
        //        }
        //        if (same == false)
        //        {
        //            teams[teamCount++] = branches[2].AllPlayers.GetPlayer(i).team;
        //        }
        //    }
        //    return teamCount;
        //}
        //static void PrintTeams(string[] teams, int teamCount, string file)
        //{
        //    using (StreamWriter writer = new StreamWriter(file))
        //    {
        //        for (int i = 0; i < teamCount; i++)
        //        {
        //            writer.WriteLine("{0}", teams[i]);
        //        }
        //    }
        //}
        ///// <summary>
        ///// Suranda geriausio LOL playerio indexa brances masyve ir indexa tarp LOL players klases objektu
        ///// </summary>
        ///// <param name="branches"></param>
        ///// <param name="index1"></param>
        ///// <param name="index2"></param>
        //static void BestLOLPlayer(Branch[] branches, out int index1, out int index2)
        //{
        //    int maxKDA = 0;
        //    index1 = 0;
        //    index2 = 0;
        //    for(int i = 0; i < numberOfBranches; i++)
        //    {
        //        for(int j = 0; j < branches[i].AllPlayers.Count; j++)
        //        {
        //            if(branches[])
        //            if(maxKDA < players.kills + players.assists)
        //            {
        //                maxKDA = players.kills + players.assists;
        //                index1 = i;
        //                index2 = j;
        //            }
        //        }
        //    }
        //}
        ///// <summary>
        ///// Suranda geriausio LOL playerio indexa brances masyve ir indexa tarp LOL players klases objektu
        ///// </summary>
        ///// <param name="branches"></param>
        ///// <param name="index3"></param>
        ///// <param name="index4"></param>
        //static void BestCSPlayer(Branch[] branches, out int index3, out int index4)
        //{
        //    int maxKD = 0;
        //    index3 = 0;
        //    index4 = 0;
        //    for (int i = 0; i < numberOfBranches; i++)
        //    {
        //        for (int j = 0; j < branches[i].CSGOplayers.Count; j++)
        //        {
        //            CSGOPlayers players = branches[i].CSGOplayers.GetPlayer(j) as CSGOPlayers;
        //            if (maxKD < players.kills/players.deaths)
        //            {
        //                maxKD = players.kills / players.deaths;
        //                index3 = i;
        //                index4 = j;
        //            }
        //        }
        //    }
        //}
        ///// <summary>
        ///// suranda visus sio turnyro dalyvius is visu zaidimu
        ///// </summary>
        ///// <param name="branches"></param>
        ///// <returns></returns>
        //static PlayersContainer AllParticipants(Branch[] branches)
        //{
        //    PlayersContainer participants = new PlayersContainer(maxNumberOfPlayers);
        //    for(int i = 0; i < numberOfBranches; i++)
        //    {
        //        for(int j = 0; j < branches[i].LOLplayers.Count; j++ )
        //        {
        //            participants.AddPlayer(branches[i].LOLplayers.GetPlayer(j));
        //        }
        //    }
        //    for (int i = 0; i < numberOfBranches; i++)
        //    {
        //        for (int j = 0; j < branches[i].CSGOplayers.Count; j++)
        //        {
        //            participants.AddPlayer(branches[i].CSGOplayers.GetPlayer(j));
        //        }
        //    }
        //    participants = SortParticipants(branches, participants);
        //    return participants;
        //}
        ///// <summary>
        ///// surikiuoja dalyvius is ALLParticipants funkcijos pagal pavarde ir varda
        ///// </summary>
        ///// <param name="branches"></param>
        ///// <param name="participants"></param>
        ///// <returns></returns>
        //static PlayersContainer SortParticipants(Branch[] branches, PlayersContainer participants)
        //{

        //    for (int i = 0; i < participants.Count; i++)
        //    {
        //        for (int j = 1; j < participants.Count; j++)
        //        {
        //            if (participants.GetPlayer(j - 1).surname[0] > participants.GetPlayer(j).surname[0])
        //            {
        //                string a = participants.GetPlayer(j - 1).surname;
        //                string b = participants.GetPlayer(j - 1).name;
        //                participants.GetPlayer(j - 1).surname = participants.GetPlayer(j).surname;
        //                participants.GetPlayer(j - 1).name = participants.GetPlayer(j).name;
        //                participants.GetPlayer(j).surname = a;
        //                participants.GetPlayer(j).name = b;
        //            }
        //            else if(participants.GetPlayer(j - 1).surname[0] == participants.GetPlayer(j).surname[0])
        //            {
        //                if (participants.GetPlayer(j - 1).name[0] > participants.GetPlayer(j).name[0])
        //                {
        //                    string a = participants.GetPlayer(j - 1).surname;
        //                    string b = participants.GetPlayer(j - 1).name;
        //                    participants.GetPlayer(j - 1).surname = participants.GetPlayer(j).surname;
        //                    participants.GetPlayer(j - 1).name = participants.GetPlayer(j).name;
        //                    participants.GetPlayer(j).surname = a;
        //                    participants.GetPlayer(j).name = b;
        //                }
        //                else if (participants.GetPlayer(j - 1).name[0] < participants.GetPlayer(j).name[0])
        //                {
        //                    string a = participants.GetPlayer(j).surname;
        //                    string b = participants.GetPlayer(j).name;
        //                    participants.GetPlayer(j).surname = participants.GetPlayer(j - 1).surname;
        //                    participants.GetPlayer(j).name = participants.GetPlayer(j - 1).name;
        //                    participants.GetPlayer(j - 1).surname = a;
        //                    participants.GetPlayer(j - 1).name = b;
        //                }
        //            }
        //        }
        //    }
        //    return participants;
        //}
        ///// <summary>
        ///// israso surikiuotus dalyvius i textini faila
        ///// </summary>
        ///// <param name="participants"></param>
        ///// <param name="file"></param>
        //static void PrintSortedParticipants(PlayersContainer participants, string file)
        //{
        //    using (StreamWriter writer = new StreamWriter(@file))
        //    {
        //        for(int i = 0; i < participants.Count; i++)
        //        {
        //            writer.WriteLine("Dalyvis Nr. {0} yra {1} {2}", (i + 1), participants.GetPlayer(i).surname, participants.GetPlayer(i).name);
        //        }
        //    }
        //}
    }
}

