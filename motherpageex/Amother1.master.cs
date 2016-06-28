using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class motherpageex_Amother1 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel pnlitem;
        Label labfilename;
        HyperLink hlinkalltext, hlinklines;
        string[] fnamearray = Directory.GetFiles(MapPath("txtfiles"), "*.txt");
        foreach (string fname in fnamearray)
        {
            labfilename = new Label();
            labfilename.Text = Path.GetFileName(fname);
            hlinkalltext = new HyperLink();
            hlinkalltext.Text = "read all";
            hlinkalltext.NavigateUrl = "readallfile.aspx?filename=" + Path.GetFileName(fname);
            hlinklines = new HyperLink();
            hlinklines.Text = "read by lines";
            hlinklines.NavigateUrl = "readallline.aspx?filename=" + fname;
            pnlitem = new Panel();
            pnlitem.Controls.Add(labfilename);
            pnlitem.Controls.Add(hlinkalltext);
            pnlitem.Controls.Add(hlinklines);
            div_right.Controls.Add(pnlitem);
        }
    }
}
