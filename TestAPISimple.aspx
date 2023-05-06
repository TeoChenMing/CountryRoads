<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestAPISimple.aspx.cs" Inherits="CountryRoads.TestAPISimple" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Test API here Bozo
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Add into DB!" OnClick="Button2_Click" />
            <br />
            Result: <br />
            _______ <br />

            <asp:Label ID="testresult" runat="server">

            </asp:Label>
        </div>
    </form>
</body>
</html>
