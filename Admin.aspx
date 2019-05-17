<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="HimelStudent.Admin" %>

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
                        <a href="" data-target="#home" data-toggle="tab" class="nav-link  active">Student Table</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#addstudent" data-toggle="tab" class="nav-link">Add Student</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#addadmin" data-toggle="tab" class="nav-link">Add Admin</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#profile" data-toggle="tab" class="nav-link">Admin Profile</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#editadmin" data-toggle="tab" class="nav-link">Edit Admin Info</a>
                    </li>
                </ul>
                <div class="tab-content py-4">

                    <div class="tab-pane  active" id="home">

                      <div class="table-responsive">
                        <table class="table table-hover">
                          <thead>
                            <tr>
                              <th>#</th>
                              <th>ID</th>
                              <th>Username</th>
                              <th>First Name</th>
                              <th>Last Name</th>
                              <th>Gender</th>
                              <th>Email</th>
                              <th>Number</th>
                              <th>Password</th>
                              <th>Usertype</th>
                              <th>Department</th>
                              <th>CGPA</th>
                              <th>Semester</th>
                            </tr>
                          </thead>
                          <tbody id="items">
                            <!--<%//=getAllStudents()%>-->

                            <% int total = 1; if(student_query_data != null && student_query_data.Count>0){
                                    foreach(var student in student_query_data)
                                    {%>
                                    <tr>
                                        <td><%=total++%></td>
                                        <td><%=student.sid%></td>
                                        <td><a href="Student.aspx?id=<%=student.id%>"><%=student.username%></a></td>
                                        <td><%=student.fname%></td>
                                        <td><%=student.lname%></td>
                                        <td><%=student.gender%></td>
                                        <td><%=student.email%></td>
                                        <td><%=student.number%></td>
                                        <td><%=student.password%></td>
                                        <td><%=student.usertype%></td>
                                        <td><%=student.department%></td>
                                        <td><%=student.cgpa%></td>
                                        <td><%=student.semester%></td>
                                    </tr>
                                    <%}
                                }%>
                            <!--<tr>
                              <td>1</td>
                              <td>Table cell</td>
                              <td>Table cell</td>
                              <td>Table cell</td>
                              <td>Table cell</td>
                              <td>Table cell</td>
                              <td>Table cell</td>
                            </tr>-->
                          </tbody>
                        </table>
                        <hr />
                        <div class="row">
                          <div class="col-md-4 col-md-offset-4 text-center">
                  	        <ul class="pagination" id="myPager"></ul>
                          </div>
                        </div>
                      </div><!--/table-resp-->
              
                      <hr />
              
                     </div><!--/tab-pane-->

                    <div class="tab-pane" id="addstudent">
                        <form method="post" action="AddStudent.aspx" enctype="multipart/form-data" id="addstd" runat="server">
                            <div class="form-group">
                                <div class="form-row">
                                <div class="col-md-6">
                                    <label for="username">Student Name</label>
                                    <input class="form-control" id="username" type="text" aria-describedby="nameHelp" placeholder="Enter Student Name" name="username" />
                                    <small id="usernameHelp" class="text-danger"></small>
                                </div>
                                <div class="col-md-6">
                                    <label for="sid">Student ID</label>
                                    <input class="form-control" id="sid" type="text" aria-describedby="nameHelp" placeholder="Enter Student ID" name="sid" />
                                    <small id="sidHelp" class="text-danger"></small>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <label for="firstname">First name</label>
                                    <input class="form-control" id="firstname" type="text" aria-describedby="nameHelp" placeholder="Enter first name" name="firstname" />
                                    <small id="firstnameHelp" class="text-danger"></small>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <label for="lastname">Last name</label>
                                    <input class="form-control" id="lastname" type="text" aria-describedby="nameHelp" placeholder="Enter last name" name="lastname" />
                                    <small id="lastnameHelp" class="text-danger"></small>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <label for="department">Department:</label>
                                    <select class="form-control" id="department" name="department">
                                        <option value="CSE">CSE</option>
                                        <option value="EEE">EEE</option>
                                        <option value="BBA">BBA</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <label for="semester">Semester:</label>
                                    <select class="form-control" id="semester" name="semester">
                                        <option value="1ST">1ST</option>
                                        <option value="2ND">2ND</option>
                                        <option value="3RD">3RD</option>
                                        <option value="4TH">4TH</option>
                                        <option value="5TH">5TH</option>
                                        <option value="6TH">6TH</option>
                                        <option value="7TH">7TH</option>
                                        <option value="8TH">8TH</option>
                                        <option value="9TH">9TH</option>
                                        <option value="10TH">10TH</option>
                                        <option value="11TH">11TH</option>
                                        <option value="12TH">12TH</option>
                                        <option value="13TH">13TH</option>
                                        <option value="14TH">14TH</option>
                                        <option value="15TH">15TH</option>
                                        <option value="Above">Above</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <label for="cgps">CGPA</label>
                                    <input class="form-control" id="cgpa" type="number" step="0.01" min="0" max="4" aria-describedby="nameHelp" placeholder="Enter CGPA" name="cgpa" />
                                    <small id="cgpaHelp" class="text-danger"></small>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <label for="gender">Gender:</label>
                                        <select class="form-control" id="gender" name="gender">
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="Other">Other</option>
                                        </select>
                                    </div>
                                    <!--<div class="col-md-6">
                                        <label for="DOB">Date of Birth</label>
                                        <input class="form-control" id="DOB" type="date" name="dob" />
                                    </div>-->
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <label for="email">Email address</label>
                                        <input class="form-control" id="email" type="email" aria-describedby="emailHelp" placeholder="Enter email" name="email" />
                                        <small id="emailHelp" class="text-danger"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="pnumber">Phone Number</label>
                                        <input class="form-control" id="pnumber" type="text" aria-describedby="phoneHelp" placeholder="Enter phone number" name="pnumber" />
                                        <small id="pnumberHelp" class="text-danger"></small>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <label for="password">Password</label>
                                        <input class="form-control" id="password" type="password" placeholder="Password"  name="password" />
                                        <small id="passwordHelp" class="text-danger"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="cpassword">Confirm password</label>
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
                            <input type="hidden" name="acctype" value="student" />
                            <input class="btn btn-primary btn-block" type="submit" value="Add Strudent" />
                        </form>
                    </div>

                    <div class="tab-pane" id="addadmin">
                        <!--<form method="post" action="AddAdmin.aspx" enctype="multipart/form-data" id="addadm">-->
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <label for="username">Admin Name</label>
                                        <input class="form-control" id="adusername" type="text" aria-describedby="nameHelp" placeholder="Enter Student Name" name="username" />
                                        <small id="usernameHelp" class="text-danger"></small>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <label for="email">Email address</label>
                                        <input class="form-control" id="ademail" type="email" aria-describedby="emailHelp" placeholder="Enter email" name="email" />
                                        <small id="emailHelp" class="text-danger"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="pnumber">Phone Number</label>
                                        <input class="form-control" id="adpnumber" type="text" aria-describedby="phoneHelp" placeholder="Enter phone number" name="pnumber" />
                                        <small id="pnumberHelp" class="text-danger"></small>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <label for="password">Password</label>
                                        <input class="form-control" id="adpassword" type="password" placeholder="Password"  name="password" />
                                        <small id="passwordHelp" class="text-danger"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="cpassword">Confirm password</label>
                                        <input class="form-control" id="adcpassword" type="password" placeholder="Confirm password" name="cpassword" />
                                        <small id="cpasswordHelp" class="text-danger"></small>
                                    </div>
                                </div>
                            </div>                          
                            
                            <!--<div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <label for="profilepic">Profile Pic</label>
                                        <input class="form-control" id="adprofilepic" type="file" name="profilepic" />
                                    </div>
                                    <small id="profilepicHelp" class="text-danger"></small>
                                </div>
                            </div>-->
                            <!--<a class="btn btn-primary btn-block" href="/registration">Register</a>-->
                            <input type="hidden" name="acctype" value="admin" />
                            <!--<input class="btn btn-primary btn-block" type="submit" value="Add Admin" />-->
                            <button type="button" class="btn btn-primary btn-block" onclick="AddAdmin()" >Add New Admin</button>
                        <!--</form>-->
                    </div>

                    <div class="tab-pane" id="profile">
                        <h5 class="text-capitalize mb-3">(<%=admin_query_data[0].usertype%>) <%=admin_query_data[0].username%>'s Profile</h5>
                        <div class="row">
                            <div class="col-md-6 text-capitalize">
                                
                                <h6>About</h6>
                                <p>
                                    Admin's username : <%=admin_query_data[0].username%>
                                </p>
                                <p>
                                    Email : <%=admin_query_data[0].email%>
                                </p>
                                <p>
                                    Phone Number : <%=admin_query_data[0].number%>
                                </p>
                                <p>
                                    Password : <%=admin_query_data[0].password%>
                                </p>
                            </div>
                            <div class="col-md-6">
                                <hr />
                                <span class="badge badge-primary"><i class="fa fa-user"></i> <%=admin_query_data[0].username%></span>
                                <span class="badge badge-success"><i class="fa fa-cog"></i> <%=admin_query_data[0].email%></span>
                                <span class="badge badge-danger"><i class="fa fa-eye"></i> <%=admin_query_data[0].number%></span>
                                <span class="badge badge-secondary"><i class="fa fa-eye"></i> <%=admin_query_data[0].password%></span>
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

                    <div class="tab-pane" id="editadmin">
                        <!--<form method="post" action="EditAdmin.aspx" enctype="multipart/form-data"  id="editadm">-->
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <label for="username">Admin Name</label>
                                        <input class="form-control" id="eusername" type="text" aria-describedby="nameHelp" placeholder="Enter Student Name" name="sname" value="<%=admin_query_data[0].username%>" readonly />
                                        <small id="snameHelp" class="text-danger"></small>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <label for="email">Email address</label>
                                        <input class="form-control" id="eemail" type="email" aria-describedby="emailHelp" placeholder="Enter email" value="<%=admin_query_data[0].email%>" name="email" />
                                        <small id="emailHelp" class="text-danger"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="pnumber">Phone Number</label>
                                        <input class="form-control" id="epnumber" type="text" aria-describedby="phoneHelp" placeholder="Enter phone number" value="<%=admin_query_data[0].number%>" name="pnumber" />
                                        <small id="pnumberHelp" class="text-danger"></small>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <label for="password">Password</label>
                                        <input class="form-control" id="epassword" type="password" placeholder="Password" value="<%=admin_query_data[0].password%>"  name="password" />
                                        <small id="passwordHelp" class="text-danger"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="cpassword">Confirm password</label>
                                        <input class="form-control" id="ecpassword" type="password" placeholder="Confirm password" name="cpassword" />
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
                            <input type="hidden" id="aid" name="aid" value="<%=Session["id"] %>" />
                            <!--<input class="btn btn-primary btn-block" type="submit" value="Update Info" />-->
                            <button type="button" class="btn btn-primary btn-block" onclick="EditAdmin()" >Update Admin Info!</button>
                        <!--</form>-->
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
                      <p class="card-text"><%=Session["username"] %></p>
                      <p class="card-text"><%=Session["email"] %></p>
                      <p class="card-text"><%=Session["number"] %></p>
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

    <script>
        function AddAdmin() {
            
            alert('Adding new Admin clicked!');
            var adusername = document.getElementById("adusername").value;
            var ademail = document.getElementById("ademail").value;
            var adpnumber = document.getElementById("adpnumber").value;
            var adpassword = document.getElementById("adpassword").value;
            var adcpassword = document.getElementById("adcpassword").value;

            if (adusername == "" || ademail == "" || adpnumber == "" || adpassword == "" || adcpassword == "") {

                alert('Please fill up all blanks!');
            }

            if (adpassword == adcpassword) {

                const xhr = new XMLHttpRequest();
                xhr.open("POST", 'AddAdmin.aspx', true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhr.send("username=" + adusername + "&email=" + ademail + "&pnumber=" + adpnumber + "&password=" + adpassword);
                xhr.onload = function () {

                    if (this.status === 200) {

                        var result = this.responseText;
                        alert(result);
                    }
                }
            } else {

                alert("Password Didn't match!");
            }
        }

        function EditAdmin() {
            
            alert('Editing Exist Admin clicked!');
            var aid = document.getElementById("aid").value;
            var eusername = document.getElementById("eusername").value;
            var eemail = document.getElementById("eemail").value;
            var epnumber = document.getElementById("epnumber").value;
            var epassword = document.getElementById("epassword").value;
            var ecpassword = document.getElementById("ecpassword").value;

            if (eusername == "" || eemail == "" || epnumber == "" || epassword == "" || ecpassword == "") {

                alert('Please fill up all blanks!');
            }

            if (epassword == ecpassword) {

                const xhr = new XMLHttpRequest();
                xhr.open("POST", 'EditAdmin.aspx', true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhr.send("id=" + aid + "&username=" + eusername + "&email=" + eemail + "&pnumber=" + epnumber + "&password=" + epassword);
                xhr.onload = function () {

                    if (this.status === 200) {

                        var result = this.responseText;
                        alert(result);
                    }
                }
            } else {

                alert("Password Didn't match!");
            }
        }
    </script>
    
</body>
</html>
