using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using База_данных.DataSet1TableAdapters;

namespace База_данных
{
    public partial class Склад : Form
    {
        public Склад()
        {
            InitializeComponent();
        }

        private void складBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.складBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet1);

        }

        private void Склад_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dataSet1.Склад". При необходимости она может быть перемещена или удалена.
            this.складTableAdapter.Fill(this.dataSet1.Склад);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Меню form = new Меню();
            form.Show();
            this.Hide();
        }

       
    }
}
