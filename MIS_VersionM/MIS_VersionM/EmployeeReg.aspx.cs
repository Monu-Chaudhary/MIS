using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MIS_VersionM
{
    public partial class EmployeeReg : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection(@"Data Source=192.168.1.177,49170;Initial Catalog=MIS_VersionM;Persist Security Info=True;User ID=sa;Password=Monu");
        protected void Page_Load(object sender, EventArgs e)
        {

            
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            connect.Open();
            SqlCommand cmd = connect.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "insert into Employee (EMPID, EmpName, EmpEmail, EmpAddress, EmpPhone) values (@EID, @EName, @EEmail, @EAddress, @EPhone)";
                //['" +txtEmpID.Text+ "','"+TextBox4.Text+"','"+TextBox1.Text+"','"+TextBox2.Text+"','"+TextBox3.Text+"']";
            cmd.Parameters.AddWithValue("@EID", txtEmpID.Text);
            cmd.Parameters.AddWithValue("@EName", TextBox0.Text);
            cmd.Parameters.AddWithValue("@EEmail", TextBox1.Text);
            cmd.Parameters.AddWithValue("@EAddress", TextBox2.Text);
            cmd.Parameters.AddWithValue("@EPhone", TextBox3.Text);
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
           // Response.Redirect("EmployeeReg.aspx?EID=" + gr.Cells[1].Text);
            txtEmpID.Text = gr.Cells[1].Text;
            TextBox0.Text = gr.Cells[2].Text;
            TextBox1.Text = gr.Cells[3].Text;
            TextBox2.Text = gr.Cells[4].Text;
            TextBox3.Text = gr.Cells[5].Text;

        }

        

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                string id = GridView1.Rows[index].Cells[1].Text.ToString();
                Response.Write(id);
              
                connect.Open();
                SqlCommand cmd = connect.CreateCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "delete from Employee where EMPID=@EID";
                cmd.Parameters.AddWithValue("@EID", id);
                cmd.ExecuteNonQuery();
                connect.Close();
            }
        }
    }
}