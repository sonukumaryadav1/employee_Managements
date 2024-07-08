<%@include file="/WEB-INF/view/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/home.css">
     <style>
     /* body {
          background: #fff;
          font-family: Arial, sans-serif;
          margin: 0;
          padding: 0;
          background-image: url(https://nayainsurancetax.com/wp-content/uploads/2019/01/insurance-quote-form-background-fontana-ca.jpg);
      }
      .modal-content {
          background-color: mintcream;
      }
      .form {
          font-size: 20px;
          font-weight: bold;
          color: lawngreen;
          text-align: center;
          margin-bottom: 20px;
      }
      .form-group-item span {
          color: springgreen;
      }*/
  </style> 

</head>
<body>

                   <div class="container mt-5">
                          <table class="table table-bordered">
                              <thead>
                                  <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">employeeName</th>
                                    <th scope="col">Address</th>
                                    <%
                                    if(role.equalsIgnoreCase("Admin"))
                                    { %>
                                    <th scope="col">Designation</th>
                                    <th scope="col">possword</th>
                                    <%
                                    }
                                    %>

                                    <th scope="col">mobile no</th>
                                    <th scope="col">email</th> 
                                    <%
                                    if(role.equalsIgnoreCase("Admin"))
                                    { %>   

                                    <th scope="col">salary</th>

                                    <%
                                    }
                                    %>   
                                    <th scope="col">gender</th>
                                    <th scope="col">Date of birth</th>
                                    <th scope="col">Date of Joining</th>
                                    <th scope="col">Department</th>  
                                    <th scope="col">Action</th>
                                  </tr>
                              </thead>
                              <tbody>

                                    <c:forEach var="employee" items="${list}" varStatus="status" >
                                      <tr>
                                          <td scope="row">${status.index + 1}</td>
                                              <td class="d-flex align-items-center"><img src="../../resources/uploads/${employee.photo}" alt="" class="rounded-circle bg-primary me-3" height="40px" width="40px"><c:out value="${employee.employeeName}"/></td>
                                              <td><c:out value="${employee.employeeAddress}"/></td>
                                              <%
                                              if(role.equalsIgnoreCase("Admin"))
                                              { %>
                                              <td><c:out value="${employee.employeeDesignation}"/></td>
                                              <td><c:out value="${employee.possword}"/></td>
                                              <%
                                              }
                                              %>
                                              <td><c:out value="${employee.mobile}"/></td>
                                              <td><c:out value="${employee.email}"/></td>
                                              <%
                                              if(role.equalsIgnoreCase("Admin"))
                                              { %>
                                              <td><c:out value="${employee.salary}"/></td>
                                              <%
                                              }
                                              %>
                                              <td><c:out value="${employee.gender}"/></td>
                                              <td><c:out value="${employee.dob}"/></td>
                                              <td><c:out value="${employee.doj}"/></td>
                                              <td><c:out value="${employee.department}"/></td>
                                              <%
                                              if(role.equalsIgnoreCase("Admin"))
                                              { %>
                                              <td> <a class="btn btn-primary" data-toggle="modal" data-target="#editModal" onclick="EditCourses('${employee.employeeId}')">Edit</a>  
                                                  <a class="btn btn-danger" href="/employeeDelete/${employee.employeeId}"onclick="return confirm('you want to delete this record')">Delete</a></td>              
                                              <%
                                              }
                                              %>
                                  </tr>
                                </c:forEach>  
                               
                              </tbody>
                          </table>
                      </div>
                  
                      <!-- Modal -->
                      <div class="modal modal-md fade" id="editModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 
                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editModalLabel">Edit Employee</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
  
                                </div>

                                  <div class="modal-body">
                                      <form action="/employeeupdate" method="post" enctype="multipart/form-data">

                                      <input hidden type="text" name="employeeId" >
                                        
                                          <div class="form">Registration For Employee</div>
                                                            
                                          <div class="form-group">
                                            <label>Employee id:</label>
                                            <input type="number" id="id" name="employeeId" class="form-control" placeholder="id">
                                        </div>
                                          <div class="form-group">
                                              <label>Employee Name:</label>
                                              <input type="text" name="employeeName" class="form-control" placeholder="Enter Your Name" id="contact-name" onkeyup="validateName()">
                                              <span id="name-error"></span>
                                          </div>
                                          <div class="form-group">
                                              <label>Employee Address:</label>
                                              <input type="text" id="address" name="employeeAddress" class="form-control" placeholder="Enter Your Address">
                                          </div>
                                          <div class="form-group">
                                              <label>Email:</label>
                                              <input type="email" name="email" class="form-control" placeholder="Enter Your Email" id="contact-email" onkeyup="validateEmail()">
                                              <span id="email-error"></span>
                                          </div>
                                          <div class="form-group">
                                              <label>Possword:</label>
                                               <input type="password" name="possword" class="form-control" placeholder="Enter Your Password" id="contact-password" onkeyup="validatePassword()"> 
                                              <span id="pass-error"></span>
                                          </div>
                                          <div class="form-group">
                                              <label>Mobile No:</label>
                                              <input type="number" name="mobile" class="form-control" placeholder="Mobile No" id="contact-phone" onkeyup="validatePhone()">
                                              <span id="phone-error"></span>
                                          </div>
                                          <div class="form-group">
                                              <label>Salary:</label>
                                              <input type="number" id="salary" name="salary" class="form-control" placeholder="Enter Salary">
                                          </div>
                                          <div class="form-group">
                                              <label>Date of Birth:</label>
                                              <input type="date" id="dob" name="dob" class="form-control" required>
                                          </div>
                                          <div class="form-group">
                                              <label>Date of Joining:</label>
                                              <input required name="doj" type="date" class="form-control" id="inputDoj">
                                          </div>
                                          <div class="form-group">
                                              <label>Employee Department:</label>
                                              <select name="department" id="department" class="form-control">
                                                  <option value="">---Select Department---</option>
                                                  <option value="HR">HR Department</option>
                                                  <option value="Developer">Developer Department</option>
                                              </select>
                                          </div>
                                        
                                          <div class="form-group">
                                              <label>Employee Designation:</label>
                                              <select name="employeeDesignation" id="designation" class="form-control">
                                                  <option value="">---Select Designation---</option>
                                                  <option value="HR">HR</option>
                                                  <option value="Admin">Admin</option>
                                                  <option value="Developer">Developer</option>
                                              </select>
                                          </div>
                                          <div class="form-group">
                                              <label>Gender</label>
                                              <select name="Gender" id="Gender" class="form-control">
                                                  <option value="">---Select Gender---</option>
                                                  <option value="Male">Male</option>
                                                  <option value="Female">Female</option>
                                                  <option value="Other">Other</option>
                                              </select>
                                          </div>
                                          <div class="form-group">
                                              <label for="file">Photo:</label>
                                              <input type="file" id="file" name="picture" class="form-control" onchange="return filevalidation()">
                                              <img src="../../resources/uploads"alt="" id="inputImage "style=" height: 37px; width: 40px;margin: left 392px;margin: top -54px;
                                          </div>
                                          <div class="modal-footer">
                                              <button type="reset" class="btn btn-secondary">Reset</button>
                                              <button type="submit" class="btn btn-primary" onclick="return validateform()">Submit <span id="submit-error"></span></button>
                                          </div>
                                      </form>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>   
                      <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
                      <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script> -->
                       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                  
                      <script>
                          var nameError = document.getElementById('name-error');
                          var emailError = document.getElementById('email-error');
                          var passError = document.getElementById('pass-error');
                          var phoneError = document.getElementById('phone-error');
                          var submitError = document.getElementById('submit-error');
                  
                          function validateName() {
                              var name = document.getElementById('contact-name').value;
                              if (name.length == 0) {
                                  nameError.innerHTML = 'Name is required';
                                  return false;
                              }
                              if (!name.match(/^[A-Za-z\s]*$/)) {
                                  nameError.innerHTML = 'Write full name';
                                  return false;
                              }
                              nameError.innerHTML = '<i class="fa fa-check-square" aria-hidden="true"></i>';
                              return true;
                          }
                  
                          function validateEmail() {
                              var email = document.getElementById('contact-email').value;
                              if (email.length == 0) {
                                  emailError.innerHTML = 'Email is required';
                                  return false;
                              }
                              if (!email.match(/^[A-Za-z._\-0-9]@[A-Za-z]\.[a-z]{2,4}$/)) {
                                  emailError.innerHTML = 'Email invalid';
                                  return false;
                              }
                              emailError.innerHTML = '<i class="fa fa-check-square" aria-hidden="true"></i>';
                              return true;
                          }
                  
                          function validatePhone() {
                              var phone = document.getElementById('contact-phone').value;
                              if (phone.length == 0) {
                                  phoneError.innerHTML = 'Phone no is required';
                                  return false;
                              }
                              if (phone.length !== 10) {
                                  phoneError.innerHTML = 'Phone no should be 10 digits';
                                  return false;
                              }
                              if (!phone.match(/^[0-9]{10}$/)) {
                                  phoneError.innerHTML = 'Only digits please';
                                  return false;
                  
                              }
                            }
                           
                           





$('.btn-close').click(function() {
    $('#editModal').modal('hide');
});




                                </script>     
  

  <script>
     function EditCourses(employeeID){
        $.ajax({
            url:'/employeeCall/' + employeeID,
            success:function(data){
                let obj = data;
                console.log(obj);
                $("[name=employeeId]").val(obj.employeeId)
                $("[name=employeeName]").val(obj.employeeName)
                $("[name=mobile]").val(obj.mobile)
                $("[name=email]").val(obj.email)
                $("[name=possword]").val(obj.password)
                $("[name=salary]").val(obj.salary)
                $("[name=dob]").val(obj.dob)
                $("[name=employeeAddress]").val(obj.employeeAddress)
                $("[name=employeeDesignation]").val(obj.employeeDesignation)
                $("[name=department]").val(obj.department)
                $("[name=doj]").val(obj.doj)           
                $("[name=Gender]").val(obj.gender) 
                $("[name=photo]").val(obj.photo) 


                document.getElementById('inputImage').src = '../../resources/uploads/' + obj.photo;
                // console.log( inputImage.src );
            }
        })   

    }
  </script>
  
</body>
</html>
   
<%@include file="/WEB-INF/view/footer.jsp" %>