using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteEarthPhone_Nhom4
{
    public partial class AdminCatetory : System.Web.UI.Page
    {
        EarthPhonedbDataContext db = new EarthPhonedbDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                LoadData();
        }
        void LoadData()
        {
            var data = from q in db.DanhMuc1s
                       select q;
            if (data != null)
            {
                girdDanhMuc.DataSource = data.ToList();
                girdDanhMuc.DataBind();
            }
        }

        protected void girdDanhMuc_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if (((LinkButton)e.CommandSource).CommandName == "GetDeleteDM")
            {
                long idselectDM = Convert.ToInt64(girdDanhMuc.DataKeys[e.Item.ItemIndex].ToString());
                var data = from q in db.DanhMuc1s
                           where q.ID_DANHMUC == idselectDM
                           select q;
                if (data != null)
                {
                    DanhMuc1 ifDM = data.First();
                    db.DanhMuc1s.DeleteOnSubmit(ifDM);
                    db.SubmitChanges();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ThongBao", "alert('Danh muc " + ifDM.TEN_DANHMUC + " đã bị xóa !')", true);
                    // Kiểm tra số lượng sản phẩm còn lại 
                    if (girdDanhMuc.CurrentPageIndex > 0 && girdDanhMuc.Items.Count == 1)
                    {
                        girdDanhMuc.CurrentPageIndex--; // Giảm chỉ số trang nếu cần }  
                        LoadData(); // Tải lại dữ liệu }  
                    }
                    if (girdDanhMuc.Items.Count > 1)// nếu còn
                    {
                        LoadData();
                    }

                    // Xử lý cập nhật sản phẩm 
                    if (((LinkButton)e.CommandSource).CommandName == "GetUpdateDM")
                    {
                        string idcapnhatDM = girdDanhMuc.DataKeys[e.Item.ItemIndex].ToString();
                        Response.Redirect("Adminupdatescate.aspx?IdDanhMuc=" + idcapnhatDM);
                    }
                }
            }
            // Xử lý cập nhật sản phẩm 
            if (((LinkButton)e.CommandSource).CommandName == "GetUpdateDM")
            {
                string idcapnhatDM = girdDanhMuc.DataKeys[e.Item.ItemIndex].ToString();
                Response.Redirect("Adminupdatescate.aspx?IdDanhMuc=" + idcapnhatDM);
            }
        }

        protected void girdDanhMuc_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            girdDanhMuc.CurrentPageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}