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
    public partial class Меню : Form
    {
        public Меню()
        {
            InitializeComponent();
        }

        private void марка_ТСBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.марка_ТСBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet1);

        }

        private void Form1_Load(object sender, EventArgs e)
        {
          
            this.марка_ТСTableAdapter.Fill(this.dataSet1.Марка_ТС);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Заказ form=new Заказ();
            form.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Заказ_материалы form = new Заказ_материалы();
            form.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Заказ_услуги form = new Заказ_услуги();
            form.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Клиенты form = new Клиенты();
            form.Show();
            this.Hide();
        }

        private void button12_Click(object sender, EventArgs e)
        {
            Услуги form = new Услуги();
            form.Show();
            this.Hide();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Марка_ТС form = new Марка_ТС();
            form.Show();
            this.Hide();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Оплата form = new Оплата();
            form.Show();
            this.Hide();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            Подразделения form = new Подразделения();
            form.Show();
            this.Hide();
        }

        private void button9_Click(object sender, EventArgs e)
        {
            Работники form = new Работники();
            form.Show();
            this.Hide();
        }

        private void button10_Click(object sender, EventArgs e)
        {
            Склад form = new Склад();
            form.Show();
            this.Hide();
        }

        private void button11_Click(object sender, EventArgs e)
        {
            Тип_ТС form = new Тип_ТС();
            form.Show();
            this.Hide();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Стоимость_услуг form = new Стоимость_услуг();
            form.Show();
            this.Hide();
        }

        private void button13_Click(object sender, EventArgs e)
        {
            Клиенты_1_числа form=new Клиенты_1_числа();
            form.Show();
            this.Hide();
        }

        private void button14_Click(object sender, EventArgs e)
        {
            Работники_текущего_года form=new Работники_текущего_года(); 
                form.Show();    
                this.Hide();
        }

        private void button15_Click(object sender, EventArgs e)
        {
            Стоимость_деталей form = new Стоимость_деталей();
                form.Show();
               this.Hide();
        }

        private void button16_Click(object sender, EventArgs e)
        {
            Клиенты_улицы form = new Клиенты_улицы();
            form.Show();
            this.Hide();
        }

        private void button17_Click(object sender, EventArgs e)
        {
            Финансовый_отчет form=new Финансовый_отчет();
            form.Show();
            this.Hide();
        }

        private void button18_Click(object sender, EventArgs e)
        {
            Первый_заказ form=new Первый_заказ();
            form.Show(); this.Hide();
        }

        private void button19_Click(object sender, EventArgs e)
        {
            Подразделения_года form = new Подразделения_года();
            form.Show(); this.Hide();
        }
    }
}
