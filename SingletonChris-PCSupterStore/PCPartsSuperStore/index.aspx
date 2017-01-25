<%@ Page Title="PC Super Store" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PCPartsSuperStore.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpd_Main" runat="server">
    <asp:Label ID="lbl_WelcomeUser" CssClass="WelcomeUser" runat="server" ></asp:Label>
         <form id="formLogIn" runat="server" defaultfocus="txb_SignInUName">
            <div class="SignInPos" runat="server">
                <asp:TextBox ID="txb_SignInUName" Cssclass="BoxStyleLogIn" placeholder="User Name" runat ="server" required ="required" ></asp:TextBox><br />
                <asp:TextBox ID="txb_SignInPWord" Cssclass="BoxStyleLogIn" placeholder="Password" runat ="server" required ="required" ></asp:TextBox><br />
                <asp:Button ID="submitButton" Cssclass="submitButtonLogIn" runat="server" Text ="Submit" OnClick="submitButton_Click" />       
            </div>
         </form>
    <asp:HyperLink ID="SignUp" Cssclass="SignUp" runat="server" Target="_blank" NavigateUrl="~/userManagement/MakeUserLogIn.aspx" >Sign up</asp:HyperLink>
    <asp:HyperLink ID="UpdateUserInfo" Cssclass="UpdateUserInfo" runat="server" Target="_blank" NavigateUrl="~/userManagement/UpdateUserLogIn.aspx" >Update Log-In</asp:HyperLink> 
</asp:Content>