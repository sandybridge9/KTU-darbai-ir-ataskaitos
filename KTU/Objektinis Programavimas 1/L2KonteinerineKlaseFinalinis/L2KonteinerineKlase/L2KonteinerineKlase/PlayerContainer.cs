using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace L2KonteinerineKlase
{
    class PlayerContainer
    {
        private Player[] Players { get; set; }
        public int Count { get; set; }

        public PlayerContainer(int size)
        {
            Players = new Player[size];
            Count = 0;
        }
        public void AddPlayer(Player Players)
        {
            this.Players[Count++] = Players;
        }
        public Player GetPlayer(int index)
        {
            return Players[index];
        }
        public void SetPlayer(int index, Player players)
        {
            Players[index] = players;
        }
    }
}
