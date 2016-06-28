using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginpage_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        logfaillb.Visible = false;
        registerlb.Visible = false;
        registerbtn.Visible = false;
        usernametbox.Style.Remove("border-style");
        usernametbox.Style.Remove("border-color");
        passwordtbox.Style.Remove("border-style");
        passwordtbox.Style.Remove("border-color");
    }
    protected void Loginbtn_Click(object sender, EventArgs e)
    {
        string username = usernametbox.Text;
        string password = passwordtbox.Text;
        DataTable userresult;
        userresult = SqlHelper.ExecuteDataTable("Select * from User_Info  where username=@username and password = @password",
            new SqlParameter("@username", username),
            new SqlParameter("@password", password));
        if (userresult.Rows.Count == 1)
        {
            Session["username"] = usernametbox.Text.Trim();
            Response.Write("login success!");
            Response.Redirect("../formpage/formlistview.aspx");
        }else{
            usernametbox.Style.Add("border-style", "solid");
            usernametbox.Style.Add("border-color", "red");
            passwordtbox.Style.Add("border-style", "solid");
            passwordtbox.Style.Add("border-color", "red");
            logfaillb.Style.Add("color", "red");
            logfaillb.Visible = true;
            registerlb.Visible = true;
            registerbtn.Visible = true;
        }
    }
    protected void resetbtn_Click(object sender, EventArgs e)
    {
        usernametbox.Text = "";
        passwordtbox.Text = "";
    }
    protected void registerbtn_Click(object sender, EventArgs e)
    {
        Session["username"] = usernametbox.Text.Trim();
        Response.Redirect("register.aspx");
    }
}