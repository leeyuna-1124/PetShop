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
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = "Select * from cat Where pName Like'%' + @pName+ '%' ";
    
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@pName", TextBox1.Text);//파라미터 정의 및 값 지정
            //실행 및 화면표시
            con.Open();
            GridView1.EmptyDataText = "";
            SqlDataReader rd = cmd.ExecuteReader();
            Label2.Text = TextBox1.Text;
            while (rd.Read())
            {
                GridView1.EmptyDataText += string.Format("{0}, {2}, {3} <br/>", rd[0], rd[1], rd[2], rd[3]);
            }
            if (GridView1.EmptyDataText == "" )
            {
                GridView1.EmptyDataText = "존재하지 않는 상품입니다.";
            }
            rd.Close();
            con.Close();
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = "Select * from dog Where pName Like'%' + @pName+ '%' ";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@pName", TextBox2.Text);//파라미터 정의 및 값 지정
            //실행 및 화면표시
            con.Open();
            GridView2.EmptyDataText = "";
            SqlDataReader rd = cmd.ExecuteReader();
            Label3.Text = TextBox2.Text;
            while (rd.Read())
            {
                GridView2.EmptyDataText += string.Format("{0}, {2}, {3} <br/>", rd[0], rd[1], rd[2], rd[3]);
            }
            if (GridView2.EmptyDataText == "")
            {
                GridView2.EmptyDataText = "존재하지 않는 상품입니다.";
            }
            rd.Close();
            con.Close();
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            //장바구니에 넣기
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = "Insert into cart Values(@userID, @mine)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@userID", Page.User.Identity.Name);//파라미터 정의 및 값 지정
            cmd.Parameters.AddWithValue("@Mine", DetailsView1.SelectedValue);

            con.Open();
            int a = cmd.ExecuteNonQuery();
            con.Close();

            if (a > 0)
            {
                string str = "<script> alert('장바구니에 담겼습니다.');";
                str += "location.href = '/search.aspx'; </script>";
                Response.Write(str);
            }
            else

                //실행 및 화면표시
                try
            {
                con.Open();
                cmd.ExecuteNonQuery(); //읽어오지 않고 실행만 한다.
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message); //메시지가 맨 위에 나옴
            }
            finally
            {
                con.Close();
            }
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            //장바구니에 넣기
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = "Insert into cart Values(@userID, @mine)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@userID", Page.User.Identity.Name);//파라미터 정의 및 값 지정
            cmd.Parameters.AddWithValue("@Mine", DetailsView2.SelectedValue);

            con.Open();
            int a = cmd.ExecuteNonQuery();
            con.Close();

            if (a > 0)
            {
                string str = "<script> alert('장바구니에 담겼습니다.');";
                str += "location.href = '/search.aspx'; </script>";
                Response.Write(str);
            }
            else

                //실행 및 화면표시
                try
            {
                con.Open();
                cmd.ExecuteNonQuery(); //읽어오지 않고 실행만 한다.
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message); //메시지가 맨 위에 나옴
            }
            finally
            {
                con.Close();
            }
        }
    }
    }
    
