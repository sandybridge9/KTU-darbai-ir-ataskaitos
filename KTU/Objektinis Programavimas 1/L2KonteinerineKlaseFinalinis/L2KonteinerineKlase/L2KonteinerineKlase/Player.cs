using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace L2KonteinerineKlase
{
    class Player
    {
        public string name { get; set; }
        public string surname { get; set; }
        public string team { get; set; }
        public string position { get; set; }
        public string champion { get; set; }
        public int kills { get; set; }
        public int assists { get; set; }
        public bool isCurrentlyPlaying { get; set; }

        public Player()
        {
        }
        public Player(string name, string surname, string team, string position, string champion, int kills, int assists, bool isCurrentlyPlaying)
        {
            this.name = name;
            this.surname = surname;
            this.team = team;
            this.position = position;
            this.champion = champion;
            this.kills = kills;
            this.assists = assists;
            this.isCurrentlyPlaying = isCurrentlyPlaying;
        }
        //public static bool operator >=(Player lp, Player rp)
        //{
        //    int i = 0;
        //    if ((lp.kills + lp.assists) >= (rp.kills + rp.assists))
        //        i = 1;
        //    return 1;
        //}
        //public static bool operator <=(Player lp, Player rp)
        //{
        //    bool bigger = true;
        //    if ((lp.kills + lp.assists) <= (rp.kills + rp.assists))
        //        bigger = false;
        //    return bigger;
        //}
        public static bool operator >=(Player lp, Player rp)
        {
            int i = 0;
            if ((lp.kills + lp.assists) >= (rp.kills + rp.assists))
                i = 1;
            return i > 0 || i == 0;
        }
        public static bool operator <=(Player lp, Player rp)
        {
            int i = 0;
            if ((lp.kills + lp.assists) <= (rp.kills + rp.assists))
                i = 1;
                return i < 0 || i == 0;
        }
    }
}
