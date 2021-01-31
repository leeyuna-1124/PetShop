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
    public partial class cat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            //Label masterlbl = (Label)Master.FindControl("Label1");

            //장바구니에 넣기
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = "Insert into cart Values(@userID, @mine)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@userID",Page.User.Identity.Name);//파라미터 정의 및 값 지정
            cmd.Parameters.AddWithValue("@Mine", DetailsView1.SelectedValue);

            con.Open();
            int a = cmd.ExecuteNonQuery();
            con.Close();

            if (a > 0)
            {
                string str = "<script> alert('장바구니에 담겼습니다.');";
                str += "location.href = '/cat.aspx'; </script>";
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