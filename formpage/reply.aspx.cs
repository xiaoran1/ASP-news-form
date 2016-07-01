using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class formpage_reply : System.Web.UI.Page
{
    private int commentid;
    private Boolean ischild = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write(ViewState["rownum"]!=null);
        if (ViewState["rownum"] != null)
        {
            Label1.Text = ViewState["rownum"].ToString();
        }
        if (Request.QueryString["commentid"] != null)
        {
            commentid = Convert.ToInt32(Request.QueryString["commentid"]);
            ischild = true;
        }
        else if (Request.QueryString["postingid"] != null)
        {
            commentid = Convert.ToInt32(Request.QueryString["commentid"]);
        }
        else
        {
            Response.Redirect("formlistview.aspx");
        }
        DataTable replycontent = SqlHelper.ExecuteDataTable(@"select 
                Comments.content, User_Info.username,Comments.ischild
                from Comments Inner join User_Info ON Comments.authorId = User_Info.Id 
                where Comments.commentId=@commentId",
            new SqlParameter("@commentid", commentid));
        DataRow authorcontent = replycontent.Rows[0];
        replyto.Text = "@" + authorcontent["username"] + ":" + authorcontent["content"].ToString();
    }
    protected void postcomment_Click(object sender, EventArgs e)
    {
        int rownum = 0;
        if (Session["userid"] != null)
        {
            rownum = SqlHelper.ExecuteNonQuery(@"Insert into Comments (content, authorId, parentId, postdate, imageId, ischild)
            values(@content, @authorId, @parentId,@postdate,@imageId,@ischild)",
            new SqlParameter("@content", TextBox1.Text),
            new SqlParameter("@authorId", Convert.ToInt32(Session["userid"])),
            new SqlParameter("@parentId", commentid),
            new SqlParameter("@postdate", DateTime.Now.ToString()),
            new SqlParameter("@imageId", ""),
            new SqlParameter("@ischild", ischild));
        }
        else
        {     
            rownum = SqlHelper.ExecuteNonQuery(@"Insert into Comments (content, authorId, parentId, postdate, imageId, ischild)
            values(@content, @authorId, @parentId,@postdate,@imageId,@ischild)",
            new SqlParameter("@content", TextBox1.Text),
            new SqlParameter("@authorId",8),
            new SqlParameter("@parentId", commentid),
            new SqlParameter("@postdate", DateTime.Now.ToString()),
            new SqlParameter("@imageId", ""),
            new SqlParameter("@ischild", ischild));
        }
        this.ViewState["rownum"] = rownum;
    }
}