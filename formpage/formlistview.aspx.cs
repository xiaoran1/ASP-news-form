using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class formpage_formlistview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable drs = SqlHelper.ExecuteDataTable("select * from Posting_Class");
            foreach (DataRow dr in drs.Rows)
            {
                ListItem li = new ListItem();
                li.Text = dr["classname"].ToString();
                li.Value = dr["classid"].ToString();
                NewsClassList.Items.Add(li);
            }
        }
    }
    protected void NewsClassList_Click(object sender, BulletedListEventArgs e)
    {
        Session["newsclass"] = NewsClassList.Items[e.Index].Value;
    }
}