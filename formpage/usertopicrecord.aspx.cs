using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class formpage_usertopicrecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null)
        {
            if (PreviousPage.IsCrossPagePostBack)
            {
                TextBox txt = (TextBox)PreviousPage.FindControl("title");
                lbtitle.Text = txt.Text;
                Calendar cal = (Calendar)PreviousPage.FindControl("Calendar1");
                lbdate.Text = cal.SelectedDate.ToLongDateString();
                ListBox lbox = (ListBox)PreviousPage.FindControl("candidatelist");
                lbcandiate.Text = getmember(lbox);

            }
        }
    }

    private string getmember(ListBox lbox)
    {
        string memberstring = "";
        foreach (ListItem candidate in lbox.Items)
        {
            if (candidate.Selected)
            {
                memberstring += candidate.Value;
                memberstring += ",<br/>";
            }
        }
        return memberstring;
    }
}