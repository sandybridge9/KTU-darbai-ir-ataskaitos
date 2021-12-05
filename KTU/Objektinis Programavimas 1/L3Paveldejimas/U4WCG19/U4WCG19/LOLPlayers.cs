using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace U4WCG19
{
    class LOLPlayers : Players
    {
        public string position { get; set; }
        public string champion { get; set; }
        public int kills { get; set; }
        public int deaths { get; set; }
        public int assists { get; set; }

        public LOLPlayers()
        { }
        public LOLPlayers(string game, string name, string surname, string team, string position, string champion,
                                      int kills, int deaths, int assists) : base(game, name, surname, team)
        {
            this.position = position;
            this.champion = champion;
            this.kills = kills;
            this.deaths = deaths;
            this.assists = assists;
        }
        public LOLPlayers(string data) : base(data)
        {
            SetData(data);
        }
        public override void SetData(string line)
        {
            base.SetData(line);
            string[] values = line.Split(';');
            game = values[0];
            position = values[4];
            champion = values[5];
            kills = int.Parse(values[6]);
            assists = int.Parse(values[7]);
            deaths = int.Parse(values[8]);
        }
    }
}
