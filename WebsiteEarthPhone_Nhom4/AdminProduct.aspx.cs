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
        }

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
                    //kiem tra con sp nao hay khong
                    int remainingProductsCount = db.SanPhams.Count();

                    if (remainingProductsCount == 0)
                    {
                        // Áp dụng logic để chuyển hướng về trang 1  
                        girdSanPham.CurrentPageIndex = 1; // Giả sử bạn có biến CurrentPage để theo dõi trang hiện tại  
                        LoadData(); // Load lại dữ liệu cho trang 1  
                    }
                    else
                    {
                        LoadData(); // Nếu vẫn còn sản phẩm, chỉ cần load lại dữ liệu  
                    }

                }
            }
            //cho trang cap nhat
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