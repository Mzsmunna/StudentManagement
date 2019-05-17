<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="HimelStudent.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Profile</title>
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

    <div class="container" style="padding-top: 70px;">
        
        <div class="row my-2">
            <div class="col-lg-8 order-lg-2">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#editstudent" data-toggle="tab" class="nav-link">Edit Info</a>
                    </li>
                </ul>
                <div class="tab-content py-4">
                    <div class="tab-pane active" id="profile">
                       <% if(student_query_data != null && student_query_data.Count>0){%>  
                        <h5 class="text-capitalize mb-3"><%=student_query_data[0].username%>'s Profile - About</h5>
                       <%}%>
                        <div class="row">
                            <div class="col-md-6 text-capitalize">                             
                                <% if (student_query_data != null && student_query_data.Count > 0) {%>
                                <p>
                                    <strong>Student ID : <%=student_query_data[0].sid%></strong>
                                </p>
                                <p>
                                    <strong>Full Name : <%=student_query_data[0].fname%>
                                    <%=student_query_data[0].lname%></strong>
                                </p>
                                <p>
                                    <strong>Gender : <%=student_query_data[0].gender%></strong>
                                </p>
                                <!--<p>
                                    Date of Birth : user[0]->dob
                                </p>-->
                                <p>
                                    <strong>Email : <%=student_query_data[0].email%></strong>
                                </p>
                                <p>
                                    <strong>Phone Number : <%=student_query_data[0].number%></strong>
                                </p>
                                <p>
                                    <strong>Password : <%=student_query_data[0].password%></strong>
                                </p>
                                <p>
                                    <strong>Department : <%=student_query_data[0].department%></strong>
                                </p>
                                <p>
                                    <strong>CGPA : <%=student_query_data[0].cgpa%></strong>
                                </p>
                                <p>
                                    <strong>Semester : <%=student_query_data[0].semester%></strong>
                                </p>
                                <!--<p>
                                    Address : user[0]->country, user[0]->city, user[0]->area, user[0]->address
                                </p>-->
                               <%}%>
                            </div>
                            <div class="col-md-6">
                                <hr />
                                <span class="badge badge-primary"><i class="fa fa-user"></i> ID: <%=student_query_data[0].sid%></span>
                                <span class="badge badge-success"><i class="fa fa-cog"></i> Department : <%=student_query_data[0].department%></span>
                                <span class="badge badge-danger"><i class="fa fa-eye"></i> CGPA : <%=student_query_data[0].cgpa%></span>
                                <span class="badge badge-secondary"><i class="fa fa-eye"></i> Semester : <%=student_query_data[0].semester%></span>
                            </div>
                            <!--<div class="col-md-12">
                                <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span> Recent Activity</h5>
                                <table class="table table-sm table-hover table-striped">
                                    <tbody>
                                        <tr>
                                           <td>
                                               <a href="/cloth/activity->notify_forid">activity->notify_dtls
                                               <span class="pull-right small text-muted">activity->notify_date activity->notify_time </span></a>
                                           </td>
                                           <td>
                                               <strong>John</strong> deleted My Board1 in <strong>`Discussions`</strong>
                                           </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>-->
                        </div>
                        <!--/row-->
                    </div>

                    <div class="tab-pane" id="editstudent">
                        <form method="post" action="EditStudent.aspx" enctype="multipart/form-data" id="addstudent" runat="server">
                            <div class="form-group">
                                <div class="form-row">
                                <div class="col-md-6">
                                    <label for="username">Student Name</label>
                                    <input class="form-control" id="username" type="text" aria-describedby="nameHelp" placeholder="Enter Student Name" name="username" value="<%=student_query_data[0].username%>" readonly />
                                    <small id="usernameHelp" class="text-danger"></small>
                                </div>
                                <div class="col-md-6">
                                    <label for="sid">Student ID</label>
                                    <% if ((Session["usertype"].ToString() == "admin") || (Session["usertype"].ToString() == "Admin")) {%>
                                    <input class="form-control" id="sid" type="text" aria-describedby="nameHelp" placeholder="Enter Student ID" name="sid" value="<%=student_query_data[0].sid%>" />
                                    <%} else if((Session["usertype"].ToString() == "student") || (Session["usertype"].ToString() == "Student")) {%>
                                    <input class="form-control" id="sid" type="text" aria-describedby="nameHelp" placeholder="Enter Student ID" name="sid" value="<%=student_query_data[0].sid%>" readonly />
                                    <%}%>
                                    <small id="sidHelp" class="text-danger"></small>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <label for="firstname">First name</label>
                                    <input class="form-control" id="firstname" type="text" aria-describedby="nameHelp" placeholder="Your first name" name="firstname" value="<%=student_query_data[0].fname%>" />
                                    <small id="firstnameHelp" class="text-danger"></small>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <label for="lastname">Last name</label>
                                    <input class="form-control" id="lastname" type="text" aria-describedby="nameHelp" placeholder="Your last name" name="lastname" value="<%=student_query_data[0].lname%>" />
                                    <small id="lastnameHelp" class="text-danger"></small>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <label for="department">Department:</label>
                                    <% if ((Session["usertype"].ToString() == "admin") || (Session["usertype"].ToString() == "Admin")) {%>
                                    <input class="form-control" id="department" type="text" aria-describedby="nameHelp" placeholder="Your Department" name="department" value="<%=student_query_data[0].department%>" />
                                    <%} else if((Session["usertype"].ToString() == "student") || (Session["usertype"].ToString() == "Student")) {%>
                                    <input class="form-control" id="department" type="text" aria-describedby="nameHelp" placeholder="Your Department" name="department" value="<%=student_query_data[0].department%>" readonly />
                                    <%}%>
                                    <small id="departmentHelp" class="text-danger"></small>     
                                </div>
                                <div class="col-md-6 mt-3">
                                    <label for="semester">Semester:</label>
                                    <% if ((Session["usertype"].ToString() == "admin") || (Session["usertype"].ToString() == "Admin")) {%>
                                    <input class="form-control" id="semester" type="text" aria-describedby="nameHelp" placeholder="Your Running Semester" name="semester" value="<%=student_query_data[0].semester%>" />
                                    <%} else if((Session["usertype"].ToString() == "student") || (Session["usertype"].ToString() == "Student")) {%>
                                    <input class="form-control" id="semester" type="text" aria-describedby="nameHelp" placeholder="Your Running Semester" name="semester" value="<%=student_query_data[0].semester%>" readonly />
                                    <%}%> 
                                    <small id="semesterHelp" class="text-danger"></small>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <label for="cgps">CGPA</label>
                                    <% if ((Session["usertype"].ToString() == "admin") || (Session["usertype"].ToString() == "Admin")) {%>
                                    <input class="form-control" id="cgpa" type="number" step="0.01" min="0" max="4" aria-describedby="nameHelp" placeholder="Your CGPA" name="cgpa" value="<%=student_query_data[0].cgpa%>" />
                                    <%} else if((Session["usertype"].ToString() == "student") || (Session["usertype"].ToString() == "Student")) {%>
                                    <input class="form-control" id="cgpa" type="number" step="0.01" min="0" max="4" aria-describedby="nameHelp" placeholder="Your CGPA" name="cgpa" value="<%=student_query_data[0].cgpa%>" readonly />
                                    <%}%>
                                    <small id="cgpaHelp" class="text-danger"></small>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-row">
                                <div class="col-md-6">
                                    <label for="gender">Gender:</label>
                                    <select class="form-control" id="gender" name="gender">
                                        <option value="<%=student_query_data[0].gender%>"><%=student_query_data[0].gender%></option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>
                                <!--<div class="col-md-6">
                                    <label for="DOB">Date of Birth</label>
                                    <% //if ((Session["usertype"].ToString() == "admin") || (Session["usertype"].ToString() == "Admin")) {%>
                                    <input class="form-control" id="DOB" type="date" placeholder="Your Birth Date" name="DOB" readonly />
                                    <%//} else if((Session["usertype"].ToString() == "student") || (Session["usertype"].ToString() == "Student")) {%>
                                    <input class="form-control" id="DOB" type="date" placeholder="Your Birth Date" name="DOB" />
                                    <%//}%>          
                                </div>-->
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-row">
                                <div class="col-md-6">
                                    <label for="email">Email address</label>
                                    <% if ((Session["usertype"].ToString() == "admin") || (Session["usertype"].ToString() == "Admin")) {%>
                                    <input class="form-control" id="email" type="email" aria-describedby="emailHelp" placeholder="Enter email" name="email" value="<%=student_query_data[0].email%>" readonly />
                                    <%} else if((Session["usertype"].ToString() == "student") || (Session["usertype"].ToString() == "Student")) {%>
                                    <input class="form-control" id="email" type="email" aria-describedby="emailHelp" placeholder="Enter email" name="email" value="<%=student_query_data[0].email%>" />
                                    <%}%> 
                                    <small id="emailHelp" class="text-danger"></small>
                                </div>
                                <div class="col-md-6">
                                    <label for="pnumber">Phone Number</label>
                                    <% if ((Session["usertype"].ToString() == "admin") || (Session["usertype"].ToString() == "Admin")) {%>
                                    <input class="form-control" id="pnumber" type="text" aria-describedby="phoneHelp" placeholder="Enter phone number" name="pnumber" value="<%=student_query_data[0].number%>" readonly />
                                    <%} else if((Session["usertype"].ToString() == "student") || (Session["usertype"].ToString() == "Student")) {%>
                                    <input class="form-control" id="pnumber" type="text" aria-describedby="phoneHelp" placeholder="Enter phone number" name="pnumber" value="<%=student_query_data[0].number%>" />
                                    <%}%>           
                                    <small id="pnumberHelp" class="text-danger"></small>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-row">
                                <div class="col-md-6">
                                    <label for="password">Password</label>
                                    <input class="form-control" id="password" type="password" placeholder="Password" name="password" value="<%=student_query_data[0].password%>" />
                                    <small id="passwordHelp" class="text-danger"></small>
                                </div>
                                <div class="col-md-6">
                                    <label for="cpassword">Change password</label>
                                    <input class="form-control" id="cpassword" type="password" placeholder="Confirm password" name="cpassword" />
                                    <small id="cpasswordHelp" class="text-danger"></small>
                                </div>
                                </div>
                            </div>
                                                     
                            <!--<div class="form-group">
                                <div class="form-row">
                                <div class="col-md-6">
                                    <label for="profilepic">Profile Pic</label>
                                    <input class="form-control" id="profilepic" type="file" name="profilepic" />
                                </div>
                                <small id="profilepicHelp" class="text-danger"></small>
                                </div>
                            </div>-->
                            <!--<a class="btn btn-primary btn-block" href="/registration">Register</a>-->
                            <input type="hidden" name="id" value="<%=student_query_data[0].id%>" />
                            <input class="btn btn-primary btn-block" type="submit" value="Update Info" />
                            <% if ((Session["usertype"].ToString() == "admin") || (Session["usertype"].ToString() == "Admin")){%>
                            <button type="button" class="btn btn-danger btn-block dropdown-toggle ml-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Delete Student</button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="Delete.aspx?did=<%=student_query_data[0].id%>">Yes</a>
                                <!--<input class="dropdown-item" type="submit" value="Yes" name="yes"/>-->
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">No</a>
                            </div>
                            <%}%>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 order-lg-1 text-center">
                <div class="card mb-2" style="width: 22rem;">
                    <!--<img class="card-img-top" src="/custom_public/uploads/users/user[0]->username}}/profilepic/$user[0]->username.jpg" onerror="this.src = '/custom_public/images/user.png'" alt="Card image cap">-->
                    <div class="card-header text-muted">
                        <span class="text-capitalize"><%=Session["username"] %></span>
                    </div>
                    <div class="card-body">
                      <p class="card-text"><%=Session["sid"] %></p>
                      <p class="card-text"><%=Session["email"] %></p>
                      <p class="card-text"><%=Session["number"]%></p>
                    </div>
                    <div class="card-footer">
                        <div class="input-group">
                            <form  action="/user/change-profilepic" method="post" id="logout">
                                <div class="btn-group" role="group" aria-label="First group">
                                    <!--<input type="submit" class="input-group-text p-2" name="logout" value="Logout" />-->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Himel's Student Management 2019</p>
        </div>
    <!-- /.container -->
    </footer>

     <!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    
</body>
</html>
