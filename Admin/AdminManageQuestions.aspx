<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="AdminManageQuestions.aspx.cs" Inherits="CountryRoads.Admin.AdminManageQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    Manage Questions
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col">
            <h2>Manage Questions</h2>
        </div>
        <div class="col-md-auto">
            <button id="addQuesBtn" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#AddQuestionModal">Add New Question</button>
        </div>
    </div>
    

    <div class="container-fluid">
        <asp:HiddenField ID="questionId" runat="server" Value=""/> 
        <asp:HiddenField ID="countryId" runat="server" Value=""/>  
        <asp:HiddenField ID="quizType" runat="server" Value=""/>
        <asp:HiddenField ID="title" runat="server" Value=""/>
        <asp:HiddenField ID="options" runat="server" Value=""/>
        <asp:HiddenField ID="answer" runat="server" Value=""/>
            
        <table
            id="myTable"
            class="mw-90"
            data-toggle="table"
            data-search="true"
            data-pagination="true"
            >
            <thead>
                <tr>
                    <th data-field="questionId">Question ID</th>
                    <th data-field="countryId">Country ID</th>
                    <th data-field="quizType">Quiz Type</th>
                    <th data-field="title">Title</th>
                    <th data-field="options">Options</th>
                    <th data-field="answer">Answer</th>
                    <th data-align="center" data-halign="left" data-field="action">Action</th>
                    
                </tr>
                                    
            </thead>
            <tbody>
                <%   if (dt != null) { 
                        foreach (DataRow row in dt.Rows)  
                        {
                %>
   
                    <tr>
                        <td><% =row["questionId"] %></td>
                        <td><% =row["countryId"] %> </td>
                        <td><% =row["quizType"] %></td>
                        <td class="text-nowrap text-truncate" style="width: 200px;"><% =row["title"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["options"] %></td>
                        <td class="text-nowrap text-truncate"><% =row["answer"] %></td>  
                        <td>
                            <div class="row">
                                <div class="col">
                                    <a class="editBtn" href="#" data-bs-toggle="modal" data-bs-target="#myModal"><i class="bi bi-pencil-square"></i></a>
                                </div>
                                <div class="col">
                                    <a class="deleteBtn" href="#" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal"><i class="bi bi-trash-fill"></i></a>
                                </div>
                            </div>
                        </td>
                    </tr>
                
                <% 
                        } 
                    }
                %>

              
            </tbody>
        </table>
                  
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ModalContent" runat="server">
   
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" aria-hidden="true"></button>
                </div>

                <div class="modal-body">
                    <div class="modal-mainbody">
                        Loading...
                    </div>
                    <div class="modal-moreoptions">
                    </div>
                    <div class="modal-subbody">
                        Loading
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="Update" type="button" runat="server" Text="Update" OnClick="Update_Click" class="btn btn-primary"></asp:Button>
                </div>

            </div>
        </div>
    </div>

    <!-- Delete confirmation Modal -->
    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel2" data-bs-backdrop="static">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Delete Confirmation</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" aria-hidden="true">
            </button>
          </div>
          <div class="modal-body">
            Are you sure you want to delete this question?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <asp:Button ID="Delete" runat="server" class="btn btn-danger" Text="Delete" OnClick="Delete_Click"></asp:Button>
          </div>
        </div>
      </div>
    </div>

    <!-- Add New Question Modal -->
    <div class="modal fade" id="AddQuestionModal" tabindex="-1" aria-labelledby="exampleModalLabel2">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Question</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" aria-hidden="true">
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <div class="row mb-3">
                                <div class="col-3">
                                    <label for="addCountryId" class="form-label">Select a country:</label>
                                </div>
                                <div class="col-7">
                                    <select id="addCountryId" class="form-select" aria-label="Default select example">
                                        <%   if (countryDT != null)
                                            {
                                                foreach (DataRow row in countryDT.Rows)
                                                {
                                        %>
                                        <option value="<%=row["countryId"] %>"><%=row["countryId"]%>, <%=row["countryName"]%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-3">
                                    <label for="addQuizType" class="form-label">Question Type:</label>
                                </div>
                                <div class="col-7">
                                    <input type="text" class="form-control" id="addQuizType" value="TrueFalse" disabled>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-3">
                                    <label for="addTitle" class="form-label">Title:</label>
                                </div>
                                <div class="col-7">
                                    <input type="text" class="form-control" id="addTitle" value="" required>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-3">
                                    <label for="addAnswer" class="form-label">Answer:</label>
                                </div>
                                <div class="col-7">
                                    <select id="addAnswer" class="form-select" aria-label="Default select example">
                                        <option value="True" selected>True</option>
                                        <option value="False">False</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="AddQuestion" runat="server" class="btn btn-success" Text="Add Question" OnClick="AddQuestion_Click"></asp:Button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="jsscript" runat="server">
     <script>

         $('#myTable').on('click', 'tr', function () {

             // get the values of the cells in the row
             var rowData = $(this).children('td').map(function () {
                 return $(this).text();
             }).get();


             const optionsArr = rowData[4].split("||");

             // set the modal content based on the row data
             $('#myModal .modal-title').text("Edit Question - " + rowData[0]);
             $('#myModal .modal-mainbody').html(

                 '<div class="row">' +
                 '<div class="col">' +
                 '<div class="row mb-3">' +
                 '<div class="col-3">' +
                 '<label for="questionId" class="form-label">Question ID:</label>' +
                 '</div>' +
                 '<div class="col-7">' +
                 '<input type="text" class="form-control" id="questionId" value="' + rowData[0] + '" disabled>' +
                 '</div>' +
                 '</div>' +
                 '<div class="row mb-3">' +
                 '<div class="col-3">' +
                 '<label for="countryId" class="form-label">Country ID:</label>' +
                 '</div>' +
                 '<div class="col-7">' +
                 '<input type="text" class="form-control" id="countryId" value="' + rowData[1] + '" disabled>' +
                 '</div>' +
                 '</div>' +
                 '<div class="row mb-3">' +
                 '<div class="col-3">' +
                 '<label for="quizType" class="form-label">Quiz Type:</label>' +
                 '</div>' +
                 '<div class="col-7">' +
                 '<input type="text" class="form-control" id="quizType" value="' + rowData[2] + '" disabled>' +
                 '</div>' +
                 '</div>' +
                 '<div class="row mb-3">' +
                 '<div class="col-3">' +
                 '<label for="title" class="form-label">Title:</label>' +
                 '</div>' +
                 '<div class="col-7">' +
                 '<textarea class="form-control" id="title" rows="3">' + rowData[3] + '</textarea>' +
                 '</div>' +
                 '</div>' +
                 '<input type="hidden" id="options" value="' + rowData[4] + '"/>' +
                 '<div class="row mb-3">' +
                 '<div class="col-3">' +
                 '<span class="form-label">Options:</span>' +
                 '</div>' +
                 '</div>' +
                 '<div class="row mb-3">' +
                 '<div class="col-5">' +
                 '<input type="text" class="form-control" value="' + optionsArr[0] + '">' +
                 '</div>' +
                 '<div class="col-5">' +
                 '<input type="text" class="form-control" value="' + optionsArr[1] + '">' +
                 '</div>' +
                 '</div>' +
                 '</div>' +
                 '</div>'
             );

             if (rowData[2] == "flag" || rowData[2] == "fact") {
                 $('#myModal .modal-moreoptions').html(
                     '<div class="row mb-3">' +
                     '<div class="col-5">' +
                     '<input type="text" class="form-control"  value="' + optionsArr[2] + '">' +
                     '</div>' +
                     '<div class="col-5">' +
                     '<input type="text" class="form-control" value="' + optionsArr[3] + '">' +
                     '</div>' +
                     '</div>'
                 );
             }

             $('#myModal .modal-subbody').html(
                 '<div class="row mb-3">' +
                 '<div class="col-3">' +
                 '<label for="answer" class="form-label">Answer:</label>' +
                 '</div>' +
                 '<div class="col-7">' +
                 '<input type="text" class="form-control" id="answer" value="' + rowData[5] + '">' +
                 '</div>' +
                 '</div>'
             );

         });

         $('#ModalContent_AddQuestion').on('click', function () {

             $('#<% =countryId.ClientID %>').val($('#addCountryId').val());
             $('#<% =quizType.ClientID %>').val($('#addQuizType').val());
             $('#<% =title.ClientID %>').val($('#addTitle').val());
             $('#<% =options.ClientID %>').val($('#addOptions').val());
             $('#<% =answer.ClientID %>').val($('#addAnswer').val());

         })


         // event listener for the hidden.bs.modal event
         $('#myModal').on('hidden.bs.modal', function () {
             // remove the event listener for the shown.bs.modal event
             $(this).off('shown.bs.modal');
         });

         // event listener for the hidden.bs.modal event
         $('#deleteConfirmModal').on('hidden.bs.modal', function () {
             // remove the event listener for the shown.bs.modal event
             $(this).off('shown.bs.modal');
         });
     </script>
    
</asp:Content>
