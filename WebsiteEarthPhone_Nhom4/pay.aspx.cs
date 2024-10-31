using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteEarthPhone_Nhom4
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        EarthPhonedbDataContext db = new EarthPhonedbDataContext();
        public static SanPham ifDienThoai = new SanPham();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadData();
        }
        void LoadData()
        {
            if (Request.QueryString["IdSanPham"] != "")
            {
                long Iddienthoai = Convert.ToInt64(Request.QueryString["IdSanPham"]);
                var data = from q in db.SanPhams
                           where q.ID_SANPHAM == Iddienthoai
                           select q;

                if (data != null && data.Count() > 0)
                {
                    ifDienThoai = data.First();
                    lblTenDT.Text = "Đặt Điện Thoại " + ifDienThoai.TEN_SANPHAM;
                }
            }
        }

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            string hoTen = txeHoTen.Text;
            string email = txtEmail.Text;
            string soDT = txtSDT.Text;
            string diaChi = txtDiaChi.Text;
            string soLuong = txtSoLuong.Text;

            DatHang ifdathang = new DatHang();
            ifdathang.MaHang = ifDienThoai.ID_SANPHAM;
            ifdathang.SOLUONG = Convert.ToInt32(txtSoLuong.Text);
            ifdathang.HoTen = txeHoTen.Text;
            ifdathang.DiaChi = txtDiaChi.Text;
            ifdathang.TinhTrang = 0;

            // Convert to bigint (long)
            ifdathang.SoDT = Convert.ToInt64(txtSDT.Text); // Assuming SoDT is bigint in your database


            db.DatHangs.InsertOnSubmit(ifdathang);
            db.SubmitChanges();

            lblTenDT.Text = "Đã đặt điện thoại " + ifDienThoai.TEN_SANPHAM + "thành công !";
            lblTenDT.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Thông Báo", "alert('Đơn hàng đang được xử lí ! Chúng tôi sẽ liên hệ cho bạn sớm nhất'), window.location.href = 'Home.aspx';", true);
        }
    }
}