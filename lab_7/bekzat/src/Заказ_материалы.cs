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
    public partial class Заказ_материалы : Form
    {
        public Заказ_материалы()
        {
            InitializeComponent();
        }

        private void заказ_материалыBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.заказ_материалыBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet1);

        }

        private void Заказ_материалы_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dataSet1.Заказ_материалы". При необходимости она может быть перемещена или удалена.
            this.заказ_материалыTableAdapter.Fill(this.dataSet1.Заказ_материалы);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Меню form = new Меню();
            form.Show();
            this.Hide();
        }

       
    }
}
