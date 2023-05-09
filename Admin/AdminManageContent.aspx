<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminManageContent.aspx.cs" Inherits="CountryRoads.Admin.AdminManageContent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    Manage Content
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h2>Manage Content</h2>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <div class="container-fluid">
        <asp:HiddenField ID="CountryName" runat="server" Value="YOURMOM"/>  
        <asp:HiddenField ID="Capital" runat="server" Value=""/>
        <asp:HiddenField ID="Area" runat="server" Value=""/>
        <asp:HiddenField ID="Population" runat="server" Value=""/>
        <asp:HiddenField ID="Languages" runat="server" Value=""/>
        <asp:HiddenField ID="Currency" runat="server" Value=""/>
        <table
            id="myTable"
            class="mw-90"
            data-toggle="table"
            data-search="true"
            
            data-pagination="true"
            >
            <thead>
                <tr>
                    <th data-field="code">Code</th>
                    <th data-field="name">Name</th>
                    <th data-field="capital">Capital</th>
                    <th data-align="center" data-halign="left" data-field="flag">Flag</th>
                    <th data-field="area">Area (km2)</th>
                    <th data-field="population">Population</th>
                    <th data-field="lang">Language</th>
                    <th data-field="currency">Currency</th>
                    <th data-field="timezone">Timezone</th>
                    <th data-field="continent">Continent</th>
                    <th data-align="center" data-halign="left" data-field="action">Action</th>


                    
                </tr>
                                    
            </thead>
            <tbody>
                <%   if (dt != null)
                    {
                        foreach (DataRow row in dt.Rows)
                        {


                %>
                        
                        
                    <tr>
                        <td><% =row["countryId"] %></td>
                        <td class="text-nowrap text-truncate" style="max-width: 100px;"><% =row["countryName"] %> </td>
                        <td class="text-nowrap text-truncate" style="max-width: 200px;">
                            <% =row["countryCapital"] %>
                        </td>
                        <td><img style="width: 50px; height: 30px;" src="<% =row["countryFlag"] %>" alt="Image"></td>
                        <td>
                            
                            <% 
                                if (row["countryArea"].ToString().Contains("."))
                                {
                                    decimal originalValue = Convert.ToDecimal(row["countryArea"]);
                                    decimal roundedValue = decimal.Round(originalValue, 2);

                                    Response.Write(roundedValue.ToString());
                                }
                                else
                                {
                                    Response.Write(row["countryArea"]);
                                }


                             %>
                        </td>
                        <td class="text-nowrap text-truncate" style="max-width:stretch"" 100px;"><% =row["countryPopulation"] %></td>
                        <td class="text-nowrap text-truncate" style="max-width: 200px;"><% =row["countryLanguage"] %></td>
                        <td><% =row["countryCurrency"] %></td>
                        <td class="text-nowrap text-truncate" style="max-width: 150px;"><% =row["countryTimezone"] %></td>
                        <td><% =row["continent"] %></td>         
                        <td><a class="editBtn" href="#" data-bs-toggle="modal" data-bs-target="#myModal"><i class="bi bi-pencil-square"></i></a></td>
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
                '<label for="name" class="form-label">Name:</label>' +
                '</div>' +
                '<div class="col-8">' +

                '<input type="text" class="form-control" id="name" value="' + rowData[1] + '">' +

                '</div>' +

                '</div>' +
                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<label for="code" class="form-label">Code:</label>' +
                '</div>' +
                '<div class="col-8">' +
                '<input type="text" class="form-control" id="code" value="' + rowData[0] + '" disabled>' +
                '</div>' +
                '</div>' +
                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<label for="capital" class="form-label">Capital:</label>' +
                '</div>' +
                '<div class="col-8">' +
                '<input type="text" class="form-control" id="capital" value="' + rowData[2] + '">' +
                '</div>' +
                '</div>' +
                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<label for="area" class="form-label">Area:</label>' +
                '</div>' +
                '<div class="col-8">' +
                '<input type="text" class="form-control" id="area" value="' + rowData[4] + '" >' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="col-6">' +
                '<img style="width: 350px; height: 200px;" src="' + $(this).find('img').attr('src') + '">' +
                '</div>' +
                '</div>' +
                '<div class="row">' +
                '<div class="col-6">' +
                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<label for="population" class="form-label">Population:</label>' +
                '</div>' +
                '<div class="col-8">' +
                '<input type="text" class="form-control" id="population" value="' + rowData[5] + '" >' +
                '</div>' +
                '</div>' +
                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<label for="language" class="form-label">Languages:</label>' +
                '</div>' +
                '<div class="col-8">' +
                '<input type="text" class="form-control" id="language" value="' + rowData[6] + '" >' +
                '</div>' +
                '</div>' +
                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<label for="currency" class="form-label">Currency:</label>' +
                '</div>' +
                '<div class="col-8">' +
                '<input type="text" class="form-control" id="currency" value="' + rowData[7] + '" >' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="col-6">' +
                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<label for="timezone" class="form-label">Timezone:</label>' +
                '</div>' +
                '<div class="col-8">' +
                '<input type="text" class="form-control" id="timezone" value="' + rowData[8] + '" disabled >' +
                '</div>' +
                '</div>' +
                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<label for="continent" class="form-label">Continent:</label>' +
                '</div>' +
                '<div class="col-8">' +
                '<input type="text" class="form-control" id="continent" value="' + rowData[9] + '" disabled >' +
                '</div>' +
                '</div>' +
                '</div>'
            );

            $('#ModalContent_Update').on('click', function () {

                $('#<% =CountryName.ClientID %>').val(rowData[1]);
                $('#<% =Capital.ClientID %>').val(rowData[2]);
                $('#<% =Area.ClientID %>').val(rowData[4]);
                $('#<% =Population.ClientID %>').val(rowData[5]);
                $('#<% =Languages.ClientID %>').val(rowData[6]);
                $('#<% =Currency.ClientID %>').val(rowData[7]);

            })


        });

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
                <asp:Button ID="Update" type="button" class="btn btn-primary" runat="server" Text="Update" OnClick="Update_Click"/>
              </div>
            </div>
          </div>
        </div>
</asp:Content>
