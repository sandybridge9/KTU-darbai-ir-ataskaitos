using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace U4WCG19
{
    class CSGOPlayers : Players
    {
        public int kills { get; set; }
        public int deaths { get; set; }
        public string favouriteWeapon { get; set; }

        public CSGOPlayers()
        { }
        public CSGOPlayers(string game, string name, string surname, string team, int kills,
                int deaths, string favouriteWeapon) :base(game, name, surname, team)
        {
            this.kills = kills;
            this.deaths = deaths;
            this.favouriteWeapon = favouriteWeapon;
        }
        public override void SetData(string line)
        {
            base.SetData(line);
            string[] values = line.Split(';');
            game = values[0];
            kills = int.Parse(values[4]);
            deaths = int.Parse(values[5]);
            favouriteWeapon = values[6];

        }
    }
}
