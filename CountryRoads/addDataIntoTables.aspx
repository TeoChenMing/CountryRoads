<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addDataIntoTables.aspx.cs" Inherits="CountryRoads.addDataIntoTables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Insert data into Table</h1>

            <asp:Button ID="btn_addToUsers" runat="server" Text="Add Users" OnClick="btn_addToUsers_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_clearUsers" runat="server" Text="Clear Users" OnClick="btn_clearUsers_Click" />
            <br />
            <asp:Button ID="btn_addToQuestions" runat="server" Text="Add Ques" OnClick="btn_addToQuestions_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_clearQuestions" runat="server" Text="Clear Ques" OnClick="btn_clearQuestions_Click" />
        </div>
    </form>
</body>
</html>
