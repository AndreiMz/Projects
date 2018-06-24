namespace Manage_PS_Center
{
    partial class Stock_Room
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.Label idLabel;
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.idDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.numeProdusDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pretProdusDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cantitateDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tableBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.produse_databaseDataSet = new Manage_PS_Center.produse_databaseDataSet();
            this.bindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.tableBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tableAdapterManager = new Manage_PS_Center.produse_databaseDataSetTableAdapters.TableAdapterManager();
            this.tableTableAdapter = new Manage_PS_Center.produse_databaseDataSetTableAdapters.tableTableAdapter();
            idLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tableBindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.produse_databaseDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tableBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // idLabel
            // 
            idLabel.AutoSize = true;
            idLabel.Location = new System.Drawing.Point(123, 47);
            idLabel.Name = "idLabel";
            idLabel.Size = new System.Drawing.Size(19, 13);
            idLabel.TabIndex = 1;
            idLabel.Text = "Id:";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.idDataGridViewTextBoxColumn,
            this.numeProdusDataGridViewTextBoxColumn,
            this.pretProdusDataGridViewTextBoxColumn,
            this.cantitateDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.tableBindingSource1;
            this.dataGridView1.Location = new System.Drawing.Point(12, 39);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(459, 206);
            this.dataGridView1.TabIndex = 9;
            this.dataGridView1.Enter += new System.EventHandler(this.dataGridView1_Enter);
            // 
            // idDataGridViewTextBoxColumn
            // 
            this.idDataGridViewTextBoxColumn.DataPropertyName = "Id";
            this.idDataGridViewTextBoxColumn.HeaderText = "Id";
            this.idDataGridViewTextBoxColumn.Name = "idDataGridViewTextBoxColumn";
            // 
            // numeProdusDataGridViewTextBoxColumn
            // 
            this.numeProdusDataGridViewTextBoxColumn.DataPropertyName = "Nume Produs";
            this.numeProdusDataGridViewTextBoxColumn.HeaderText = "Nume Produs";
            this.numeProdusDataGridViewTextBoxColumn.Name = "numeProdusDataGridViewTextBoxColumn";
            // 
            // pretProdusDataGridViewTextBoxColumn
            // 
            this.pretProdusDataGridViewTextBoxColumn.DataPropertyName = "Pret Produs";
            this.pretProdusDataGridViewTextBoxColumn.HeaderText = "Pret Produs";
            this.pretProdusDataGridViewTextBoxColumn.Name = "pretProdusDataGridViewTextBoxColumn";
            // 
            // cantitateDataGridViewTextBoxColumn
            // 
            this.cantitateDataGridViewTextBoxColumn.DataPropertyName = "Cantitate ";
            this.cantitateDataGridViewTextBoxColumn.HeaderText = "Cantitate ";
            this.cantitateDataGridViewTextBoxColumn.Name = "cantitateDataGridViewTextBoxColumn";
            // 
            // tableBindingSource1
            // 
            this.tableBindingSource1.DataMember = "Table";
            this.tableBindingSource1.DataSource = this.produse_databaseDataSet;
            // 
            // produse_databaseDataSet
            // 
            this.produse_databaseDataSet.DataSetName = "produse_databaseDataSet";
            this.produse_databaseDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // bindingSource1
            // 
            this.bindingSource1.DataSource = this.produse_databaseDataSet;
            this.bindingSource1.Position = 0;
            // 
            // tableBindingSource
            // 
            this.tableBindingSource.DataMember = "Table";
            this.tableBindingSource.DataSource = this.produse_databaseDataSet;
            // 
            // tableAdapterManager
            // 
            this.tableAdapterManager.BackupDataSetBeforeUpdate = false;
            this.tableAdapterManager.Connection = null;
            this.tableAdapterManager.tableTableAdapter = null;
            this.tableAdapterManager.UpdateOrder = Manage_PS_Center.produse_databaseDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            // 
            // tableTableAdapter
            // 
            this.tableTableAdapter.ClearBeforeFill = true;
            // 
            // Stock_Room
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(542, 272);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(idLabel);
            this.Name = "Stock_Room";
            this.Text = "Stock_Room";
            this.Activated += new System.EventHandler(this.Stock_Room_Activated);
            this.Deactivate += new System.EventHandler(this.Stock_Room_Deactivate);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Stock_Room_FormClosing);
            this.Load += new System.EventHandler(this.Stock_Room_Load);
            this.Enter += new System.EventHandler(this.Stock_Room_Enter);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tableBindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.produse_databaseDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tableBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.BindingSource bindingSource1;
        private produse_databaseDataSet produse_databaseDataSet;
        private System.Windows.Forms.BindingSource tableBindingSource;
        private produse_databaseDataSetTableAdapters.TableAdapterManager tableAdapterManager;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn idDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn numeProdusDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn pretProdusDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn cantitateDataGridViewTextBoxColumn;
        private System.Windows.Forms.BindingSource tableBindingSource1;
        private produse_databaseDataSetTableAdapters.tableTableAdapter tableTableAdapter;
    }
}