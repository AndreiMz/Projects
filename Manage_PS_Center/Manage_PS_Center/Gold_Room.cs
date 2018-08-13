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
    public partial class Gold_Room : Form
    {
        int timp_adaugat;
        int last_time;
        public Gold_Room()
        {
            InitializeComponent();

        }

        private void add_time_Click(object sender, EventArgs e)
        {

            if (!timer1.Enabled) {
                timer1.Start();
          //      stop_time.Enabled = true;
                add_consum.Enabled = true;
                Function t = new Function();
                last_time = t.Get_Time(time_left);
            }

           

        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Function t = new Function();
            int time;
            time = t.Get_Time(time_left);
            time++;
            t.Time_plus(time_left);

        }

        private void Gold_Room_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel=true;
            this.Hide();                         
            
        }

        private void add_consum_Click(object sender, EventArgs e)
        {
            Add_price_dialog temp = new Add_price_dialog();
            if(temp.ShowDialog(this)==DialogResult.OK)
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

        private void stop_time_Click(object sender, EventArgs e)
        {
            ///de modificat daca opresc timpul , il pornesc ,il opresc iar , se adauga banii pe timpul total nu pe diferenta
            Function t = new Function();
            if (timer1.Enabled) timer1.Stop();
            int pret = t.Get_Time(time_left);
           t.Add_Price_time(price_total, pret-last_time);
            stop_time.Enabled = false;
            

        }
    }
}
class Function
{
    public void Modify_Time(Label ToModify, int newTime,Label price)
    {
        int ore_cur, ore_nou = 0, min_cur, min_nou = 0;
        string x;
        x = ToModify.Text;
        Int32.TryParse(x.Substring(0, 2), out ore_cur);
        Int32.TryParse(x.Substring(x.Length - 2), out min_cur);
        while (newTime != 0)
        {
            if (newTime >= 60)
            {
                ore_nou = ore_nou + 1;
                newTime -= 60;
            }
            else
            {
                min_nou = newTime;
                newTime = 0;
            }
        }
        ore_cur = ore_cur + ore_nou;
        if (min_cur + min_nou >= 60)
        {
            min_cur = (min_cur + min_nou) - 60;
            ore_cur++;
        }
        else
        {
            min_cur += min_nou;
        }
        if (ore_cur < 10)
            if (min_cur < 10)
                ToModify.Text = "0" + ore_cur.ToString() + ":" + "0" + min_cur.ToString();
            else
                ToModify.Text = "0" + ore_cur.ToString() + ":" + min_cur.ToString();
        else
            if (min_cur < 10)
            ToModify.Text = ore_cur.ToString() + ":" + "0" + min_cur.ToString();
        else
            ToModify.Text = ore_cur.ToString() + ":" + min_cur.ToString();
       
    }
    public int Get_Time(Label TimeTable)
    {
        int time = 0;
        int h, m;
        string x = TimeTable.Text;
        Int32.TryParse(x.Substring(0, 2), out h);
        Int32.TryParse(x.Substring(x.Length - 2), out m);
        time = h * 60 + m;
        return time;
    }
    public void Time_plus(Label ToModify)
    {
        string x = ToModify.Text;
        int h, m;
        Int32.TryParse(x.Substring(0, 2), out h);
        Int32.TryParse(x.Substring(x.Length - 2), out m);
        m++;
        if (m > 59)
        {
            m = 0;
            h++;
        }
        
        if (h < 10)
            if (m < 10)
                ToModify.Text = "0" + h.ToString() + ":" + "0" + m.ToString();
            else
                ToModify.Text = "0" + h.ToString() + ":" + m.ToString();
        else
          if (m < 10)
            ToModify.Text = h.ToString() + ":" + "0" + m.ToString();
        else
            ToModify.Text = h.ToString() + ":" + m.ToString();
        
    }
    public void Add_Price_time(Label ToModify, double time)
    {
        double price_cur;
        Double.TryParse(ToModify.Text, out price_cur);
        price_cur += time*0.25;
        ToModify.Text = price_cur.ToString();
    }
    public void Add_Price_money(Label ToModify,double value)
    {
        double price_cur;
        double.TryParse(ToModify.Text, out price_cur);
        price_cur += value;
        ToModify.Text = price_cur.ToString();
    }
}