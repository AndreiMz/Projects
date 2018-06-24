using System;
using System.IO;
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
    public partial class Add_price_dialog : Form
    {
        public Add_price_dialog()
        {
            InitializeComponent();
        }

        private void Add_price_dialog_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'produse_databaseDataSet.Table' table. You can move, or remove it, as needed.
            this.tableTableAdapter.Fill(this.produse_databaseDataSet.Table);
            // TODO: This line of code loads data into the 'produse_databaseDataSet.Table' table. You can move, or remove it, as needed.
            // this.tableTableAdapter.Fill(this.produse_databaseDataSet.Table);
            // TODO: This line of code loads data into the 'produse_databaseDataSet.Table' table. You can move, or remove it, as needed.
            //  this.tableTableAdapter.Fill(this.produse_databaseDataSet.Table);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            produse_databaseDataSet.TableRow x;
            DataRow[] o;
            bool ok = false;
            string y = comboBox1.Text;
            string sql = "[Nume Produs]='";
            //  x = tableTableAdapter.GetDataBy(y);
            sql += y+"'";
            o = produse_databaseDataSet.Table.Select(sql);
      
                
            //o[0][2] pret
            //o[0][3] cant
            int cantitate_ceruta;
            int cantitate_curenta;
            Int32.TryParse(o[0][3].ToString(), out cantitate_curenta);
            Int32.TryParse(textBox1.Text,out cantitate_ceruta);
            if(cantitate_curenta-cantitate_ceruta<0)
            {
                MessageBox.Show("Cantitate Insuficienta pe Stoc, cantitate ramasa "+cantitate_curenta.ToString() );
                DialogResult = DialogResult.Cancel;
            }
           else
            {
                StreamWriter f = File.AppendText(".//history.txt");
                f.WriteLine("Vandut "
                    + o[0][1].ToString() +
                    " * "
                    + cantitate_ceruta.ToString() + " la "+
                    DateTime.Now.ToString());
                f.Close();
                MessageBox.Show("Cantitate ramasa "+(cantitate_curenta - cantitate_ceruta).ToString());
            //    o[0][1] = "testez";
                o[0][3] = cantitate_curenta - cantitate_ceruta;
                double pe;
                Double.TryParse(o[0][2].ToString(), out pe);
                this.tableTableAdapter.Update(produse_databaseDataSet);
                this.produse_databaseDataSet.AcceptChanges();
                this.tableTableAdapter.Fill(produse_databaseDataSet.Table);
                form_init.prets(cantitate_ceruta *pe);
                button1.DialogResult = DialogResult.OK;
                DialogResult = DialogResult.OK;
                
               
                //  this.tableTableAdapter.UpdateQuery(cantitate_curenta-cantitate_ceruta, y);
                // this.tableTableAdapter.Update( o[0]["Nume"].ToString(),y, cantitate_ceruta - cantitate_curenta, o[0][0], y,);
                //    o.SetValue(cantitate_curenta - cantitate_ceruta, 2);
            }
           
            produse_databaseDataSet.AcceptChanges();
            this.Close();


        }
    }
}
