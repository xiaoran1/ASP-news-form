using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class formpage_userprofile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null)
        {
            if (PreviousPage.IsCrossPagePostBack)
            {
                TextBox tb = (TextBox)PreviousPage.FindControl("passinfo");
                Label1.Text = tb.Text;
            }
        }
    }
}