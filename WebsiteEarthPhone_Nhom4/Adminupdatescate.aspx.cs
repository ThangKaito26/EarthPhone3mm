using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteEarthPhone_Nhom4
{
    public partial class Adminupdatescate : System.Web.UI.Page
    {
        EarthPhonedbDataContext db = new EarthPhonedbDataContext();
        public static DanhMuc1 ifDanhMuc = new DanhMuc1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                LoadData();
        }

        void LoadData()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["IdDanhMuc"]))
            {
                long Iddienthoai = Convert.ToInt64(Request.QueryString["IdDanhMuc"]);
                var data = from q in db.DanhMuc1s
                           where q.ID_DANHMUC == Iddienthoai
                           select q;

                if (data != null && data.Count() > 0)
                {
                    ifDanhMuc = data.First();
                    lblThongBaoDM.Text = "Bạn đang cập nhật danh muc :" + ifDanhMuc.TEN_DANHMUC;
                    //lblThongBao.Text = "Bạn đang cập nhật danh muc : " + ifDanhMuc.TEN_DANHMUC;

                    // Gán giá trị cho các trường điều khiển  
                    txtTenDM.Text = ifDanhMuc.TEN_DANHMUC;
                    txtHienThi.Text = ifDanhMuc.HIENTHI.HasValue ? ifDanhMuc.HIENTHI.Value.ToString() : "";
                }
            }
        }

        protected void btnCapNhap_Click(object sender, EventArgs e)
        {
            if (ifDanhMuc != null && ifDanhMuc.ID_DANHMUC > 0)
            {
                long idSanPham = Convert.ToInt64(ifDanhMuc.ID_DANHMUC);
                var data = from q in db.DanhMuc1s
                           where q.ID_DANHMUC == idSanPham
                           select q;
                if (data != null && data.Count()>0)
                {
                    DanhMuc1 ifcapnhat = data.First();

                    // Cập nhật các thuộc tính của sản phẩm  
                    ifcapnhat.TEN_DANHMUC = txtTenDM.Text;
                    ifcapnhat.HIENTHI = Convert.ToInt32(txtHienThi.Text);

                    db.SubmitChanges();  // Lưu thay đổi vào cơ sở dữ liệu  
                    lblThongBaoDM.Text = " Danh muc " + ifDanhMuc.TEN_DANHMUC + "đã được cập nhật !";
                    //lblThongBao.Text = "Danh muc " + ifDanhMuc.TEN_DANHMUC + " đã được cập nhật !";
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminCatetory.aspx");
        }
    }
}