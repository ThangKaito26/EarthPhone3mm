using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteEarthPhone_Nhom4
{
    public partial class Home : System.Web.UI.UserControl
    {
        EarthPhonedbDataContext db = new EarthPhonedbDataContext();
        public static List<SanPham> listSPHot = new List<SanPham>();
        EarthPhonedbDataContext a = new EarthPhonedbDataContext();
        public static List<SanPham> listIPHONE = new List<SanPham>();
        EarthPhonedbDataContext b = new EarthPhonedbDataContext();
        public static List<SanPham> listOPPO = new List<SanPham>();
        EarthPhonedbDataContext c = new EarthPhonedbDataContext();
        public static List<SanPham> listRM = new List<SanPham>();
        EarthPhonedbDataContext d = new EarthPhonedbDataContext();
        public static List<SanPham> listSS = new List<SanPham>();
        EarthPhonedbDataContext e = new EarthPhonedbDataContext();
        public static List<SanPham> listVV = new List<SanPham>();
        EarthPhonedbDataContext f = new EarthPhonedbDataContext();
        public static List<SanPham> listXM = new List<SanPham>();
        EarthPhonedbDataContext g = new EarthPhonedbDataContext();
        public static List<SanPham> listSPM = new List<SanPham>();
        EarthPhonedbDataContext h = new EarthPhonedbDataContext();
        public static List<SanPham> listSPKH = new List<SanPham>();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
            LoadDataiphone();
            LoadDataoppo();
            LoadDatarealmi();
            LoadDatasamsung();
            LoadDatavivo();
            LoadDataxiaomi();
            LoadDataspm();
            loadDataspKH();
        }

        void LoadData()
        {
            var data = from q in db.SanPhams
                       where q.HOT == 1
                       select q;
            if (data != null && data.Count() > 0)
            {
                listSPHot = data.ToList();
            }
        }

        void LoadDataiphone()
        {
            var data = from q in a.SanPhams
                       where q.ID_DANHMUC == 2
                       select q;
            if (data != null && data.Count() > 0)
            {
                listIPHONE = data.ToList();
            }
        }

        void LoadDataoppo()
        {
            var data = from q in a.SanPhams
                       where q.ID_DANHMUC == 3
                       select q;
            if (data != null && data.Count() > 0)
            {
                listOPPO = data.ToList();
            }
        }

        void LoadDatarealmi()
        {
            var data = from q in a.SanPhams
                       where q.ID_DANHMUC == 4
                       select q;
            if (data != null && data.Count() > 0)
            {
                listRM = data.ToList();
            }
        }

        void LoadDatasamsung()
        {
            var data = from q in a.SanPhams
                       where q.ID_DANHMUC == 5
                       select q;
            if (data != null && data.Count() > 0)
            {
                listSS = data.ToList();
            }
        }

        void LoadDatavivo()
        {
            var data = from q in a.SanPhams
                       where q.ID_DANHMUC == 6
                       select q;
            if (data != null && data.Count() > 0)
            {
                listVV = data.ToList();
            }
        }

        void LoadDataxiaomi()
        {
            var data = from q in a.SanPhams
                       where q.ID_DANHMUC == 7
                       select q;
            if (data != null && data.Count() > 0)
            {
                listXM = data.ToList();
            }
        }

        void LoadDataspm()
        {
            var data = from q in a.SanPhams
                       where q.SanPhamMoi == 1
                       select q;
            if (data != null && data.Count() > 0)
            {
                listSPM = data.ToList();
            }
        }

        void loadDataspKH()
        {
            var data = from q in a.SanPhams
                       where q.ID_DANHMUC == 8
                       select q;
            if (data != null && data.Count() > 0)
            {
                listSPKH = data.ToList();
            }
        }
    }
}