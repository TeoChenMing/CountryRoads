<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminManageUsers.aspx.cs" Inherits="CountryRoads.Admin.AdminManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    Manage Users
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Manage Content</h2>

    <div class="container-fluid">
                            
        <table
            id="myTable"
            class="mw-90"
            data-toggle="table"
            data-search="true"
            
            data-pagination="true"
            >
            <thead>
                <tr>
                    <th data-field="userId">User ID</th>
                    <th data-field="username">Username</th>
                    <th data-field="email">Email</th>
                    <th data-field="fullname">Fullname</th>
                    <th data-field="gender">Gender</th>
                    <th data-field="quizAccessed">Quiz Accessed</th>
                    <th data-field="status">Status</th>
                    <th data-align="center" data-halign="left" data-field="action">Action</th>
                    
                </tr>
                                    
            </thead>
            <tbody>
                <%   if (dt != null) { foreach (DataRow row in dt.Rows)  {
           
                %>
   
                    <tr>
                        <td><% =row["userId"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["username"] %> </td>
                        <td class="text-nowrap text-truncate"><% =row["email"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["fullname"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["gender"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["quizAccessed"] %></td>
                        <td><% =row["status"] %></td>       
                        <td><a class="editBtn" href="#" data-bs-toggle="modal" data-bs-target="#myModal"><i class="bi bi-pencil-square"></i></a></td>
                    </tr>
                
                <% 
                    } }
                %>

              
            </tbody>
        </table>
                  
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jsscript" runat="server">
    <script>

        $('#myTable').on('click', 'tr', function () {
            
            // get the values of the cells in the row
            var rowData = $(this).children('td').map(function () {
                return $(this).text();
            }).get();

            
            // set the modal content based on the row data
            $('#myModal .modal-title').text("Edit Country - " + rowData[1]);
            $('#myModal .modal-body').html(

                '<div class="row">' +
                    '<div class="col-6">' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                            '<label for="name" class="form-label">User ID:</label>' +
                            '</div>' +
                            '<div class="col-8">' +
                                '<input type="text" class="form-control" id="userId" value="' + rowData[0] + '">' +
                            '</div>' +
                        '</div>' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                                '<label for="code" class="form-label">Username:</label>' +
                            '</div>' +
                            '<div class="col-8">' +
                                '<input type="text" class="form-control" id="username" value="' + rowData[1] + '" disabled>' +
                            '</div>' +
                        '</div>' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                                '<label for="capital" class="form-label">Email:</label>' +
                            '</div>' +
                            '<div class="col-8">' +
                                '<input type="text" class="form-control" id="email" value="' + rowData[2] + '">' +
                            '</div>' +
                        '</div>' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                                '<label for="area" class="form-label">Fullname:</label>' +
                            '</div>' +
                            '<div class="col-8">' +
                                '<input type="text" class="form-control" id="fullname" value="' + rowData[3] + '" >' +
                            '</div>' +
                        '</div>' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                                '<label for="area" class="form-label">Gender:</label>' +
                            '</div>' +
                            '<div class="col-8">' +
                                '<input type="text" class="form-control" id="gender" value="' + rowData[4] + '" >' +
                            '</div>' +
                        '</div>' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                                '<label for="area" class="form-label">Quiz Accessed:</label>' +
                            '</div>' +
                            '<div class="col-8">' +
                                '<input type="text" class="form-control" id="gender" value="' + rowData[5] + '" >' +
                            '</div>' +
                        '</div>' +
                    '</div>' +
                '</div>'
            );

            
        });

        // event listener for the hidden.bs.modal event
        $('#myModal').on('hidden.bs.modal', function () {
            // remove the event listener for the shown.bs.modal event
            $(this).off('shown.bs.modal');
        });
    </script>
</asp:Content>
