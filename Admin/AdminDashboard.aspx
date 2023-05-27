<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="CountryRoads.Admin.AdminDashboard" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    Admin Dashboard
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Import Namespace="System.Data" %>
    <div class="content">
        <h2>Dashboard</h2>

        <div class="container-fluid">
            <div class="row mt-4">
                <div class="col-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="d-inline-block">Country Profiles</h4>
                                                
                                                    
                            <div class="float-end">
                                <i class="bi bi-globe-americas bg-body-secondary p-2 rounded"></i>
                            </div>
                                                

                            <h1 class="mt-4">
                                <asp:Label ID="countryProfile" runat="server" Text=""></asp:Label>
                            </h1>
                                                
                        </div>
                    </div>
                </div>

                        
                        
                <div class="col-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="d-inline-block">Users</h4>
                                                
                                                    
                            <div class="float-end">
                                <i class="bi bi-people bg-body-secondary p-2 rounded"></i>
                            </div>
                                                

                            <h1 class="mt-4">
                                <asp:Label ID="userProfile" runat="server" Text="Label"></asp:Label>

                            </h1>
                        </div>
                    </div>
                </div>

                <div class="col-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="d-inline-block">Quiz Assessed</h4>
                                                
                                                    
                                <div class="float-end">
                                    <i class="bi bi-question-square bg-body-secondary p-2 rounded"></i>
                                </div>
                                                

                                <h1 class="mt-4">
                                    <asp:Label ID="quiz" runat="server" Text="Label"></asp:Label>

                                </h1>
                        </div>
                    </div>
                </div>
                        
                
                    
                        
                    
            </div>
                
            
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h4>Recent Users</h4>

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Email</th>
                                    </tr>
                                </thead>
                                <tbody id="userTableBody">

                                    <%   if (dt4 != null)
                                        {
                                            foreach (DataRow row in dt4.Rows)
                                            {


                                    %>
                        
                        
                                        <tr>
                                            <td><% =row["userId"] %></td>
                                            <td class="text-nowrap text-truncate">
                                                <% =row["fullName"] %>
                                            </td>
                                            <td class="text-nowrap text-truncate"><% =row["username"] %> </td>
                                            <td class="text-nowrap text-truncate">
                                                <% =row["email"] %>
                                            </td>
                                        </tr>
                
                                    <% 
                                            }

                                        }
                                        %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                                    
                </div>
                
            </div>
                            
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ModalContent" runat="server">
   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsscript" runat="server">

</asp:Content>
