<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminManageUsers.aspx.cs" Inherits="CountryRoads.Admin.AdminManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    Manage Users
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Manage Users</h2>

    <div class="container-fluid">
        <asp:HiddenField ID="UserId" runat="server" Value=""/> 
        <%--
        <asp:HiddenField ID="Username" runat="server" Value=""/>  
        <asp:HiddenField ID="Password" runat="server" Value=""/>
        <asp:HiddenField ID="Email" runat="server" Value=""/>
        <asp:HiddenField ID="FullName" runat="server" Value=""/>
        <asp:HiddenField ID="Gender" runat="server" Value=""/>
        <asp:HiddenField ID="QuizAccessed" runat="server" Value=""/>
            --%>
        <asp:HiddenField ID="Status" runat="server" Value=""/>
            
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
                    <th data-field="fullName">Fullname</th>
                    <th data-field="gender">Gender</th>
                    <th data-field="quizAccessed">Quiz Assessed</th>
                    <th data-align="center" data-halign="left" data-field="action">Action</th>
                    
                </tr>
                                    
            </thead>
            <tbody>
                <%   if (dt != null) { foreach (DataRow row in dt.Rows)  {
           
                %>
   
                    <tr>
                        <td><% =row["userId"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["username"] %> </td>
                        <td hidden><% = row["password"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["email"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["fullName"] %></td>
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
            $('#myModal .modal-title').text("Edit User - " + rowData[1]);
            $('#myModal .modal-mainbody').html(

                '<div class="row">' +
                    '<div class="col">' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                            '<label for="userId" class="form-label">User ID:</label>' +
                            '</div>' +
                            '<div class="col-7">' +
                                '<input type="text" class="form-control" id="userId" value="' + rowData[0] + '" disabled>' +
                            '</div>' +
                        '</div>' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                                '<label for="username" class="form-label">Username:</label>' +
                            '</div>' +
                            '<div class="col-7">' +
                                '<input type="text" class="form-control" id="username" value="' + rowData[1] + '" disabled>' +
                            '</div>' +
                        '</div>' +
                        '<input type="hidden" id="password" value = "'+rowData[2]+'">' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                                '<label for="email" class="form-label">Email:</label>' +
                            '</div>' +
                            '<div class="col-7">' +
                                '<input type="text" class="form-control" id="email" value="' + rowData[3] + '" disabled>' +
                            '</div>' +
                        '</div>' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                                '<label for="fullName" class="form-label">Fullname:</label>' +
                            '</div>' +
                            '<div class="col-7">' +
                                '<input type="text" class="form-control" id="fullName" value="' + rowData[4] + '" disabled>' +
                            '</div>' +
                        '</div>' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                                '<label for="gender" class="form-label">Gender:</label>' +
                            '</div>' +
                            '<div class="col-7">' +
                                '<input type="text" class="form-control" id="gender" value="' + rowData[5] + '" disabled>' +
                            '</div>' +
                        '</div>' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                                '<label for="quizAccessed" class="form-label">Quiz Accessed:</label>' +
                            '</div>' +
                            '<div class="col-7">' +
                                '<input type="text" class="form-control" id="quizAccessed" value="' + rowData[6] + '" disabled>' +
                            '</div>' +
                        '</div>' +
                        '<div class="row mb-3">' +
                            '<div class="col-3">' +
                                '<label for="status" class="form-label">Status:</label>' +
                            '</div>' +
                            '<div class="col-7">' +
                                '<input type="text" class="form-control" id="status" value="' + rowData[7] + '" disabled>' +
                            '</div>' +
                        '</div>' +
                    '</div>' +
                '</div>'
            );

            
        });


        $('#ModalContent_UnbanButton').on('click', function () {

            $('#<% =UserId.ClientID %>').val($('#userId').val());
            console.log("UserId is as shown", $('#userId').val(), ".");

        })

        $('#ModalContent_BanButton').on('click', function () {

            $('#<% =UserId.ClientID %>').val($('#userId').val());
            console.log("UserId is as shown", $('#userId').val(), ".");

        })

        // event listener for the hidden.bs.modal event
        $('#myModal').on('hidden.bs.modal', function () {
            // remove the event listener for the shown.bs.modal event
            $(this).off('shown.bs.modal');
        });

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ModalContent" runat="server">
    <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false">
          <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>

                <div class="modal-body">
                    <div class="modal-mainbody">
                        Loading...
                    </div>
                </div>

              <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <asp:Button ID="UnbanButton" type="button" runat="server" Text="Unban User" OnClick="Unban_Click" class="btn btn-success"></asp:Button>
                  <asp:Button ID="BanButton" type="button" runat="server" Text="Ban User" OnClick="Ban_Click" class="btn btn-danger"></asp:Button>
              </div>

            </div>
          </div>
        </div>
</asp:Content>
