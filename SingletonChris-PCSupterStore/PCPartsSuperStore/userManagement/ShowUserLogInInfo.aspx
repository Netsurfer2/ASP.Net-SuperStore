<%@ Page Title="Show Log-In" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ShowUserLogInInfo.aspx.cs" Inherits="PCPartsSuperStore.userManagement.ShowUserLogInInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpd_Main" runat="server">
    <form id="formSULII" runat="server">
        <fieldset class="fieldset1SULII">
            <legend class="legendSULII">Newly Created Log-In Data</legend>
                <!-- Labels to display the hard coded text using flexbox side by side again -->
                <div class="flexLabelsWrapper">
                    <div class="flexTextLabels">
                        <asp:Label ID="lbl_FName" CSSclass="TextLabelsSULII" runat="server" >First Name:</asp:Label><br />
                        <asp:Label ID="lbl_LName" CSSclass="TextLabelsSULII" runat="server" >Last Name:</asp:Label><br />
                        <asp:Label ID="lbl_UserName" CSSclass="TextLabelsSULII" runat="server" >User Name:</asp:Label><br />
                        <asp:Label ID="lbl_Password" CSSclass="TextLabelsSULII" runat="server" >Password:</asp:Label><br />
                        <asp:Label ID="lbl_Address" CSSclass="TextLabelsSULII" runat="server" >Address:</asp:Label><br />
                        <asp:Label ID="lbl_Email" CSSclass="TextLabelsSULII" runat="server" >Email:</asp:Label><br />
                        <asp:Label ID="lbl_PhoneNumber" CSSclass="TextLabelsSULII" runat="server" >Phone Number:</asp:Label>
                    </div>
                    <!-- Use label ID to display the information being passed, Display in the label -->
                    <div class="flexPassedText">
                        <asp:Label ID="lbl2_fName" Cssclass="ResultTextStyleSULII" runat="server" ></asp:Label><br />
                        <asp:Label ID="lbl2_LName" Cssclass="ResultTextStyleSULII" runat="server" ></asp:Label><br />
                        <asp:Label ID="lbl2_UserName" Cssclass="ResultTextStyleSULII" runat="server" ></asp:Label><br />
                        <asp:Label ID="lbl2_Password" Cssclass="ResultTextStyleSULII" runat="server" ></asp:Label><br />
                        <asp:Label ID="lbl2_Address" Cssclass="ResultTextStyleSULII" runat="server" ></asp:Label><br />
                        <asp:Label ID="lbl2_Email" Cssclass="ResultTextStyleSULII" runat="server" ></asp:Label><br />
                        <asp:Label ID="lbl2_PhoneNumber" Cssclass="ResultTextStyleSULII" runat="server" ></asp:Label><br />
                    </div>
                </div>
        </fieldset>
        <fieldset class="fieldset2SULII">
            <legend class="legendSULII">Capture Row ID</legend>
                <asp:Label ID="lbl_Identity" Cssclass="ResultTextStyleSULII" runat="server" ></asp:Label><br />
                <asp:HyperLink ID="UpdateLogIn" runat="server" Target="_blank" NavigateUrl="~/userManagement/UpdateUserLogIn.aspx">Update User Info</asp:HyperLink>
        </fieldset>       
    </form>
</asp:Content>
