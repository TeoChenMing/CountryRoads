<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserContactAdmin.aspx.cs" Inherits="CountryRoads.User.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background: rgb(181,220,255);
            background: linear-gradient(180deg, rgba(181,220,255,1) 0%, rgba(29,118,253,1) 40%, rgba(33,37,41,1) 70%);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="my-5 p-5 card shadow" style="margin: 0 20%; border-radius: 8px;">
        <div class="p-xl-5">
            <div class="py-3">
                <h1 class="text-center">How may we help you?</h1>
            </div>
            <div class="mx-3 px-5">
                <h3 class="text-center mt-5 mb-3" style="font-weight: 100">Leave us a message and we will get back to you. We typically reply within 48 hours.</h3>
                <asp:TextBox class="form-control mt-5 mb-3 w-100 m-auto" ID="EnquiryText" runat="server" placeholder="Explain your issue in detail so we can help you the best we can..." TextMode="MultiLine" Height="200px"></asp:TextBox>

                <% 
                    if (Session["userName"] == null)
                    {
                %>
                <h3 class="text-center mt-5 mb-3" style="font-weight: 100">Please leave your email address so we can contact you later.</h3>
                <asp:TextBox class="form-control mt-5 mb-3 w-100 m-auto" ID="EmailText" runat="server" placeholder="Email Address..." TextMode="Email"></asp:TextBox>
                <%
                    }
                %>
                <asp:Button CssClass="btn btn-primary my-5 py-3 w-100 m-auto" ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
            </div>
            
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
