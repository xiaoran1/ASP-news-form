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
                int Postingid = Convert.ToInt32(Request.QueryString["postingid"]);
                DataTable dt = SqlHelper.ExecuteDataTable(@"select Comments.commentId,
                Comments.content, Comments.postdate, HeadIcons.iconsrc, User_Info.username from 
                Comments  INNER JOIN User_Info ON Comments.authorId = User_Info.Id
                INNER JOIN HeadIcons ON HeadIcons.headiconId = User_Info.headiconid
                Where Comments.parentId = @parentId 
               ", new SqlParameter("@parentId", Postingid));
                Response.Write(dt.Rows.Count+" comments");
                Commentsrepeater.DataSource = dt;
                Commentsrepeater.DataBind();
            }

        }
    }
    protected void postcomment_Click(object sender, EventArgs e)
    {
        int postingid = Convert.ToInt32(Request.QueryString["postingid"]);
        if (Msg.Value.Length<50)
        {
            Msg.Value = "too short!";
        }
        else
        {
            int rownum;
            if (Session["userid"] != null)
            {
                rownum = SqlHelper.ExecuteNonQuery(@"Insert into Comments (content, authorId, parentId, postdate, imageId, ischild)
            values(@content, @authorId, @parentId,@postdate,@imageId,@ischild)",
                new SqlParameter("@content", Msg.Value),
                new SqlParameter("@authorId", Convert.ToInt32(Session["userid"])),
                new SqlParameter("@parentId", postingid),
                new SqlParameter("@postdate", DateTime.Now.ToString()),
                new SqlParameter("@imageId", ""),
                new SqlParameter("@ischild", false));
            }
            else
            {
                rownum = SqlHelper.ExecuteNonQuery(@"Insert into Comments (content, authorId, parentId, postdate, imageId, ischild)
            values(@content, @authorId, @parentId,@postdate,@imageId,@ischild)",
                new SqlParameter("@content", Msg.Value),
                new SqlParameter("@authorId", 8),
                new SqlParameter("@parentId", postingid),
                new SqlParameter("@postdate", DateTime.Now.ToString()),
                new SqlParameter("@imageId", ""),
                new SqlParameter("@ischild", false));
            }
            Response.Redirect("postingcontent.aspx?postingid=" + Request.QueryString["postingid"]);
        }
    }
}