using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginpage_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        failedinfo.Visible = false;
        if (Session["username"] != null)
        {
            Rusername.Text = Session["username"].ToString();
            Session.Remove("username");
        }
    }
    protected void Rregisterbtn_Click(object sender, EventArgs e)
    {
        string password = Rpassword.Text;
        string rpassword = repeatpassword.Text;
        string username = Rusername.Text;
        string email = Remail.Text;
        failedinfo.Style.Add("color", "red");
        if (password == "" || rpassword == "" || username == "" || email == "")
        {
            failedinfo.Visible = true;
            failedinfo.Text = "Each field must be filled, cannot be null";
        }
        else
        {
            if (!password.Equals(rpassword, StringComparison.OrdinalIgnoreCase))
            {
                failedinfo.Visible = true;
                failedinfo.Text = "Password not match! Please check again.";
            }
            else
            {
                DataTable samename = SqlHelper.ExecuteDataTable("Select * from User_Info where username=@username",
                    new SqlParameter("@username", username));
                if (samename.Rows.Count > 0)
                {
                    failedinfo.Visible = true;
                    failedinfo.Text = "Username been used already! Please change.";
                }
                else
                {
                    DataTable sameemail = SqlHelper.ExecuteDataTable("Select * from User_Info where email=@email",
                        new SqlParameter("@email", email));
                    if (sameemail.Rows.Count > 0)
                    {
                        failedinfo.Visible = true;
                        failedinfo.Text = "email address been used already! Please change.";
                    }
                    else
                    {
                        do_register(username, password, email);
                        failedinfo.Visible = true;
                        failedinfo.Style.Add("color", "green");
                        failedinfo.Text = "Register Success!";
                    }
                }
            }
        }
    }

    protected void do_register(string username, string password, string email)
    {
        SqlHelper.ExecuteNonQuery("Insert into User_Info(username,password,email) values(@username,@password,@email)",
            new SqlParameter("@username", username),
            new SqlParameter("@password", password),
            new SqlParameter("@email", email));
    }
    protected void Rresetbtn_Click(object sender, EventArgs e)
    {
        Rpassword.Text = "";
        repeatpassword.Text = "";
        Rusername.Text = "";
        Remail.Text = "";
    }
}