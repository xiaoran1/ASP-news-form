using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class formpage_formbody : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label welcomelabel = new Label();
        if (Session["username"] != null)
        {
            welcomelabel.Text = "Welcome! "+Session["username"].ToString();
            form1.Controls.Add(welcomelabel);
            Button logoutbtn = new Button();
            logoutbtn.Text = "logout";
            logoutbtn.Click += new EventHandler(this.logoutbtn_Click);
            form1.Controls.Add(logoutbtn);
        }
        else
        {
            Response.Redirect("../loginpage/login.aspx");
        }
    }

    protected void logoutbtn_Click(object sender, EventArgs e)
    {
        Session.Remove("username");
        Response.Redirect("../loginpage/login.aspx");
    }
}