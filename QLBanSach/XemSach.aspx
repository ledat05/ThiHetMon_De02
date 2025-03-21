<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemSach.aspx.cs" Inherits="QLBanSach.XemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h3>Trang xem sách</h3>
    <hr />

    <div class="alert alert-info">
        <div class="form-inline justify-content-center">
            <label class="font-weight-bold">Chủ đề</label>
            <asp:DropDownList ID="ddlChuDe" DataSourceID="odsChuDe" DataTextField="TenCD" DataValueField="MaCD" CssClass="form-control ml-2" runat="server" AutoPostBack="True"></asp:DropDownList>
        </div>
    </div>
    <div class="row" style="margin-top: 10px">
        <asp:Repeater ID="rptSach" DataSourceID="odsSach" runat="server" OnItemCommand="rptSach_ItemCommand">
            <ItemTemplate>
                <div class="col-md-4 text-center">
                    <img src="/Bia_sach/<%# Eval("Hinh") %>"  style="width:250px" />
                    <br />
                    Tên Sách:<asp:Label ID="lbTen" runat="server" Font-Bold="true" Text='<%# Eval("TenSach") %>'></asp:Label>
                    <br />
                    <asp:Label ID="lbGia" runat="server" ForeColor="Green" Font-Bold="true"  Text='<%# Eval("Dongia","{0:#,##0} Đồng") %>'></asp:Label>
                   <br />
                    <a class="btn btn-primary" href="XemChiTiet.aspx?MaSach=<%# Eval("MaSach") %>">Xem chi tiết</a> 
                    <a class="btn btn-danger" href="ThemVaoGio.aspx?MaSach=<%# Eval("MaSach") %>">Đặt mua</a>
                </div>
                    <br />
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:ObjectDataSource ID="odsSach" runat="server" SelectMethod="laySachTheoChuDe" TypeName="QLBanSach.Models.SachDAO">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlChuDe" Name="macd" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsChuDe" runat="server" SelectMethod="getAll" TypeName="QLBanSach.Models.ChuDeDAO"></asp:ObjectDataSource>

</asp:Content>
