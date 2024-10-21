using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteEarthPhone_Nhom4
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        EarthPhonedbDataContext db = new EarthPhonedbDataContext();
        public static List<DanhMuc1> listDM = new List<DanhMuc1>();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }
        void LoadData()
        {
            var data = from q in db.DanhMuc1s
                       where q.HIENTHI == 1
                       orderby q.VITRI ascending
                       select q;
            if (data != null && data.Count()>0)
            {
                listDM = data.ToList();
            }
        }
    }
}