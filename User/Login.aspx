<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CountryRoads.User.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>User Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"/>
    <link href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css" rel="stylesheet"/>

</head>

<body style= "background-color: rgba(41,59,81,255)">
    <form id="form2" runat="server">
        <div class="container-fluid" >
            <div class="row justify-content-center">
            <div class="col mt-5 ms-5">
                <div class ="w-75 p-3 m-3 text-center">
                <h1 class="pb-5 text-white">Glad to have you back!</h1>

                <div class="pb-5 mt-5">
                <label for="username" class="text-center fs-4 text-white form-label">Username:</label>
                <asp:TextBox type="text" class="form-control" ID="username" runat="server"></asp:TextBox>
                </div>

                <div class="pb-5">
                <label for="password" class="text-center fs-4 text-white form-label">Password:</label>  
                <asp:TextBox type="password" class="form-control" ID="password" runat="server"></asp:TextBox>
                </div>

                <div class="pb-3">
                <asp:Label ID="ErrorMsg" class="text text-danger" runat="server" Text="" ></asp:Label>
                </div>

                <div class="pb-5">
                <asp:Button ID="loginBtn" type="submit" class="btn btn-primary mt-4" runat="server" Text="Login" OnClick="Login_Click"/>
                </div>

                <div class="pb-5">
                <a id="registeration" href="UserLandingPage.aspx">Not a member yet? Register for a free account!</a>
                </div>
                </div>

            </div>
            <div class="col mt-5">
                <img src="https://cdn.dribbble.com/users/1175943/screenshots/2721893/media/33c0e59a46770e44a943877dfc3b637a.gif" class="imgFlags" width = "750px" alt ="Flags" />
            </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.js"></script>
</body>
</html>
