<%@ Page Title="Create Log-In" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MakeUserLogIn.aspx.cs" Inherits="PCPartsSuperStore.userManagement.MakeUserLogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpd_Main" runat="server">
    <form id="formMULI" class="form" method="post" action="SecondPage.aspx" runat="server" defaultfocus="txb_FName" >
        <!-- Display objects for input/output -->
        <fieldset class="fieldsetMULI">
            <legend class="LegendMULI">Create Log-In</legend>
                <!-- flexbox both the textbox and labels together side by side -->
                <div class="flexTBoxesWrapper">
                    <div class="flexText">
                        <asp:Label ID="lbl1_FName" Cssclass="LabelStyleMULI" runat="server" >First Name:</asp:Label><br />
                        <asp:Label ID="lbl1_LName" Cssclass="LabelStyleMULI" runat="server" >Last Name:</asp:Label><br />
                        <asp:Label ID="lbl1_UserName" Cssclass="LabelStyleMULI" runat="server" >User Name:</asp:Label><br />
                        <asp:Label ID="lbl1_Password" Cssclass="LabelStyleMULI" runat="server" >Password:</asp:Label><br />
                        <asp:Label ID="lbl1_Address" Cssclass="LabelStyleMULI" runat="server" >Address:</asp:Label><br />
                        <asp:Label ID="lbl1_Email" Cssclass="LabelStyleMULI" runat="server" >Email:</asp:Label><br />
                        <asp:Label ID="lbl1_PhoneNumber" Cssclass="LabelStyleMULI" runat="server" >Phone Number:</asp:Label>
                    </div>
                    <!-- Allow user input into the textboxes -->
                    <div class="flexTextBoxes">
                        <div id="FName">
                            <asp:TextBox ID="txb_FName" Cssclass="BoxStyleMULI" placeholder="First Name" runat ="server" required ="required" ></asp:TextBox><br />
                        </div>
                        <div id="LName">
                            <asp:TextBox ID="txb_LName" Cssclass="BoxStyleMULI" placeholder="Last Name" runat ="server" required ="required" ></asp:TextBox><br />
                        </div>
                        <div id="UName">
                            <asp:TextBox ID="txb_UserName" Cssclass="BoxStyleMULI" placeholder="User Name" runat ="server" required ="required" ></asp:TextBox><br />
                        </div>
                        <div id="Pword">
                            <asp:TextBox ID="txb_Password" Cssclass="BoxStyleMULI" placeholder="Password" runat ="server" required ="true" ></asp:TextBox><br />
                        </div>
                        <div id="Address">
                            <asp:TextBox ID="txb_Address" Cssclass="BoxStyleMULI" placeholder="Address" runat ="server" required ="required" ></asp:TextBox><br />
                        </div>
                        <div id="Email">
                            <asp:TextBox ID="txb_Email" Csstype="email" Cssclass="BoxStyleMULI" placeholder="Email" runat ="server" required ="required" ></asp:TextBox><br />
                        </div>
                        <div id="PNumber">
                            <asp:TextBox ID="txb_PhoneNumber" Cssclass="BoxStyleMULI" placeholder="Phone Number" runat ="server" required ="required" ></asp:TextBox>
                        </div>
                    </div>
                </div>
            <!-- User submits the input to the next page -->
            <asp:Button ID="submitButton" Cssclass="submitButton" runat="server" Text ="Submit" OnClientClick="form.target ='_blank';" PostBackUrl="~/userManagement/ShowUserLogInInfo.aspx" />
        </fieldset>
    </form>


</asp:Content>
