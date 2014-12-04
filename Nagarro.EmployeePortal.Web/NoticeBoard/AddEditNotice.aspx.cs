using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Nagarro.EmployeePortal.BLL;

namespace Nagarro.EmployeePortal.Web.NoticeBoard
{
    public partial class AddEditNotice : System.Web.UI.Page
    {
        int noticeId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    Add();
                }
                else
                {
                    noticeId = Convert.ToInt32(Request.QueryString["id"]);
                    Edit(noticeId);
                }
            }
        }

        void Add()
        {
            headinglabel.Text = "Add New Notice";
            IDlabel.Visible = false;
            IDvaluelabel.Visible = false;
            postedbylabel.Visible = false;
            postedbylabelvalue.Visible = false;
        }

        void Edit(int noticeId)
        {
            headinglabel.Text = " Edit Notice";
            IDlabel.Visible = true;
            IDvaluelabel.Visible = true;
            postedbylabelvalue.Visible = true;
            postedbylabel.Visible = true;

            BLL.Notice showNotice = BLL.Notice.GetNotice(noticeId);

            IDvaluelabel.Text = showNotice.NoticeId.ToString();
            TextBox1.Text = showNotice.Title;
            TextArea1.InnerText = showNotice.Description;
            startdatebox.Text = showNotice.StartDate.ToShortDateString();
            expirationdatebox.Text = showNotice.ExpirationDate.ToShortDateString();
            postedbylabelvalue.Text = showNotice.PostedByName;

        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    BLL.Notice newNotice = new BLL.Notice();
                    newNotice.NoticeId = 0;
                    newNotice.Title = TextBox1.Text;
                    newNotice.Description = TextArea1.InnerText;
                    newNotice.StartDate = Convert.ToDateTime(startdatebox.Text);
                    newNotice.ExpirationDate = Convert.ToDateTime(expirationdatebox.Text);
                    newNotice.PostedById = (Session["CurrentPrincipal"] as EPPrincipal).EmployeeId;

                    BLL.Notice.InsertNotice(newNotice);
                    Response.Write("<script>alert('Updated Successfully');</script>");
                }
                else
                {
                    BLL.Notice editNotice = new BLL.Notice();
                    editNotice.NoticeId = Convert.ToInt32(IDvaluelabel.Text);
                    editNotice.Title = TextBox1.Text;
                    editNotice.Description = TextArea1.InnerText;
                    editNotice.StartDate = Convert.ToDateTime(startdatebox.Text);
                    editNotice.ExpirationDate = Convert.ToDateTime(expirationdatebox.Text);
                    BLL.Notice.UpdateNotice(editNotice);
                    Response.Write("<script>alert('Updated Successfully');</script>");
                }
            }
            catch (ApplicationException ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Default.aspx");
        }

    }
}