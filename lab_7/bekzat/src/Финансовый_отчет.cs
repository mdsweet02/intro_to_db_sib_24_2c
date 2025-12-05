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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace База_данных
{
    public partial class Финансовый_отчет : Form
    {
        public Финансовый_отчет()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            


            string date = textBox1.Text;

            string query = "SELECT zu.[ФИО] AS Клиент, c.[Дата] AS Дата, c.[Сумма] AS Оплата " +
               "FROM dbo.Оплата c " +
               "LEFT JOIN dbo.Клиенты zu ON zu.[ИИН клиента] = c.[ИИН клиента] " +
               "WHERE DAY(c.[Дата]) = @dayValue;";

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
