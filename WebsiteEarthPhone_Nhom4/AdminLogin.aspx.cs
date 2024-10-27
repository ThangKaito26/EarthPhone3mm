using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteEarthPhone_Nhom4
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            EarthPhonedbDataContext db = new EarthPhonedbDataContext();
            var data = from q in db.CauHinhDNs
                       where q.TenBien == "UserAdmin" && q.GiaTri == txtUser.Text
                       select q;
            if (data != null && data.Count() > 0)
            {
                var datax = from x in db.CauHinhDNs
                            where x.TenBien == "Password" && x.GiaTri == txtMK.Text
                            select x;
                if (datax != null && datax.Count() > 0)
                {
                    Session["username"] = txtUser.Text;
                    Session["password"] = txtMK.Text;
                    Response.Redirect("AdminProduct.aspx");
                }
                else
                {
                    lblThongBaoDN.Text = "Sai mật khẩu";
                }
            }
            else
            {
                lblThongBaoDN.Text = "Sai Ten Dang Nhap";
            }
        }

    }
}