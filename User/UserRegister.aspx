<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="CountryRoads.User.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: rgba(41,59,81,255);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mt-2" style="margin: 0 10%">
        <div class="container-fluid" style="min-width: 50%; max-width:75%">
            <div class="px-5 m-3">
                <div class="row justify-content-center shadow bg-white rounded p-5">
                    <div>
                        <h2 class="p-4 text-center">Welcome Aboard!</h2>
                    </div>
                    <div class="text-center">
                        <label for="title1" class="pb-5 fs-6 fst-italic">To get started, enter your username, email address and password.</label>
                    </div>
                    <div class="pb-3">
                        <label for="username" class="fs-6 form-label text-start">Username:</label>
                        <asp:TextBox type="text" class="form-control fst-italic" ID="username" placeholder="Enter your username here..." runat="server"></asp:TextBox>
                    </div>
                    <div class="pb-3">
                        <label for="email" class="fs-6 form-label text-start">Email:</label>
                        <asp:TextBox type="text" class="form-control fst-italic" ID="email" placeholder="Enter your email address here..." runat="server"></asp:TextBox>
                    </div>
                    <div class="pb-3">
                        <label for="password" class="fs-6 form-label text-start">Password:</label>
                        <asp:TextBox type="password" class="form-control fst-italic" ID="password" placeholder="Enter your password here..." runat="server"></asp:TextBox>
                    </div>
                    <div class="pb-3">
                        <label for="fullName" class="fs-6 form-label text-start">Full Name:</label>
                        <asp:TextBox type="text" class="form-control fst-italic" ID="fullName" placeholder="Enter your full name here..." runat="server"></asp:TextBox>
                    </div>
                    <div class="pt-1 form-check text-start">
                        <label for="gender" class="fs-6 form-label text-start me-5">Gender:</label>
                        <asp:RadioButton class="me-2" GroupName="GenderRadioGroup" Text="Male" ID="male" value="Male" runat="server" />

                        <asp:RadioButton class="me-2" GroupName="GenderRadioGroup" Text="Female" ID="female" value="Female" runat="server" />

                    </div>
                    <div class="text-start">
                        <asp:Label ID="ErrorMsg" class="text text-danger" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="p-2 text-center">
                        <asp:Button ID="RegisterBtn" type="submit" class="btn btn-primary mt-4" runat="server" Text="Register" OnClick="Register_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
