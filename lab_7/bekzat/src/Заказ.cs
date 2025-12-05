using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace База_данных
{
    public partial class Заказ : Form
    {
        public Заказ()
        {
            InitializeComponent();
        }

        private void заказBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.заказBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet1);

        }

        private void Заказ_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dataSet1.Заказ". При необходимости она может быть перемещена или удалена.
            this.заказTableAdapter.Fill(this.dataSet1.Заказ);

        }

      

        private void button1_Click_1(object sender, EventArgs e)
        {
            Меню form = new Меню();
            form.Show();
            this.Hide();
        }
    }
}
