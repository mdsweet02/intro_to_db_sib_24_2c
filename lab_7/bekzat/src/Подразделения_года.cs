using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace База_данных
{
    public partial class Подразделения_года : Form
    {
        public Подразделения_года()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            string date = textBox1.Text;

            string query = "SELECT  p.[Наименование] AS Наименование_подразделения, " +
                "z.[Дата] AS Дата_заказа FROM dbo.Подразделения p JOIN dbo.Работники r       " +
                "ON r.[Код работника] = p.[Код работника] JOIN dbo.Заказ_услуги zu       " +
                "ON zu.[Код работника] = r.[Код работника]  JOIN dbo.Заказ z      " +
                "ON z.[№ заказа] = zu.[№ заказа] WHERE YEAR(z.[Дата]) = @dayValue";

            string connectionString = @"Data Source=DESKTOP-2UME45M;Initial Catalog=Дошимов_Бекзат_Баурыжанович;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@dayValue", date);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    dataGridView1.DataSource = dt;
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Меню form = new Меню();
            form.Show();
            this.Hide();
        }
    }
}
