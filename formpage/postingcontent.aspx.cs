using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class formpage_postingcontent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["postingid"] != null)
            {
                Response.Write(Request.QueryString["postingid"].ToString());
                int Postingid = Convert.ToInt32(Request.QueryString["postingid"]);
                DataTable dt = SqlHelper.ExecuteDataTable(@"select 
                Comments.content, Comments.postdate, HeadIcons.iconsrc, User_Info.username from 
                Comments  INNER JOIN User_Info ON Comments.authorId = User_Info.Id
                INNER JOIN HeadIcons ON HeadIcons.headiconId = User_Info.headiconid
                Where Comments.parentId = @parentId 
                and Comments.ischild=0", new SqlParameter("@parentId", Postingid));
                Commentsrepeater.DataSource = dt;
                Commentsrepeater.DataBind();
            }

        }

    }
}