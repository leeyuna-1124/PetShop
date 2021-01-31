using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;//추가
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace PetShop
{
    public partial class PetShop : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                Label1.Text = Page.User.Identity.Name + " 님";
                Button2.Visible = true;
                Button8.Visible = true;
                Button1.Visible = false;
                Button9.Visible = false;
               
            }
            else
            {
                Label1.Text = "";
                Button1.Visible = true;
                Button2.Visible = false;
                Button8.Visible = false;
                Button9.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect(FormsAuthentication.DefaultUrl); //Home으로 보내기
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //로그인 버튼
            Response.Redirect("~/Login.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            //회원가입 버튼
            Response.Redirect("~/Register.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            //정보 변경 버튼
            Response.Redirect("~/MemberOnly/Modify.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {   //로고 버튼
            Response.Redirect("~/Home.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/관리자.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/search.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/회원확인.aspx");
        }
    }
}