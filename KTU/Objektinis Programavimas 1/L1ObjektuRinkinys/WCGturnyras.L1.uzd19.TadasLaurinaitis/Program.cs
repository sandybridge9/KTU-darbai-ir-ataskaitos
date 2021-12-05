using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;


namespace WCGturnyras.L1.uzd19.TadasLaurinaitis
{
    class Program
    {
        public static int MaxNumberOfPlayers = 600000;

        static void Main(string[] args)
        {
            Player[] players, junglers;
            int playerCount, junglerCount;
            string[] teams;
            int teamCount;
            int bestTeamIndex;


            ReadPlayerData(out players, out playerCount);
            GetJunglers(players, out junglers, playerCount, out junglerCount);
            MostActiveJungler(junglers, junglerCount);
            ChampionsList(players, playerCount);
            GetTeams(players, out teams, out teamCount, playerCount);

            int index = MostActiveJungler(junglers, junglerCount);
            Console.WriteLine("Aktyviausias jungleris yra: {0} {1} ", junglers[index].FirstName, junglers[index].LastName);

            int[] teamAssists = new int[teamCount];

            for (int i = 0; i < teamCount; i++)
                teamAssists[i] = GetBestTeam(players, teams[i], playerCount);

            bestTeamIndex = GetMax(teamAssists);
            Console.WriteLine("Geriausia komanda yra: {0}", teams[bestTeamIndex] );


        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="players"></param>
        /// <param name="playerCount"></param>

        static void ReadPlayerData(out Player[] players, out int playerCount)
        {
            playerCount = 0;
            players = new Player[MaxNumberOfPlayers];

            using (StreamReader reader = new StreamReader(@"Players.csv"))
            {
                string line = null;
                while (null != (line = reader.ReadLine()))
                {
                    string[] values = line.Split(';');
                    string firstName = values[0];
                    string lastName = values[1];
                    string team = values[2];
                    string position = values[3];
                    string champion = values[4];
                    int kills = int.Parse(values[5]);
                    int assists = int.Parse(values[6]);

                    Player Player = new Player(firstName, lastName, team, position,
                        champion, kills, assists);
                    players[playerCount++] = Player;

                }

            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="players"></param>
        /// <param name="junglers"></param>
        /// <param name="playerCount"></param>
        /// <param name="junglerCount"></param>
        static void GetJunglers(Player[]players,out Player[]junglers, int playerCount,out int junglerCount)
        {
            junglers = new Player[MaxNumberOfPlayers];
            junglerCount = 0;

            for (int i = 0; i < playerCount; i++)
            {
                if(players[i].Position == "Jungler")
                {
                    junglers[junglerCount] = players[i];
                    junglerCount++;
                }
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="junglers"></param>
        /// <param name="junglerCount"></param>
        /// <returns></returns>
        static int MostActiveJungler(Player[] junglers, int junglerCount)
        {
                int maxKDA = 0;
                int index = 0;
                for (int i = 0; i < junglerCount; i++)
                {
                    if ((junglers[i].Kills + junglers[i].Assists) > maxKDA)
                    {
                        maxKDA = junglers[i].Kills + junglers[i].Assists;
                        index = i;
                    }
                }
            return index; 
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="players"></param>
        /// <param name="playerCount"></param>
        static void ChampionsList(Player[] players, int playerCount)
        {
            using (StreamWriter writer = new StreamWriter(@"Cempionai.csv"))
            {
                writer.Write("Čempionų vardai: ");
                for(int i = 0; i < playerCount; i++)
                {
                    writer.Write("{0}, ", players[i].Champion);
                }
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="players"></param>
        /// <param name="teams"></param>
        /// <param name="teamCount"></param>
        /// <param name="playerCount"></param>
        static void GetTeams(Player[] players, out string[] teams, out int teamCount, int playerCount)
        {
            teams = new string[MaxNumberOfPlayers];
            teamCount = 0;
            for (int i = 0; i < playerCount; i++)
            {
                if (!teams.Contains(players[i].Team))
                {
                    teams[teamCount] = players[i].Team;
                    teamCount++;
                }
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="players"></param>
        /// <param name="team"></param>
        /// <param name="playerCount"></param>
        /// <returns></returns>
        static int GetBestTeam(Player[] players, string team, int playerCount)
        {
            int teamAssists = 0;
            for (int i = 0; i < playerCount; i++)
            {
                if (players[i].Team == team)
                {
                    teamAssists += players[i].Assists;
                }
            }
            return teamAssists;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="TeamAssists"></param>
        /// <returns></returns>
        static int GetMax(int[] TeamAssists)
        {
            int index = 0;

            for (int i = 0; i < TeamAssists.Length; i++)
            {
                if (TeamAssists[index] < TeamAssists[i])
                    index = i;
            }
            return index;
        }



    }
}