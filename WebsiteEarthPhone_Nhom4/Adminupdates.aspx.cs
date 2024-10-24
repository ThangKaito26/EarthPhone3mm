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
        }
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
                        txtCauHinh.Text = ifDienThoai.CAUHINH;
                        txtMoTa.Text = ifDienThoai.MOTASANPHAM;
                        FCKChiTiet.Value = HttpUtility.HtmlDecode(ifDienThoai.ChiTietSanPham);
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
                ifcapnhat.CAUHINH = txtCauHinh.Text;
                ifcapnhat.MOTASANPHAM = txtMoTa.Text;

                // Kiểm tra nếu có file hình ảnh được tải lên  
                if (fileHinhAnh.HasFile)
                {
                    string fileName = Path.GetFileName(fileHinhAnh.FileName);
                    string filePath = Server.MapPath("~/images/" + fileName); // Lưu ảnh vào thư mục 'images'  

                    // Lưu ảnh  
                    fileHinhAnh.SaveAs(filePath);

                    // Cập nhật đường dẫn hình ảnh  
                    ifcapnhat.ANH = "~/images/" + fileName;
                }

                // Cập nhật chi tiết sản phẩm  
                ifcapnhat.ChiTietSanPham = HttpUtility.HtmlEncode(FCKChiTiet.Value);

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