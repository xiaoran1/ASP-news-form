using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

public partial class motherpageex_readallfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["filename"] != null)
            {
                
                string filepath = Path.Combine(MapPath("txtfiles"), Request["filename"]);
                Response.Write(filepath);
                if (File.Exists(filepath))
                {
                    textcontent.Text = File.ReadAllText(filepath, Encoding.Default);
                }
                else
                {
                    Response.Redirect("child01.aspx");
                }
            }
            else
            {
               Response.Redirect("child01.aspx");
            }
        }
    }
    protected void buttonsave_Click(object sender, EventArgs e)
    {
        string filepath = Path.Combine(MapPath("txtfiles"), Request["filename"]);
        File.WriteAllText(filepath, textcontent.Text, Encoding.Default);
    }
}