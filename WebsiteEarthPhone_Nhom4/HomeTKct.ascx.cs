using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteEarthPhone_Nhom4
{
    public partial class HomeTKct : System.Web.UI.UserControl
    {
        EarthPhonedbDataContext db = new EarthPhonedbDataContext();
        public static List<SanPham> listTK = new List<SanPham>();
        public static List<SanPham> listSPM = new List<SanPham>();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
            LoadDataspm();
        }
        void LoadData()
        {
            string strTimKiem = Request.QueryString["GiaTriTim"];
            var data = from q in db.SanPhams
                       where q.TEN_SANPHAM.Contains(strTimKiem)
                       select q;
            if (data != null && data.Count() > 0)
            {
                listTK = data.ToList();
            }

            lblTenDanhMuc.Text = "Kết Quả Tìm Sản Phẩm : " + strTimKiem;
        }

        void LoadDataspm()
        {
            var data = from q in db.SanPhams
                       where q.SanPhamMoi == 1
                       select q;
            if (data != null && data.Count() > 0)
            {
                listSPM = data.ToList();
            }
        }
    }
}