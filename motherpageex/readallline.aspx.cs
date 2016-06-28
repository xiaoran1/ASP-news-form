using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
public partial class motherpageex_readallline : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string filepath = getpath();
        string[] contentarray = File.ReadAllLines(filepath, Encoding.Default);
        TextBox tb;
        Response.Write("Version: " + System.Environment.Version.ToString());
        foreach (string content in contentarray)
        {
            tb = new TextBox();
            tb.Text = content;
            txtholder.Controls.Add(tb);
        }

    }

    private string getpath()
    {
        string finalpath = "";
        if (Request["filename"] != null)
        {
            finalpath = Path.Combine(MapPath("txtfiles"), Request["filename"]);
        }
        else
        {
            Response.Redirect("child01.aspx");
        }
        if (!File.Exists(finalpath))
        {
            Response.Redirect("child01.aspx");
        }
        return finalpath;
        
    }
    protected void savebtn_Click(object sender, EventArgs e)
    {
        string content = "";
        foreach (Control control in txtholder.Controls)
        {
            if(control is TextBox){
                content += ((TextBox)control).Text + "\u0081";
            }
        }
        content = content.Substring(0, content.Length - 1);
        string[] linearray = content.Split('\u0081');
        string filepath = Path.Combine(MapPath("txtfiles"), Request["filename"]);
        File.WriteAllLines(filepath, linearray, Encoding.Default);

    }
}