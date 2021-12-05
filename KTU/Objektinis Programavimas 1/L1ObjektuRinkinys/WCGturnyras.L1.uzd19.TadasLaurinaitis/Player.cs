using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WCGturnyras.L1.uzd19.TadasLaurinaitis
{
    class Player
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Team { get; set; }
        public string Position { get; set; }
        public string Champion { get; set; }
        public int Kills { get; set; }
        public int Assists { get; set; }

        public Player()
        {
        }

        public Player(string firstName, string lastName, string team, string position,
        string champion, int kills, int assists)
        {
            FirstName = firstName;
            LastName = lastName;
            Team = team;
            Position = position;
            Champion = champion;
            Kills = kills;
            Assists = assists;
            
        }
    }
}
