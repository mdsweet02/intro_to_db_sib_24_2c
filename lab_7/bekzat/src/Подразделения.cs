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
    public partial class Подразделения : Form
    {
        public Подразделения()
        {
            InitializeComponent();
        }

        private void подразделенияBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.подразделенияBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet1);

        }

        private void Подразделения_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dataSet1.Подразделения". При необходимости она может быть перемещена или удалена.
            this.подразделенияTableAdapter.Fill(this.dataSet1.Подразделения);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Меню form = new Меню();
            form.Show();
            this.Hide();
        }

       
    }
}
