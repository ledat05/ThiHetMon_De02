<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemSach.aspx.cs" Inherits="QLBanSach.ThemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>THÊM SÁCH MỚI</h2>
    <hr />
   

    <div class="w-100">

        <div class="form-group">
            <label class="font-weight-bold">Tên sách</label>
            <asp:TextBox ID="txtTen" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTen" runat="server" ErrorMessage="Chưa nhập tên sách" ControlToValidate="txtTen" ForeColor="#CC3300" ></asp:RequiredFieldValidator>
     </div>
      <div class="form-group">
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Đơn giá</label>
            <asp:TextBox ID="txtDonGia" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDonGia" runat="server" ErrorMessage="(*)Chưa nhập đơn giá" ControlToValidate="txtDonGia" ForeColor="#CC3300" ></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvDonGia" runat="server" ErrorMessage="(*)Đơn giá phải là kiểu số" ControlToValidate="txtDonGia" ForeColor="#CC3300" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Chủ đề</label>
            <asp:DropDownList ID="ddlChuDe" DataSourceID="odsChuDe" DataTextField="TenCD" DataValueField="MaCD" CssClass="form-control ml-2" runat="server" AutoPostBack="True"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Ảnh bìa sách</label>
            <asp:FileUpload ID="FHinh" runat="server" CssClass="form-control-file" />
            <asp:RequiredFieldValidator ID="rfvHinh" runat="server" ErrorMessage="(*)Chưa nhập đơn giá" ControlToValidate="FHinh" ForeColor="#CC3300" ></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Khuyến mãi</label>
            <asp:CheckBox ID="chkKhuyenMai" runat="server" Checked="true" CssClass="form-check" />
        </div>
        <asp:Button ID="btXuLy" runat="server" Text="Lưu" CssClass="btn btn-danger" OnClick="btXuLy_Click" />

        <asp:Label ID="lbThongBao" runat="server" Text="" ForeColor="#cc3300" CssClass="fw-bold"></asp:Label>
    </div>
    <br />
    <asp:ObjectDataSource ID="odsChuDe" runat="server" SelectMethod="getAll" TypeName="QLBanSach.Models.ChuDeDAO"></asp:ObjectDataSource>
</asp:Content>
