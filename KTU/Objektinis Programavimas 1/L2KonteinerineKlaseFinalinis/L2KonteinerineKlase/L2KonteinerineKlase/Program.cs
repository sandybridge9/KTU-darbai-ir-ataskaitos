using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace L2KonteinerineKlase
{
    class Program
    {
        const int numberOfBranches = 3;
        const int maxNumberOfPlayers = 90;
        const int numberOfTeams = 6;
        const int numberOfTeamsInBranch = 2;
        static void Main(string[] args)
        {
            Branch[] Branches = MakeBranchArray();
            ReadAllFiles(Branches);
            PlayerContainer allPlayers = AllPlayers(Branches);
            PlayerContainer junglers = GetJunglers(Branches, "Jungle");
            PlayerContainer substituted = ThoseWhoWereSubstituted(Branches);
            PlayerContainer substitutes = Substitutes(allPlayers, substituted);
            int indexOfBestJungler = BestJungler(junglers);
            string[] allTeams = AllTeams(Branches);
            int[] indexesOfBestTeams = BestTeamInEachBranch(Branches, allTeams);
            Console.WriteLine("Geriausias Jungle pozicijos žaidėjas: " +junglers.GetPlayer(indexOfBestJungler).name +" " +junglers.GetPlayer(indexOfBestJungler).surname);
            PrintBestTeamInEachBranch(Branches, indexesOfBestTeams, allTeams);
            PrintAllSubstitutions(substitutes, substituted, @"..\\..\\Pakeitimai.csv");
            PrintAllChampions(allPlayers, @"..\\..\\Championai.csv");
            //PlayerContainer junglersSorted = Sort(junglers);
        }
        /// <summary>
        /// Sudaro turų masyvą
        /// </summary>
        /// <returns></returns>
        private static Branch[] MakeBranchArray()
        {
            Branch[] Branches = new Branch[numberOfBranches];
            for(int i = 0; i < numberOfBranches; i++)
            {
                Branches[i] = new Branch(i+1);
            }
            return Branches;
        }
        /// <summary>
        /// Gauna Branches masyvo elementą
        /// </summary>
        /// <param name="Branches"></param>
        /// <param name="tour"></param>
        /// <returns></returns>
        private static Branch GetBranchByTour(Branch[] Branches, int tour)
        {
            for (int i = 0; i < numberOfBranches; i++)
            {
                if (Branches[i].tour == tour)
                {
                    return Branches[i];
                }
            }
            return null;
        }
        /// <summary>
        /// Perskaito Žaidėjų duomenis faile
        /// </summary>
        /// <param name="file"></param>
        /// <param name="Branches"></param>
        private static void ReadPlayerData(string file, Branch[] Branches)
        {
            int tour = 0;
            using (StreamReader reader = new StreamReader(file))
            {
                string line = null;
                line = reader.ReadLine();
                if (line != null)
                {
                    tour = int.Parse(line);
                }
                Branch Branch = GetBranchByTour(Branches, tour);
                line = reader.ReadLine();
                string date = line;
                //line = reader.ReadLine();
                Branch.tourDate(date);
                while ((line = reader.ReadLine()) != null)
                {
                    string[] values = line.Split(';');
                    string name = values[0];
                    string surname = values[1];
                    string team = values[2];
                    string position = values[3];
                    string champion = values[4];
                    int kills = int.Parse(values[5]);
                    int assists = int.Parse(values[6]);
                    bool isCurrentlyPlaying = bool.Parse(values[7]);
                    Player Player = new Player(name, surname, team, position, champion, kills, assists, isCurrentlyPlaying);
                    Branch.Players.AddPlayer(Player);
                }
            }
        }
        /// <summary>
        /// Perskaito visus failus
        /// </summary>
        /// <param name="Branches"></param>
        private static void ReadAllFiles(Branch[] Branches)
        {
            string[] filePath = Directory.GetFiles(Directory.GetCurrentDirectory(), "*.csv");
            foreach(string file in filePath)
            {
                ReadPlayerData(file, Branches);
            }
        }
        /// <summary>
        /// Suranda visus jungle pozicijos žaidėjus
        /// </summary>
        /// <param name="Branches"></param>
        /// <param name="position"></param>
        /// <returns></returns>
        private static PlayerContainer GetJunglers(Branch[] Branches, string position)
        {
            PlayerContainer junglers = new PlayerContainer(maxNumberOfPlayers);
            for(int i = 0; i < numberOfBranches; i++)
            {
                for(int j = 0; j < Branches[i].Players.Count; j++)
                {
                    if(Branches[i].Players.GetPlayer(j).position == position)
                    {
                        junglers.AddPlayer(Branches[i].Players.GetPlayer(j));
                    }
                }
            }
            return junglers;
        }
        /// <summary>
        /// Suranda geriausią jungle pozicijos žaidėją
        /// </summary>
        /// <param name="junglers"></param>
        /// <returns></returns>
        private static int BestJungler(PlayerContainer junglers)
        {
            int maxKA = 0;
            int index = 0;
            for(int i = 0; i < junglers.Count; i++)
            {
                if(junglers.GetPlayer(i).kills + junglers.GetPlayer(i).assists > maxKA)
                {
                    maxKA = junglers.GetPlayer(i).kills + junglers.GetPlayer(i).assists;
                    index = i;
                }
            }
            return index;
        }
        /// <summary>
        /// Suranda visus komandų pavadinimus ir sudeda juos į stringų masyvą
        /// </summary>
        /// <param name="Branches"></param>
        /// <returns></returns>
        private static string[] AllTeams(Branch[] Branches)
        {
            string[] allTeams = new string[numberOfTeams];
            int count = 1;
            bool same;
            allTeams[0] = Branches[0].Players.GetPlayer(0).team;
            for(int i = 0; i < numberOfBranches; i++)
            {
                for (int j = 0; j < Branches[i].Players.Count; j++)
                {
                    same = false;
                    for (int k = 0; k < count; k++)
                    {
                        if (allTeams[k] == Branches[i].Players.GetPlayer(j).team)
                            same = true;
                    }
                    if (same == false)
                    {
                        allTeams[count++] = Branches[i].Players.GetPlayer(j).team;
                    }
                }
            }
            return allTeams;
        }
        /// <summary>
        /// Suranda komandas dalyvaujančias viename ture
        /// </summary>
        /// <param name="Branches"></param>
        /// <param name="index"></param>
        /// <returns></returns>
        private static string[] TeamsInBranch(Branch[] Branches, int index)
        {
            string[] teamsInBranch = new string[numberOfTeamsInBranch];
            int count = 1;
            bool same;
            teamsInBranch[0] = Branches[index].Players.GetPlayer(0).team;
                for (int i = 0; i < Branches[index].Players.Count; i++)
                {
                    same = false;
                    for (int j = 0; j < count; j++)
                    {
                        if (teamsInBranch[j] == Branches[index].Players.GetPlayer(i).team)
                            same = true;
                    }
                    if (same == false)
                    {
                        teamsInBranch[count++] = Branches[index].Players.GetPlayer(i).team;
                    }
                }
            return teamsInBranch;
        }
        /// <summary>
        /// Palygina dvi komandas
        /// </summary>
        /// <param name="team1Score"></param>
        /// <param name="team2Score"></param>
        /// <returns></returns>
        private static int CompareTwoTeams(int team1Score, int team2Score)
        {
            if(team1Score > team2Score)
            {
                return 1;
            }
            else
                return 2;
        }
        /// <summary>
        /// Suranda geriausių komandų indeksus kiekviename ture
        /// </summary>
        /// <param name="Branches"></param>
        /// <param name="allTeams"></param>
        /// <returns></returns>
        private static int[] BestTeamInEachBranch(Branch[] Branches, string[] allTeams)
        {
            int[] indexesOfBestTeams = new int[numberOfBranches];
            int count = 0;
            int team1Score = 0;
            int team2Score = 0;
            int bestTeamIndex = 0;
            for(int i = 0; i < numberOfBranches; i++)
            {
                team1Score = 0;
                team2Score = 0;
                bestTeamIndex = 0;
                string[] teamsInBranch = TeamsInBranch(Branches, i);
                for(int j = 0; j < Branches[i].Players.Count; j++)
                {
                    if(Branches[i].Players.GetPlayer(j).team == teamsInBranch[1])
                    {
                        team1Score = team1Score + (Branches[i].Players.GetPlayer(j).kills + Branches[i].Players.GetPlayer(j).assists);
                    }
                    else if(Branches[i].Players.GetPlayer(j).team != teamsInBranch[1])
                    {
                        team2Score = team2Score + (Branches[i].Players.GetPlayer(j).kills + Branches[i].Players.GetPlayer(j).assists);
                    }
                }
                bestTeamIndex = CompareTwoTeams(team1Score, team2Score);
                indexesOfBestTeams[count] = bestTeamIndex;
                count++;
            }
            return indexesOfBestTeams;
        }
        /// <summary>
        /// Išrašo geriausias kiekvieno turo komandas į konsolę
        /// </summary>
        /// <param name="Branches"></param>
        /// <param name="indexesOfBestTeams"></param>
        /// <param name="allTeams"></param>
        private static void PrintBestTeamInEachBranch(Branch[] Branches, int[] indexesOfBestTeams, string[] allTeams)
        {
            for(int i = 0; i < numberOfBranches; i++)
            {
                Console.WriteLine("Ture nr. {0} geriausiai bendradarbiavusi komanda buvo {1}", i+1, allTeams[((i*numberOfTeamsInBranch)+indexesOfBestTeams[i])-1]);
            }
        }
        /// <summary>
        /// Sudaro visų žaidėjų konteinerį
        /// </summary>
        /// <param name="Branches"></param>
        /// <returns></returns>
        private static PlayerContainer AllPlayers(Branch[] Branches)
        {
            PlayerContainer allPlayers = new PlayerContainer(maxNumberOfPlayers);
            for(int i = 0; i < numberOfBranches; i++)
            {
                for(int j = 0; j < Branches[i].Players.Count; j++)
                {
                    if(Branches[i].Players.GetPlayer(j).isCurrentlyPlaying == true)
                    {
                        allPlayers.AddPlayer(Branches[i].Players.GetPlayer(j));
                    }
                }
            }
            return allPlayers;
        }
        /// <summary>
        /// Sudaro pakeistų žaidėjų konteinerį
        /// </summary>
        /// <param name="Branches"></param>
        /// <returns></returns>
        private static PlayerContainer ThoseWhoWereSubstituted(Branch[] Branches)
        {
            PlayerContainer substituted = new PlayerContainer(maxNumberOfPlayers);
            for (int i = 0; i < numberOfBranches; i++)
            {
                for (int j = 0; j < Branches[i].Players.Count; j++)
                {
                    if (Branches[i].Players.GetPlayer(j).isCurrentlyPlaying == false)
                    {
                        substituted.AddPlayer(Branches[i].Players.GetPlayer(j));
                    }
                }
            }
            return substituted;
        }
        /// <summary>
        /// Sudaro žaidėjų, kurie pakeitė pakeistus žaidėjus, konteinerį
        /// </summary>
        /// <param name="allPlayers"></param>
        /// <param name="substituted"></param>
        /// <returns></returns>
        private static PlayerContainer Substitutes(PlayerContainer allPlayers, PlayerContainer substituted)
        {
            PlayerContainer substitutes = new PlayerContainer(maxNumberOfPlayers);
            for(int i = 0; i < substituted.Count; i++)
            {
                for(int j = 0; j < allPlayers.Count; j++)
                {
                    if(allPlayers.GetPlayer(j).team == substituted.GetPlayer(i).team)
                    {
                        if(allPlayers.GetPlayer(j).position == substituted.GetPlayer(i).position)
                        {
                            substitutes.AddPlayer(allPlayers.GetPlayer(j));
                        }
                    }
                }
            }
            return substitutes;
        }
        /// <summary>
        /// Išrašo visus pakeitimus į failą
        /// </summary>
        /// <param name="substitutes"></param>
        /// <param name="substituted"></param>
        /// <param name="file"></param>
        private static void PrintAllSubstitutions(PlayerContainer substitutes, PlayerContainer substituted, string file)
        {
            using (StreamWriter writer = new StreamWriter(@file))
            {
                writer.WriteLine("Pakeitimų sąrašas: ");
                for(int i = 0; i < substituted.Count; i++)
                {
                    writer.WriteLine("Žaidėjas {0} {1} buvo pakeistas į {2} {3}", substituted.GetPlayer(i).name,
                        substituted.GetPlayer(i).surname, substitutes.GetPlayer(i).name, substitutes.GetPlayer(i).surname);
                }
            }
        }
        /// <summary>
        /// Išrašo visų championų pavadinimus į failą
        /// </summary>
        /// <param name="allPlayers"></param>
        /// <param name="file"></param>
        private static void PrintAllChampions(PlayerContainer allPlayers, string file)
        {
            using (StreamWriter writer = new StreamWriter(@file))
            {
                writer.WriteLine("Championų sąrašas: ");
                for(int i = 0; i < allPlayers.Count; i++)
                {
                    writer.WriteLine("{0}", allPlayers.GetPlayer(i).champion);
                }
            }
        }
        //private static PlayerContainer Sort(PlayerContainer junglers)
        //{
        //    for (int i = 0; i < junglers.Count; i++)
        //    {
        //        for (int j = 1; j < junglers.Count; j++)
        //        {
        //            if (junglers.GetPlayer(j - 1) >= junglers.GetPlayer(j))
        //            {
        //                Player a = junglers.GetPlayer(j - 1);
        //                junglers.SetPlayer(j - 1, junglers.GetPlayer(j));
        //                junglers.SetPlayer(j, a);
        //            }
        //        }
        //    }
        //    return junglers;
        //}

    }
}
