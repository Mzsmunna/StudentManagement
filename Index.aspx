<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="HimelStudent.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700" rel="stylesheet" />
    <link href="css/mains.css" rel="stylesheet" />
    <!--===============================================================================================-->	
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css" />
    <!--===============================================================================================-->
</head>
<body>
   <!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container position-relative">
            <a class="navbar-brand" href="Index.aspx"> Himel's Student Management </a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <% if(Session["usertype"] != null){%>
                <li class="nav-item">
                    <a class="nav-link" href="Admin.aspx">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Logout.aspx">logout</a>
                </li>
                <%}else{%>
                <li class="nav-item">
                    <a class="nav-link" href="Login.aspx">login</a>
                </li>
                <%}%>
                <li class="nav-item">
                    <a class="nav-link" href="#">Register</a>
                </li>
            </ul>
          </div>
        </div>
     </nav>
    <!--<form id="form1" runat="server">-->
    <div class="s010">
      <form>
        <div class="inner-form">
          <div class="basic-search">
            <div class="input-field">
              <input id="search" type="text" placeholder="Type Keywords" />
              <div class="icon-wrap">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                  <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                </svg>
              </div>
            </div>
          </div>
          <div class="advance-search" id="advance-search" style="display: none;">
            <span class="desc">SEARCHED RESULTS</span>
            <div class="row" style='overflow:scroll; width:720px;height:300px;'>
                <table class="table table-responsive" id="mzstable">
                  <thead>
                    <tr>
                     <th>ID</th>
                     <th>Username</th>
                     <th>Full Name</th>
                     <th>Gender</th>
                     <th>Email</th>
                     <th>Department</th>
                     <th>Semester</th>
                    </tr>
                  </thead>
                  <tr>
                    <td>John</td>
                    <td>Doe</td>
                    <td>john@example.com</td>
                  </tr>
                  <tr>
                    <td>Mary</td>
                    <td>Moe</td>
                    <td>mary@example.com</td>
                  </tr>
                </table>
            </div>
          </div>
        </div>
      </form>
    </div>
    <!--<script src="js/extention/choices.js"></script>-->
    <script>
        var search = document.getElementById("search");
        var e1 = document.getElementById("mzstable");

        search.addEventListener('keyup', function (event) {
            console.log("button pressed!");
            var text = document.getElementById("search").value;
            var result="";
            
            console.log(text);

            if (text != "") {
                text += "%";
                const xhr = new XMLHttpRequest();
                xhr.open("POST", 'Search.aspx', true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhr.send("text=" + text);
                xhr.onload = function () {

                    if (this.status === 200) {

                        result = this.responseText;
                        console.log(result);
                        var e1 = document.getElementById("mzstable");
                        console.log(e1);
                        e1.innerHTML = result;
                        var display = document.getElementById("advance-search");
                        display.style.display = "block";
                    }
                }

            } else {

                console.log("Empty String!");
                var display = document.getElementById("advance-search");
                display.style.display = "none";
            }

        });
    </script>
    <!--</form>-->
</body>
</html>

