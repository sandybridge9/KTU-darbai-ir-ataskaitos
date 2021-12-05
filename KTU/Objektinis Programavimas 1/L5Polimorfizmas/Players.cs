using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace U4WCG19
{
    abstract class Players
    {
        public string game { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public string team { get; set; }

        public Players()
        { }
        public Players(string game, string name, string surname, string team)
        {
            this.game = game;
            this.name = name;
            this.surname = surname;
            this.team = team;
        }
        public Players(string data)
        {
            SetData(data);
        }
        public virtual void SetData(string line)
        {
            string[] values = line.Split(';');
            name = values[1];
            surname = values[2];
            team = values[3];
        }
        public bool Equals(Players player)
        {
            if(Object.ReferenceEquals(player, null))
            {
                return false;
            }
            if(this.GetType() != player.GetType())
            {
                return false;
            }
            return (name == player.name) && (surname == player.surname);
        }
        public static bool operator >=(Players lp, Players rp)
        {
            int i = string.Compare(lp.surname, rp.surname);
            return i > 0 || i == 0;
        }
        public static bool operator <=(Players lp, Players rp)
        {
            int i = string.Compare(lp.surname, rp.surname);
            return i < 0 || i == 0;
        }
    }
}
