<%@ Page Title="One Click Buy" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="oneClickBuy.aspx.cs" Inherits="PCPartsSuperStore.shopping.oneClickBuy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpd_Main" runat="server">
    <asp:HyperLink ID="UpdateUserInfoOCB" Cssclass="UpdateUserInfoOCB" runat="server" Target="_blank" NavigateUrl="~/userManagement/UpdateUserLogIn.aspx" >Update Log-In</asp:HyperLink>
    <form id="formOCB" class="form" method="post" runat="server" defaultfocus="prodName" >
        <!-- Display objects for input/output -->
        <fieldset class="fieldsetOCB">
            <legend id="legendOCB">Thank You for Purchasing</legend>
                <!-- Show the Thank You Message in the div. -->
                <div id="div_purchase" runat="server">
                </div>
        </fieldset>
        <asp:Button ID="submitButton" Cssclass="submitButton" runat="server" Text ="Email Receipt" OnClientClick="form.target ='_blank';" PostBackUrl="~/WebEmail/WebMail.aspx" />
    </form>
</asp:Content>
