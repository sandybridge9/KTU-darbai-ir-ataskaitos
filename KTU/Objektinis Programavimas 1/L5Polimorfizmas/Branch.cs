using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace U4WCG19
{
    class Branch
    {
        const int maxNumberOfPlayers = 90;

        public int tour { get; set; }
        public string date { get; set; }
        public PlayersContainer AllPlayers;

        public Branch(int tour)
        {
            this.tour = tour;
            AllPlayers = new PlayersContainer(maxNumberOfPlayers);
        }
        public void tourDate(string date)
        {
            this.date = date;
        }
    }
}
