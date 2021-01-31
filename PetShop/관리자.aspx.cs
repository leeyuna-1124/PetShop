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
    public partial class 관리자 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProduct();//드롭다운리스트에 바인딩
                BindProduct2();
                SetInfo();
                SetInfo2();
            }
        }
        private void SetInfo()
        {
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = "Select * from cat Where pID = @pID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@pID", DropDownList1.SelectedValue);//고양이
            //실행 및 화면표시
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                Label2.Text = rd["pID"].ToString();
                TextBox1.Text = rd["pID"].ToString();
                TextBox2.Text = rd["pName"].ToString();
                TextBox3.Text = rd["category"].ToString();
                TextBox5.Text = rd["price"].ToString();

            }
            else
            {
                Label2.Text = "아이디가 선택되지 않았습니다.";

            }
            con.Close();
        }

        private void SetInfo2()
        {
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = "Select * from dog Where pID = @pID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@pID", DropDownList2.SelectedValue);//강아지
            //실행 및 화면표시
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                Label1.Text = rd["pID"].ToString();
                TextBox4.Text = rd["pID"].ToString();
                TextBox6.Text = rd["pName"].ToString();
                TextBox7.Text = rd["category"].ToString();
                TextBox8.Text = rd["price"].ToString();
            }
            else
            {
                Label1.Text = "아이디가 선택되지 않았습니다.";

            }
            con.Close();
        }

        private void BindProduct2()//강아지
        {
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = "Select pID, pName from dog";
            SqlCommand cmd = new SqlCommand(sql, con);
            //실행 및 화면표시
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
           
            DropDownList2.DataSource = rd;
            DropDownList2.DataTextField = "pName";
            DropDownList2.DataValueField = "pID";
            DropDownList2.DataBind();//화면 갱신
            con.Close();
        }

        private void BindProduct()//고양이
        {
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = "Select pID, pName from cat";
            SqlCommand cmd = new SqlCommand(sql, con);
            //실행 및 화면표시
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            DropDownList1.DataSource = rd;
            DropDownList1.DataTextField = "pName";
            DropDownList1.DataValueField = "pID";
            DropDownList1.DataBind();//화면 갱신

            con.Close();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetInfo();
            Label2.Text = "";
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetInfo2();
            Label1.Text = "";
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem("--선택하세요--", "-1"));
        }

        protected void DropDownList2_DataBound(object sender, EventArgs e)
        {
            DropDownList2.Items.Insert(0, new ListItem("--선택하세요--", "-1"));
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //초기화
            ClearData();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            //초기화
            ClearData2();
        }

        private void ClearData()
        {
            Label2.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox5.Text = "";
        
        }

        private void ClearData2()
        {
            Label1.Text = "";
            TextBox4.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //등록(입력)
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = "Insert into cat Values(@pID, @pName, @category, @price)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@pID", TextBox1.Text);//파라미터 정의 및 값 지정
            cmd.Parameters.AddWithValue("@pName", TextBox2.Text);
            cmd.Parameters.AddWithValue("@category", TextBox3.Text);
            cmd.Parameters.AddWithValue("@price", TextBox5.Text);
            //실행 및 화면표시
            try
            {
                con.Open();
                cmd.ExecuteNonQuery(); //읽어오지 않고 실행만 한다.
                con.Close();

                Label2.Text = TextBox1.Text + "의 정보가 입력되었습니다.";
            }
            catch (Exception ex)
            {
                // Label2.Text = ex.Message;
                Response.Write(ex.Message); //메시지가 맨 위에 나옴
            }
            finally
            {
                con.Close();
            }

            BindProduct();
            ClearData();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //수정
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = @"Update cat Set pName=@pName, category=@category, price=@price
                          Where pID=@pID";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@pName", TextBox2.Text);
            cmd.Parameters.AddWithValue("@category", TextBox3.Text);
            cmd.Parameters.AddWithValue("@price", TextBox5.Text);
            cmd.Parameters.AddWithValue("@pID", TextBox1.Text);//파라미터 정의 및 값 지정
            //실행 및 화면표시
            con.Open();
            int num = cmd.ExecuteNonQuery(); //읽어오지 않고 실행만 한다.
            con.Close();
            if (num > 0)
                Label2.Text = TextBox1.Text + "의 정보가 수정되었습니다.";
            else
                Label2.Text = "수정에 실패했습니다.";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //삭제
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = @"Delete from cat Where pID=@pID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@pID", DropDownList1.SelectedValue);//파라미터 정의 및 값 지정
            //실행 및 화면표시
            con.Open();
            int num = cmd.ExecuteNonQuery(); //읽어오지 않고 실행만 한다.(입력, 삭제, 수정)
            con.Close();
            if (num > 0)
                Label2.Text = TextBox1.Text + "의 정보가 삭제되었습니다.";
            else
                Label2.Text = "삭제에 실패했습니다.";

            //드롭다운 리스트 갱신
            BindProduct();
            ClearData();
            //SetInfo();
        }
        protected void Button8_Click(object sender, EventArgs e)
        {
            //등록(입력)
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = "Insert into dog Values(@pID, @pName, @category, @price)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@pID", TextBox4.Text);//파라미터 정의 및 값 지정
            cmd.Parameters.AddWithValue("@pName", TextBox6.Text);
            cmd.Parameters.AddWithValue("@category", TextBox7.Text);
            cmd.Parameters.AddWithValue("@price", TextBox8.Text);
            //실행 및 화면표시
            try
            {
                con.Open();
                cmd.ExecuteNonQuery(); //읽어오지 않고 실행만 한다.
                con.Close();

                Label1.Text = TextBox4.Text + "의 정보가 입력되었습니다.";
            }
            catch (Exception ex)
            {
                // Label2.Text = ex.Message;
                Response.Write(ex.Message); //메시지가 맨 위에 나옴
            }
            finally
            {
                con.Close();
            }

            BindProduct2();
            ClearData2();
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            //수정
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = @"Update dog Set pName=@pName, category=@category, price=@price
                          Where pID=@pID";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@pName", TextBox6.Text);
            cmd.Parameters.AddWithValue("@category", TextBox7.Text);
            cmd.Parameters.AddWithValue("@price", TextBox8.Text);
            cmd.Parameters.AddWithValue("@pID", TextBox4.Text);//파라미터 정의 및 값 지정
            //실행 및 화면표시
            con.Open();
            int num = cmd.ExecuteNonQuery(); //읽어오지 않고 실행만 한다.
            con.Close();
            if (num > 0)
                Label1.Text = TextBox4.Text + "의 정보가 수정되었습니다.";
            else
                Label1.Text = "수정에 실패했습니다.";
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            //삭제
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령(sql문)
            string sql = @"Delete from dog Where pID=@pID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@pID", DropDownList2.SelectedValue);//파라미터 정의 및 값 지정
            //실행 및 화면표시
            con.Open();
            int num = cmd.ExecuteNonQuery(); //읽어오지 않고 실행만 한다.(입력, 삭제, 수정)
            con.Close();
            if (num > 0)
                Label1.Text = TextBox4.Text + "의 정보가 삭제되었습니다.";
            else
                Label1.Text = "삭제에 실패했습니다.";

            //드롭다운 리스트 갱신
            BindProduct2();
            ClearData2();
            //SetInfo();
        }




    }
}
