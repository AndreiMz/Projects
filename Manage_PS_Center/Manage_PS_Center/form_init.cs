using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Manage_PS_Center
{
    class form_init
    {
        private static double _pret = new double();
        public static double pret { get { return _pret; } }
        public static void prets(double x) { _pret = x;  }
        private static Hol_Room _hol = new Hol_Room();
        private static Green_Room _green = new Green_Room();
        private static Gold_Room _gold = new Gold_Room();
        private static Red_Room _red = new Red_Room();
        private static Stock_Room _stock = new Stock_Room();
        public static Stock_Room stock  { get { return _stock;} }
        public static Green_Room green { get { return _green; } }
        public static Red_Room red { get { return _red; } }
        public static Hol_Room hol { get { return _hol; } }
        public static Gold_Room gold { get { return _gold; } }


    }
}
