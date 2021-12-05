using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DVD3
{
    class Players : Narys
    {
        public double height { get; set; }
        public string position { get; set; }
        public string club { get; set; }
        public bool invitation { get; set; }
        public bool indication { get; set; }

        public Players(string name, string surname, DateTime birth, double height, string position, string club,
            bool invitation, bool indication) : base(name, surname, birth)
        {
            this.height = height;
            this.position = position;
            this.club = club;
            this.invitation = invitation;
            this.indication = indication;
        }

        public override String ToString()
        {
            return String.Format("{0, -10}|{1, -10}|{2, -22}|{3, -6}|{4, -10}|{5, -10}|{6}", name, surname,
                            birth, height, position, club, indication);
        }
    }
}
