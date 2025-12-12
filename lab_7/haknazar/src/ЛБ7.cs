namespace Лб_7
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.taxDeclarationDB2DataSet = new Лб_7.TaxDeclarationDB2DataSet();
            this.countriesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.countriesTableAdapter = new Лб_7.TaxDeclarationDB2DataSetTableAdapters.CountriesTableAdapter();
            this.declarationsArchiveBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.declarationsArchiveTableAdapter = new Лб_7.TaxDeclarationDB2DataSetTableAdapters.DeclarationsArchiveTableAdapter();
            this.iINDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fullNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.taxpayersBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.taxpayersTableAdapter = new Лб_7.TaxDeclarationDB2DataSetTableAdapters.TaxpayersTableAdapter();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.nationalitiesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.nationalitiesTableAdapter = new Лб_7.TaxDeclarationDB2DataSetTableAdapters.NationalitiesTableAdapter();
            this.nationalityIDDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nationalityNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.taxDeclarationDB2DataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.countriesBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.declarationsArchiveBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.taxpayersBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nationalitiesBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.iINDataGridViewTextBoxColumn,
            this.fullNameDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.taxpayersBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(12, 47);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(344, 235);
            this.dataGridView1.TabIndex = 0;
            // 
            // taxDeclarationDB2DataSet
            // 
            this.taxDeclarationDB2DataSet.DataSetName = "TaxDeclarationDB2DataSet";
            this.taxDeclarationDB2DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // countriesBindingSource
            // 
            this.countriesBindingSource.DataMember = "Countries";
            this.countriesBindingSource.DataSource = this.taxDeclarationDB2DataSet;
            // 
            // countriesTableAdapter
            // 
            this.countriesTableAdapter.ClearBeforeFill = true;
            // 
            // declarationsArchiveBindingSource
            // 
            this.declarationsArchiveBindingSource.DataMember = "DeclarationsArchive";
            this.declarationsArchiveBindingSource.DataSource = this.taxDeclarationDB2DataSet;
            // 
            // declarationsArchiveTableAdapter
            // 
            this.declarationsArchiveTableAdapter.ClearBeforeFill = true;
            // 
            // iINDataGridViewTextBoxColumn
            // 
            this.iINDataGridViewTextBoxColumn.DataPropertyName = "IIN";
            this.iINDataGridViewTextBoxColumn.HeaderText = "IIN";
            this.iINDataGridViewTextBoxColumn.Name = "iINDataGridViewTextBoxColumn";
            // 
            // fullNameDataGridViewTextBoxColumn
            // 
            this.fullNameDataGridViewTextBoxColumn.DataPropertyName = "FullName";
            this.fullNameDataGridViewTextBoxColumn.HeaderText = "FullName";
            this.fullNameDataGridViewTextBoxColumn.Name = "fullNameDataGridViewTextBoxColumn";
            // 
            // taxpayersBindingSource
            // 
            this.taxpayersBindingSource.DataMember = "Taxpayers";
            this.taxpayersBindingSource.DataSource = this.taxDeclarationDB2DataSet;
            // 
            // taxpayersTableAdapter
            // 
            this.taxpayersTableAdapter.ClearBeforeFill = true;
            // 
            // dataGridView2
            // 
            this.dataGridView2.AutoGenerateColumns = false;
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.nationalityIDDataGridViewTextBoxColumn,
            this.nationalityNameDataGridViewTextBoxColumn});
            this.dataGridView2.DataSource = this.nationalitiesBindingSource;
            this.dataGridView2.Location = new System.Drawing.Point(425, 47);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.Size = new System.Drawing.Size(318, 235);
            this.dataGridView2.TabIndex = 1;
            // 
            // nationalitiesBindingSource
            // 
            this.nationalitiesBindingSource.DataMember = "Nationalities";
            this.nationalitiesBindingSource.DataSource = this.taxDeclarationDB2DataSet;
            // 
            // nationalitiesTableAdapter
            // 
            this.nationalitiesTableAdapter.ClearBeforeFill = true;
            // 
            // nationalityIDDataGridViewTextBoxColumn
            // 
            this.nationalityIDDataGridViewTextBoxColumn.DataPropertyName = "NationalityID";
            this.nationalityIDDataGridViewTextBoxColumn.HeaderText = "NationalityID";
            this.nationalityIDDataGridViewTextBoxColumn.Name = "nationalityIDDataGridViewTextBoxColumn";
            // 
            // nationalityNameDataGridViewTextBoxColumn
            // 
            this.nationalityNameDataGridViewTextBoxColumn.DataPropertyName = "NationalityName";
            this.nationalityNameDataGridViewTextBoxColumn.HeaderText = "NationalityName";
            this.nationalityNameDataGridViewTextBoxColumn.Name = "nationalityNameDataGridViewTextBoxColumn";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.dataGridView2);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.taxDeclarationDB2DataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.countriesBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.declarationsArchiveBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.taxpayersBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nationalitiesBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private TaxDeclarationDB2DataSet taxDeclarationDB2DataSet;
        private System.Windows.Forms.BindingSource countriesBindingSource;
        private TaxDeclarationDB2DataSetTableAdapters.CountriesTableAdapter countriesTableAdapter;
        private System.Windows.Forms.BindingSource declarationsArchiveBindingSource;
        private TaxDeclarationDB2DataSetTableAdapters.DeclarationsArchiveTableAdapter declarationsArchiveTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn iINDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn fullNameDataGridViewTextBoxColumn;
        private System.Windows.Forms.BindingSource taxpayersBindingSource;
        private TaxDeclarationDB2DataSetTableAdapters.TaxpayersTableAdapter taxpayersTableAdapter;
        private System.Windows.Forms.DataGridView dataGridView2;
        private System.Windows.Forms.BindingSource nationalitiesBindingSource;
        private TaxDeclarationDB2DataSetTableAdapters.NationalitiesTableAdapter nationalitiesTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn nationalityIDDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nationalityNameDataGridViewTextBoxColumn;
    }
}

