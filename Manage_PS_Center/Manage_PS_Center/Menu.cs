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
    public partial class Menu : Form
    {
        private int timeleft = 30;
            public Menu()
        {
            InitializeComponent();
      
        }

        private void gold_btn_Click(object sender, EventArgs e)
        {
            form_init.gold.Show();
        }

        private void red_btn_Click(object sender, EventArgs e)
        {
            form_init.red.Show();
        }

        private void green_btn_Click(object sender, EventArgs e)
        {
            form_init.green.Show();                                
        }

        private void hol_btn_Click(object sender, EventArgs e)
        {
            form_init.hol.Show();
        }

        private void stock_btn_Click(object sender, EventArgs e)
        {
            string x="";
            Form Password = new Form();
            TextBox pass = new TextBox();
            Button ok = new Button();
            Password.Controls.Add(pass);
            Password.Controls.Add(ok);
            Password.Size = new Size(256, 256);
            pass.Size = new Size(128, 64);
            pass.Location = new Point(32, 32);
            ok.Size = new Size(45, 45);
            ok.Location = new Point(182, 16);
            ok.Text = "Ok";
            pass.PasswordChar = '•';
            Password.Show();
            ok.Click += (s, e1) =>
            {
                x = pass.Text;
                Password.Close();
                if (x == "polopolo")
                {
                    Password.Close();
                    form_init.stock.Show();
                }
                else
                    MessageBox.Show("Parola gresita", "Eroare", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            
            };
           
        }
    }
 }
