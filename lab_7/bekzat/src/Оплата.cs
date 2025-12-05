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
    public partial class Оплата : Form
    {
        public Оплата()
        {
            InitializeComponent();
        }

        private void оплатаBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.оплатаBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet1);

        }

        private void Оплата_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dataSet1.Оплата". При необходимости она может быть перемещена или удалена.
            this.оплатаTableAdapter.Fill(this.dataSet1.Оплата);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Меню form = new Меню();
            form.Show();
            this.Hide();
        }

        private void ___заказаLabel_Click(object sender, EventArgs e)
        {

        }

        private void ___заказаTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void датаLabel_Click(object sender, EventArgs e)
        {

        }

        private void датаDateTimePicker_ValueChanged(object sender, EventArgs e)
        {

        }

        private void иИН_клиентаLabel_Click(object sender, EventArgs e)
        {

        }

        private void иИН_клиентаTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void код_работника_кассираLabel_Click(object sender, EventArgs e)
        {

        }

        private void код_работника_кассираTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void суммаLabel_Click(object sender, EventArgs e)
        {

        }

        private void суммаTextBox_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
