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
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           //Label lbl = (Label)Master.FindControl("Label1");
            
            Label kk = Label2;
            kk.Text = Page.User.Identity.Name;
           


            }

        protected void Button10_Click(object sender, EventArgs e)
        {
            //장바구니에서 삭제
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = "delete from cart where mine=@mine";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@userID", Page.User.Identity.Name);//파라미터 정의 및 값 지정
            cmd.Parameters.AddWithValue("@Mine", DetailsView1.SelectedValue);

            con.Open();
            int a = cmd.ExecuteNonQuery();
            con.Close();

            if (a > 0)
            {
                string str = "<script> alert('삭제되었습니다.');";
                str += "location.href = '/cart.aspx'; </script>";
                Response.Write(str);
            }else

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
