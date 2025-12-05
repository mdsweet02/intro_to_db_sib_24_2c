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
    public partial class Стоимость_деталей : Form
    {
        public Стоимость_деталей()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string query = "SELECT [Наименование] ,[Цена] FROM [dbo].[Склад]";



            string connectionString = @"Data Source=DESKTOP-2UME45M;Initial Catalog=Дошимов_Бекзат_Баурыжанович;Integrated Security=True";


            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                dataGridView1.DataSource = dt;
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
