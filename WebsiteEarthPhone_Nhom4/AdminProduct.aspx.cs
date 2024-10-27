using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteEarthPhone_Nhom4
{
    public partial class AdminProduct : System.Web.UI.Page
    {
        EarthPhonedbDataContext db = new EarthPhonedbDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadData();
               // KiemTraDN();
        }
        /*
        void KiemTraDN()
        {


            if (Session["username"] != "" && Session["password"] != "") //kiểm tra user và mk có tồn tại ko
            {
                //xét username xem khớp vs csdl ko
                var data = from q in db.CauHinhDNs
                           where q.TenBien == "UserAdmin" && q.GiaTri == Session["username"]
                           select q;
                if (data != null && data.Count() > 0) // nếu nó khớp
                {
                    //kiểm tra mk khớp ko
                    var datax = from x in db.CauHinhDNs
                                where x.TenBien == "Password" && x.GiaTri == Session["password"]
                                select x;
                    if (datax == null && datax.Count() == 0) //sai mk
                    {
                        Response.Redirect("AdminLogin.aspx");
                    }
                }
                else //sai username 
                {
                    Response.Redirect("AdminLogin.aspx");
                }
            }

        }
        */
        void LoadData()
        {
            var data = from q in db.SanPhams
                       select q;
            if (data != null)
            {
                girdSanPham.DataSource = data.ToList();
                girdSanPham.DataBind();
            }
        }
        protected void girdSanPham_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if (((LinkButton)e.CommandSource).CommandName == "GetDelete")
            {
                long idselect = Convert.ToInt64(girdSanPham.DataKeys[e.Item.ItemIndex].ToString());
                var data = from q in db.SanPhams
                           where q.ID_SANPHAM == idselect
                           select q;
                if (data != null)
                {
                    SanPham ifdt = data.First();
                    db.SanPhams.DeleteOnSubmit(ifdt);
                    db.SubmitChanges();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ThongBao", "alert('Sản Phẩm " + ifdt.TEN_SANPHAM + " đã bị xóa !')", true);
                    // Kiểm tra số lượng sản phẩm còn lại 
                    if (girdSanPham.CurrentPageIndex > 0 && girdSanPham.Items.Count == 1)
                    {
                        girdSanPham.CurrentPageIndex--; // Giảm chỉ số trang nếu cần }  
                        LoadData(); // Tải lại dữ liệu }  
                    }
                    if (girdSanPham.Items.Count > 1)// nếu còn
                    {
                        LoadData();
                    }

                    // Xử lý cập nhật sản phẩm 
                    if (((LinkButton)e.CommandSource).CommandName == "GetUpdate")
                    {
                        string idcapnhat = girdSanPham.DataKeys[e.Item.ItemIndex].ToString();
                        Response.Redirect("Adminupdates.aspx?IdSanPham=" + idcapnhat);
                    }
                }
            }    
            // Xử lý cập nhật sản phẩm 
            if (((LinkButton)e.CommandSource).CommandName == "GetUpdate")
            {
                string idcapnhat = girdSanPham.DataKeys[e.Item.ItemIndex].ToString();
                Response.Redirect("Adminupdates.aspx?IdSanPham=" + idcapnhat);
            }
        }


        protected void girdSanPham_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            girdSanPham.CurrentPageIndex = e.NewPageIndex;
            LoadData();
        }

    }
}