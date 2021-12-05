using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace L2KonteinerineKlase
{
    class Branch
    {
        const int maxNumberOfPlayers = 90;

        public int tour { get; set; }
        public string date { get; set; }
        public PlayerContainer Players { get; private set; }

        public Branch(int tour)
        {
            this.tour = tour;
            Players = new PlayerContainer(maxNumberOfPlayers);
        }
        public void tourDate(string date)
        {
            this.date = date;
        }
    }
}
