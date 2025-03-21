using QLBanSach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBanSach
{
    public partial class ThemSach : System.Web.UI.Page
    {
        SachDAO sachDao = new SachDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btXuLy_Click(object sender, EventArgs e)
        {
            try
            {
                string tensach = txtTen.Text;
                int dongia = int.Parse(txtDonGia.Text);
                int mcd = int.Parse(ddlChuDe.SelectedValue);

                //Xu ly upload file anh
                string hinh = FHinh.FileName;
                string path = Server.MapPath("~/Bia_Sach") + "/" + FHinh.FileName;
                FHinh.SaveAs(path);
                //Xử lý Khuyên mãi
                Boolean khuyenmai = chkKhuyenMai.Checked;
                DateTime ngaycapnhat = DateTime.Now;
                //tao doi tuong can them
                Sach sach = new Sach { TenSach = tensach, Dongia = dongia,MaCD = mcd, Hinh = hinh, KhuyenMai=khuyenmai,NgayCapNhat=ngaycapnhat };
                //goi phuong thuc tu lop Dao de them vao CSDL
                sachDao.Insert(sach);

                lbThongBao.Text = "Thao tác thên sách thành công";
                lbThongBao.ForeColor = System.Drawing.Color.Green;
                Response.AppendHeader("Refresh", "1;url=XemSach.aspx");
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Thao tác thêm tour thất bại";
            }
        }
    }
}