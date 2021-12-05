using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace U4WCG19
{
    class PlayersContainer
    {
        private Players[] player { get; set; }
        public int Count { get; private set; }

        public PlayersContainer(int size)
        {
            player = new Players[size];
            Count = 0;
        }

        public void AddPlayer(Players player)
        {
            this.player[Count++] = player;
        }
        public Players GetPlayer(int index)
        {
            return player[index];
        }

    }
}
