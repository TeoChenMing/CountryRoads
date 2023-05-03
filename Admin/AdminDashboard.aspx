<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="CountryRoads.Admin.AdminDashboard" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    Admin Dashboard
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <h2>Dashboard</h2>

        <div class="container-fluid">
            <div class="row mt-4">
                <div class="col-4">
                    <div class="row">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="d-inline-block">Country Profiles</h4>
                                                
                                                    
                                <div class="float-end">
                                    <i class="bi bi-globe-americas bg-body-secondary p-2 rounded"></i>
                                </div>
                                                

                                <h1 class="mt-4">70</h1>
                                                
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="d-inline-block">Users</h4>
                                                
                                                    
                                <div class="float-end">
                                    <i class="bi bi-people bg-body-secondary p-2 rounded"></i>
                                </div>
                                                

                                <h1 class="mt-4">69</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-8 d-flex">
                    <div class="card vw-100">
                        <div class="card-body">
                            <h4>Traffic</h4>
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-8 d-flex">
                    <div class="row vw-100">
                        <div class="card">
                            <div class="card-body">
                                <h4>Recent Users</h4>

                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">First</th>
                                        <th scope="col">Last</th>
                                        <th scope="col">Handle</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                        </tr>
                                        <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                        </tr>
                                        <tr>
                                        <th scope="row">3</th>
                                        <td colspan="2">Larry the Bird</td>
                                        <td>@twitter</td>
                                        </tr>
                                        <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                        </tr>
                                        <tr>
                                        <th scope="row">3</th>
                                        <td colspan="2">Larry the Bird</td>
                                        <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                    </table>
                            </div>
                        </div>
                    </div>
                                    
                </div>
                <div class="col-4 d-flex">
                    <div class="card vw-100">
                        <div class="card-body">
                            <h4 class="d-inline-block">Quiz Assesment</h4>
                                                
                                                    
                                <div class="float-end">
                                    <i class="bi bi-question-square bg-body-secondary p-2 rounded"></i>
                                </div>
                                                

                                <h1 class="position-absolute fixed-bottom p-3">420</h1>
                        </div>
                    </div>
                </div>
            </div>
                            
        </div>

    </div>
</asp:Content>
