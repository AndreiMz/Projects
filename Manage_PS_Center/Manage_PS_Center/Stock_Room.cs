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
    public partial class Stock_Room : Form
    {
        public Stock_Room()
        {
            InitializeComponent();
        }

        private void Stock_Room_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'produse_databaseDataSet.Table' table. You can move, or remove it, as needed.
            this.tableTableAdapter.Fill(this.produse_databaseDataSet.Table);
            // TODO: This line of code loads data into the 'produse_databaseDataSet.Table' table. You can move, or remove it, as needed.
            // this.tableTableAdapter.Fill(this.produse_databaseDataSet.Table);
            // TODO: This line of code loads data into the 'produse_databaseDataSet.Table' table. You can move, or remove it, as needed.
            //this.tableTableAdapter.Fill(this.produse_databaseDataSet.Table);

        }

        private void bindingNavigatorAddNewItem_Click(object sender, EventArgs e)
        {
            Form Temp = new Form();
            TextBox nume, pret, cant;
            nume = new TextBox();
            pret = new TextBox();
            cant = new TextBox();
            nume.Size = new Size(128, 32);
            pret.Size = new Size(128, 32);
            cant.Size = new Size(128, 32);
            nume.Location = new Point(32, 32);
            pret.Location = new Point(32, 64);
            cant.Location = new Point(32, 96);
            Temp.Size = new Size(256, 256);
            Temp.Controls.Add(nume);
            Temp.Controls.Add(pret);
            Temp.Controls.Add(cant);

        }

        private void Stock_Room_Deactivate(object sender, EventArgs e)
        {
            this.Validate();
            
            this.tableTableAdapter.Update(produse_databaseDataSet);
            this.produse_databaseDataSet.AcceptChanges();
            this.tableTableAdapter.Fill(produse_databaseDataSet.Table);
        }

        private void Stock_Room_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Validate();
            this.tableTableAdapter.Update(produse_databaseDataSet);
            this.produse_databaseDataSet.AcceptChanges();
            this.tableTableAdapter.Fill(produse_databaseDataSet.Table);
         //   this.tableTableAdapter.Update(this.produse_databaseDataSet);        
            e.Cancel=true;
            this.Hide();
        }

        private void dataGridView1_Enter(object sender, EventArgs e)
        {
            dataGridView1.Refresh();
            
        }

        private void Stock_Room_Activated(object sender, EventArgs e)
        {
            dataGridView1.Refresh();
        }

        private void Stock_Room_Enter(object sender, EventArgs e)
        {
            this.Validate();
            dataGridView1.Refresh();
            this.tableTableAdapter.Update(produse_databaseDataSet);
            bindingSource1.ResetBindings(false);
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
           
        }
    }
}
