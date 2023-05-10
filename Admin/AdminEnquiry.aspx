<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminEnquiry.aspx.cs" Inherits="CountryRoads.Admin.AdminEnquiry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    Enquiries
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h2>Enquiries</h2>
    <div class="container-fluid">
        
        <table
            id="EnquiryTable"
            class="mw-90"
            data-toggle="table"
            data-search="true"
            data-pagination="true"
            >
            <thead>
                <tr>
                    <th data-field="id" data-width="100">ID</th>
                    <th data-field="user" data-width = "200%">User</th>
                    <th data-field="email" data-width = "200">Email</th>
                    <th data-field="description" data-width ="900">Description</th>
                    <th data-align="center" data-halign="left" data-field="action" data-width = "100">Action</th>

                </tr>
                                    
            </thead>
            <tbody>
                <%   if (dt != null)
                    {
                        foreach (DataRow row in dt.Rows)
                        {


                %>
                        
                        
                    <tr>
                        <td><% =row["Id"] %></td>
                        <td class="text-nowrap text-truncate" style="max-width: 100px;"><% =row["username"] %> </td>
                        <td class="text-nowrap text-truncate" style="max-width: 200px;">
                            <% =row["email"] %>
                        </td>
                        <td class="text-nowrap text-truncate" style="max-width: 100px;"><% =row["description"] %></td>
                        <td><a class="viewBtn" href="#" data-bs-toggle="modal" data-bs-target="#EnquiryModal"><i class="bi bi-eye"></i></a></td>
                    </tr>
                
                <% 
                        }

                    }
                    else
                    {
                        Response.Write("<p>NOTIHNG</p>");
                    }%>

                    
                    
            </tbody>
        </table>
                  
    </div>


    
                   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsscript" runat="server">
    <script>

        $('#EnquiryTable').on('click', 'tr', function () {

            // get the values of the cells in the row
            var rowData = $(this).children('td').map(function () {
                return $(this).text();
            }).get();

            // set the modal content based on the row data
            $('#EnquiryModal .modal-title').text("Enquiry from - " + rowData[1]);
            $('#EnquiryModal .modal-body').html(

                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<label for="name" class="form-label">Name:</label>' +
                '</div>' +
                '<div class="col-8">' +

                '<input type="text" class="form-control" id="username" value="' + rowData[1] + '" disabled>' +

                '</div>' +

                '</div>' +
                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<label for="email" class="form-label">Email:</label>' +
                '</div>' +
                '<div class="col-8">' +
                '<input type="text" class="form-control" id="email" value="' + rowData[2] + '" disabled>' +
                '</div>' +
                '</div>' +
                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<label for="description" class="form-label">Description:</label>' +
                '</div>' +
                '<div class="col-8">' +
                '<textarea class="form-control" id="description" disabled>' + rowData[3] + '</textarea>' +
                '</div>' +
                '</div>'
            );

            

        });

        // event listener for the hidden.bs.modal event
        $('#EnquiryModal').on('hidden.bs.modal', function () {
            // remove the event listener for the shown.bs.modal event
            $(this).off('shown.bs.modal');
        });


    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ModalContent" runat="server">
    <!-- Modal -->
        <div class="modal fade" id="EnquiryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false">
          <div class="modal-dialog modal-dialog-centered modal-lg ">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                
                    Loading...
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
</asp:Content>
