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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //이미 인증이 되어있는지 체크
            if (Page.User.Identity.IsAuthenticated)
                Response.Redirect(FormsAuthentication.DefaultUrl);//HomePage로 보냄
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            //로그인 버튼
            if (IsAuthenticated(TextBox2.Text, TextBox3.Text))
            { //DB에 존재하는 사용자인가?

                FormsAuthentication.RedirectFromLoginPage(TextBox2.Text, CheckBox1.Checked);
            }
            else
            {
                Label2.Text = "틀린 정보입니다.";
            }
        
        }
        private bool IsAuthenticated(string userID, string password)
        {
            //DB에 연동하여 확인 작업 필요
            bool result = false;

            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령
            string sql = @"Select * from Customer 
                           Where UserID=@UserID and Password=@Password";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.Parameters.AddWithValue("@Password", password);
            //실행
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
                result = true;
            else
                result = false;

            rd.Close();
            con.Close();

            return result;
        }
    }
}