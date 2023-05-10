<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="CountryRoads.Admin.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"/>
    <link href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css" rel="stylesheet"/>

</head>
<body style="background-color: rgb(32, 64, 104);">
    <form id="form1" runat="server">
        <div class="container position-absolute" style="top: 50%; left: 50%; transform: translate(-50%, -50%);">
            <div class="row">
                <div class="col-6">
                    <img src="https://cdn.dribbble.com/users/111894/screenshots/2636552/globe-spin-800x600.gif" alt="Your Image" style="width:600px;"/>
                </div>
                <div class="col-6">
                
                    <div class="card px-3 py-5 ms-5" style="width: 80%;">
                        <div class="header fs-2 text-center">Admin Login</div>
                        <div class="mb-3 mt-4">
                            <label for="username" class="form-label">Username</label>
                            <asp:TextBox type="text" class="form-control" ID="username" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <asp:TextBox type="password" class="form-control" ID="password" runat="server"></asp:TextBox>
                        </div>

                        <asp:Label ID="ErrorMsg" class="text text-danger" runat="server" Text="" ></asp:Label>

                        <asp:Button ID="Login" type="submit" class="btn btn-primary mt-4" runat="server" Text="Login" OnClick="Login_Click"/>

                        
                        
                    </div>
                
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
