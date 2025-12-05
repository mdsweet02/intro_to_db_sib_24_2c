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
    public partial class Марка_ТС : Form
    {
        public Марка_ТС()
        {
            InitializeComponent();
        }

        private void марка_ТСBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.марка_ТСBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet1);

        }

        private void Марка_ТС_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dataSet1.Марка_ТС". При необходимости она может быть перемещена или удалена.
            this.марка_ТСTableAdapter.Fill(this.dataSet1.Марка_ТС);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Меню form = new Меню();
            form.Show();
            this.Hide();
        }

       
    }
}
