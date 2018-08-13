using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Manage_PS_Center
{
    public partial class Hol_Room : Form
    {
        int last_time;
        public Hol_Room()
        {
            InitializeComponent();
            stop_time.Enabled = false;
        }

        private void stop_time_Click(object sender, EventArgs e)
        {
            Function t = new Function();
            if (timer1.Enabled) timer1.Stop();
            int pret = t.Get_Time(time_left);
            t.Add_Price_time(price_total, pret - last_time);
            stop_time.Enabled = false;
        }

        private void start_time_Click(object sender, EventArgs e)
        {
            if (!timer1.Enabled)
            {
                timer1.Start();
                stop_time.Enabled = true;
                add_consum.Enabled = true;
                Function t = new Function();
                last_time = t.Get_Time(time_left);
            }
        }

        private void add_consum_Click(object sender, EventArgs e)
        {
            Add_price_dialog temp = new Add_price_dialog();
            if (temp.ShowDialog(this) == DialogResult.OK)
            {
                Function t = new Function();
                t.Add_Price_money(price_total, form_init.pret);
            }
            //
        }

        private void reset_price_Click(object sender, EventArgs e)
        {
            DialogResult raspuns = MessageBox.Show("Aceasta va sterge datele pentru camera curenta.Continuati ?", "Avertizare", MessageBoxButtons.YesNo);
            if (raspuns == DialogResult.Yes)
            {
                price_total.Text = "0";
                if (timer1.Enabled) timer1.Stop();
                time_left.Text = "00:00";
            }
        }

        private void Hol_Room_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true;
            this.Hide();

        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Function t = new Function();
            int time;
            time = t.Get_Time(time_left);
            time++;
            t.Time_plus(time_left);
        }
    }
}
