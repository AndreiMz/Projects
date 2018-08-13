namespace Manage_PS_Center
{
    partial class Menu
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
            this.gold_btn = new System.Windows.Forms.Button();
            this.red_btn = new System.Windows.Forms.Button();
            this.green_btn = new System.Windows.Forms.Button();
            this.hol_btn = new System.Windows.Forms.Button();
            this.stock_btn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // gold_btn
            // 
            this.gold_btn.Location = new System.Drawing.Point(50, 39);
            this.gold_btn.Name = "gold_btn";
            this.gold_btn.Size = new System.Drawing.Size(165, 46);
            this.gold_btn.TabIndex = 0;
            this.gold_btn.Text = "Gold Room";
            this.gold_btn.UseVisualStyleBackColor = true;
            this.gold_btn.Click += new System.EventHandler(this.gold_btn_Click);
            // 
            // red_btn
            // 
            this.red_btn.Location = new System.Drawing.Point(50, 91);
            this.red_btn.Name = "red_btn";
            this.red_btn.Size = new System.Drawing.Size(165, 46);
            this.red_btn.TabIndex = 1;
            this.red_btn.Text = "Red Room";
            this.red_btn.UseVisualStyleBackColor = true;
            this.red_btn.Click += new System.EventHandler(this.red_btn_Click);
            // 
            // green_btn
            // 
            this.green_btn.Location = new System.Drawing.Point(50, 144);
            this.green_btn.Name = "green_btn";
            this.green_btn.Size = new System.Drawing.Size(165, 46);
            this.green_btn.TabIndex = 2;
            this.green_btn.Text = "Green Room";
            this.green_btn.UseVisualStyleBackColor = true;
            this.green_btn.Click += new System.EventHandler(this.green_btn_Click);
            // 
            // hol_btn
            // 
            this.hol_btn.Location = new System.Drawing.Point(50, 196);
            this.hol_btn.Name = "hol_btn";
            this.hol_btn.Size = new System.Drawing.Size(165, 46);
            this.hol_btn.TabIndex = 3;
            this.hol_btn.Text = "Hol";
            this.hol_btn.UseVisualStyleBackColor = true;
            this.hol_btn.Click += new System.EventHandler(this.hol_btn_Click);
            // 
            // stock_btn
            // 
            this.stock_btn.Location = new System.Drawing.Point(316, 91);
            this.stock_btn.Name = "stock_btn";
            this.stock_btn.Size = new System.Drawing.Size(142, 98);
            this.stock_btn.TabIndex = 4;
            this.stock_btn.Text = "STOCK";
            this.stock_btn.UseVisualStyleBackColor = true;
            this.stock_btn.Click += new System.EventHandler(this.stock_btn_Click);
            // 
            // Menu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(496, 311);
            this.Controls.Add(this.stock_btn);
            this.Controls.Add(this.hol_btn);
            this.Controls.Add(this.green_btn);
            this.Controls.Add(this.red_btn);
            this.Controls.Add(this.gold_btn);
            this.Name = "Menu";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button gold_btn;
        private System.Windows.Forms.Button red_btn;
        private System.Windows.Forms.Button green_btn;
        private System.Windows.Forms.Button hol_btn;
        private System.Windows.Forms.Button stock_btn;
    }
}

