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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            //등록버튼
            if (IsMemberExists())
                Label2.Text = "이미 사용중인 아이디입니다.<br/>다른 아이디를 사용해주세요.";
            else
                AddMember();
        }
        private void AddMember()
        {
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령
            string sql = @"Insert into Customer Values (@UserID, @Password, @Name, @Phone)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@UserID", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Name", TextBox5.Text);
            cmd.Parameters.AddWithValue("@Phone", TextBox6.Text);

            //실행
            con.Open();
            int a = cmd.ExecuteNonQuery();
            con.Close();

            if (a > 0)
            {
                FormsAuthentication.SetAuthCookie(TextBox2.Text, false);//인증쿠키를 생성
                string str = "<script> alert('회원에 가입되셨습니다.');";
                str += "location.href = '/Home.aspx'; </script>";
                Response.Write(str);
            }
            else
                Label2.Text = "회원가입에 실패했습니다.";
        }

        private bool IsMemberExists()
        {
            bool result = true;
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령
            string sql = @"Select * from Customer Where UserID=@UserID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@UserID", TextBox2.Text);
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

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            //중복확인 버튼
            string str = "<script> window.open('FindID.aspx?id=" + TextBox2.Text +
                "', 'myWindow', 'top=200, left=200, width=400, height=250'); </script>";
            Response.Write(str);
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            if (IsMemberExists())
                Label2.Text = "이미 사용중인 아이디입니다.<br/>다른 아이디를 사용해주세요.";
            else
                AddMember();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}