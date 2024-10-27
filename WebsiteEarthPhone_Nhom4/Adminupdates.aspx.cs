using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO; // Thêm namespace này để sử dụng Path  

namespace WebsiteEarthPhone_Nhom4
{
    public partial class Adminupdates : System.Web.UI.Page
    {
        EarthPhonedbDataContext db = new EarthPhonedbDataContext();
        public static SanPham ifDienThoai = new SanPham();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadData();
                //KiemTraDN();
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
        // Phương thức để tải dữ liệu sản phẩm  
        void LoadData()
        {
            try
            {
                // Kiểm tra nếu có ID sản phẩm trong query string  
                if (!string.IsNullOrEmpty(Request.QueryString["IdSanPham"]))
                {
                    long Iddienthoai = Convert.ToInt64(Request.QueryString["IdSanPham"]);
                    var data = from q in db.SanPhams
                               where q.ID_SANPHAM == Iddienthoai
                               select q;

                    if (data != null && data.Count() > 0)
                    {
                        ifDienThoai = data.First();
                        lblThongBao.Text = "Bạn đang cập nhật sản phẩm : " + ifDienThoai.TEN_SANPHAM;

                        // Gán giá trị cho các trường điều khiển  
                        txtTenSP.Text = ifDienThoai.TEN_SANPHAM;
                        txtGia.Text = ifDienThoai.GIA;
                        txtMoTa.Text = ifDienThoai.MOTASANPHAM;
                        FCKChiTiet.Value = HttpUtility.HtmlDecode(ifDienThoai.ChiTietSanPham);
                        FCKCauHinh.Value = HttpUtility.HtmlDecode(ifDienThoai.CAUHINH);

                    }
                }
            }
            catch (Exception)
            {
                // Chuyển hướng đến trang lỗi nếu có ngoại lệ xảy ra  
                Response.Redirect("error.html");
            }
        }

        // Sự kiện khi nút Cập Nhập được nhấn  
        protected void btnCapNhap_Click(object sender, EventArgs e)
        {
            long idSanPham = Convert.ToInt64(ifDienThoai.ID_SANPHAM);
            var data = from q in db.SanPhams
                       where q.ID_SANPHAM == idSanPham
                       select q;
            if (data != null)
            {
                SanPham ifcapnhat = data.First();

                // Cập nhật các thuộc tính của sản phẩm  
                ifcapnhat.TEN_SANPHAM = txtTenSP.Text;
                ifcapnhat.GIA = txtGia.Text;
                ifcapnhat.MOTASANPHAM = txtMoTa.Text;

                // Kiểm tra nếu có file hình ảnh được tải lên  
                if (fileHinhAnh.HasFile)
                {  
                    // Lưu ảnh  
                    ifcapnhat.ANH = fileHinhAnh.FileName;
                    fileHinhAnh.SaveAs(Server.MapPath("img\\products\\") + fileHinhAnh.FileName);
                }
                // Cập nhật chi tiết sản phẩm  
                ifcapnhat.ChiTietSanPham = HttpUtility.HtmlEncode(FCKChiTiet.Value);
                ifcapnhat.CAUHINH= HttpUtility.HtmlEncode(FCKCauHinh.Value);

                db.SubmitChanges();  // Lưu thay đổi vào cơ sở dữ liệu  
                lblThongBao.Text = "Sản phẩm " + ifDienThoai.TEN_SANPHAM + " đã được cập nhật !";
            }
        }

        // Sự kiện khi nút Hủy được nhấn  
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Chuyển hướng về trang danh sách sản phẩm (hoặc trang khác)  
            Response.Redirect("AdminProduct.aspx");
        }  
    }
}