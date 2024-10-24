using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteEarthPhone_Nhom4
{
    public partial class products : System.Web.UI.UserControl
    {
        EarthPhonedbDataContext db = new EarthPhonedbDataContext();
        public static SanPham ifDienThoai = new SanPham();
        public static List<MauSanPham> Colors = new List<MauSanPham>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Load data only on the first page load
            {
                LoadData();
                loadimg();
            }
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
                }
            }
        }

        void loadimg()
        {
            if (ifDienThoai != null && ifDienThoai.ID_SANPHAM > 0)
            {
                var data = from q in db.MauSanPhams
                           where q.ID_SANPHAM == ifDienThoai.ID_SANPHAM
                           select q;

                if (data != null && data.Count() > 0)
                {
                    Colors = data.ToList();
                }
            }  
        }
    }
}
