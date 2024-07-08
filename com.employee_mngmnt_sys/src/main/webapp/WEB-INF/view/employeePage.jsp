<%@include file="/WEB-INF/view/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Registration Form</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="/assets/css/home.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 100%;
            margin: 20px auto;
            background:#fff;
            padding: 50px ;
            width: 100%;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(214, 123, 123, 0.1);
        }

        form {
            width: 100%;
        }

        fieldset {
            border: none;
            padding: 0;
            margin: 0;
        }

        .form {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .side-by-side {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .form-group-item {
            flex: 1;
            margin-right: 10px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"],
        input[type="date"],
        select,
        input[type="file"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg viewBox="0 0 10 6" xmlns="http://www.w3.org/2000/svg"><path d="M5 6L0 0h10L5 6z"/></svg>');
            background-size: 10px;
            background-repeat: no-repeat;
            background-position-x: calc(100% - 10px);
            background-position-y: center;
            padding-right: 30px; /* adjust as needed */
        }

        .form-actions {
            margin-top: 20px;
            text-align: right;
        }

        button[type="reset"],
        button[type="submit"] {
            padding: 10px 20px;
            border: none;
            background-color: black;
            color: #ccc;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px;
            margin-left: 10px;
        }

        button[type="reset"]:hover,
        button[type="submit"]:hover {
            background-color: #45a049;
        }
        .error-message {
    color: red;
    font-size: 14px;
    margin-top: 5px;
        }
    </style>
</head>
<body>

<div class="container">
    <form action="/saveEmployee" method="post" enctype="multipart/form-data">
        <fieldset>
            <div class="form" style="color: black;">Registration  Employee</div>
            <div class="form-group">
                <div class="side-by-side">
                    <div class="form-group-item">
                        <label for="name">Employee Name</label>
                        <input type="text" id="contact-name" name="employeeName" placeholder="Enter your name" onkeyup="validateName()"required>
                        <span id="name-error" class="error-message" > </span>
                    </div>
                    <div class="form-group-item">
                        <label for="address">Employee Address</label>
                        <input type="text" id="address" name="employeeAddress" placeholder="Enter Your Address">
                        <span id="name-error" class="error-message" > </span>
                    </div>
                </div>
                <div class="side-by-side">
                    <div class="form-group-item">
                        <label >Email</label>
                        <input type="Email"  name="Email"  placeholder="Enter your email"  id="contact-email"  onkeyup="validateEmail()"required>
                        <span id="email-error" class="error-message" > </span>
                    </div>
                    <div class="form-group-item">
                        <label for="possword">Password</label>
                        <input type="text" id="inputPassword4" name="possword" placeholder="possword"  oninput="validateFor()"required>
                        <span  class="error-message" id="wrongpass" style="display: none;">Password must be at least 8 characters long.!</span>
                    </div>
                </div>
                <div class="side-by-side">
                    <div class="form-group-item">
                        <label for="mobile">Mobile No</label>
                        <input type="number" id="mobile" name="mobile" placeholder="Enter mobile number" required>
                        <span  id="numberMsg" class="error-message" style="display: none;">Number must be at least 10 degit!</span>
                    </div>
                    <div class="form-group-item">
                        <label for="salary">Salary</label>
                        <input type="number" id="salary" name="salary" placeholder="Enter Salary">
                        <span id="name-error" class="error-message" > </span>
                    </div>
                </div>
                <div class="side-by-side">
                    <div class="form-group-item">
                        <label for="dob">Date of Birth</label>
                        <input type="date" id="dob" name="dob">
                        <span id="name-error" class="error-message" > </span>
                    </div>
                    <div class="form-group-item">
                        <label for="inputDoj" class="form-label">Date of Join</label>
                        <input required  name="doj" type="date" class="form-control" id="inputDoj" >
                    </div>
                </div>
                <div class="side-by-side">
                    <div class="form-group-item">
                        <label for="department">Employee Department</label>
                        <select name="department" id="department">
                            <option value="">---Select Department---</option>
                            <option value="HR">HR Department</option>
                            <option value="Developer">Developer Department</option>
                            <span id="name-error" class="error-message" > </span>
                        </select>
                    </div>
                    <div class="form-group-item">
                        <label for="designation">Employee Designation</label>
                        <select name="employeeDesignation" id="designation">
                            <option value="">---Select Designation---</option>
                            <option value="HR">HR</option>
                            <option value="Admin">Admin</option>
                            <option value="Developer">Developer</option>
                            <span id="name-error" class="error-message" > </span>
                        </select>
                    </div>
                    
                </div>
                    
                    </div>
                    
                <div class="side-by-side">
                    <div class="form-group-item">
                        <label for="gender">Gender</label>
                        <select name="Gender" id="gender">
                            <option value="">---Select Gender---</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                            <span id="name-error" class="error-message" > </span>
                        </select>
                    </div>
                    <div class="form-group-item">
                        <label for="photo">Photo</label>
                        <input type="file"  name="pic"  placeholder="select photo" accept=".jpg, .jpeg, .png, .gif"required>
                        <span id="photoInvalid"  class="error-message" style="display: none;">Please upload a file with a .jpg, .jpeg, .png, or .gif extension.</span>
                    </div>
                </div>
            </div>

            <div class="form-actions">
                <button type="reset" >Reset</button>
                <button type="submit" onclick="  validateform()">Submit</button>
            </div>
        </fieldset>
    </form>
</div>

<script>
      var submitError = document.getElementById('submit-error');

function  validateform(){
 if (!validateName() || !validateEmail() || !numberValidate() || !validateFor()) {

     submitError.innerHTML = 'plase fill all valid field';

     return false;
 }
 }


var emailError = document.getElementById('email-error');

     function validateEmail(){

var email = document.getElementById('contact-email').value;
if (email.length == 0) {
    emailError.innerHTML = 'email is required';
    return false;
    
}

if (!email.match(/^[A-Za-z\._\-[0-9][@][A-Za-z][\.][a-z]{2,4}$/)) {
    emailError.innerHTML = 'plase add @gmail.com';
    return false;
    
}

emailError.innerHTML = 'valid'
return true;
}





     var nameError = document.getElementById('name-error');
       function validateName(){
  

  var name = document.getElementById('contact-name').value;
  if (name.length == 0) {

      nameError.innerHTML = 'name is required';
      return false;
      
  }

  if (!name.match(/^[A-Za-z]*\s{1}[A-Za-z]*$/)) {

      nameError.innerHTML = 'write full name';
      return false;
      
  }
   nameError.innerHTML = 'valid';
   return true;
 }




    document.addEventListener('DOMContentLoaded', function() {

        function numberValidate()
         {
            var mobileField = document.getElementById('mobile');
            var numberMsg = document.getElementById('numberMsg');

           
                if (mobileField.value.length == 10 ) {
                    numberMsg.style.display = 'none'

                } else {
                    numberMsg.style.display = 'block'
                    if (mobileField.value.length > 10) {
                    mobileField.value = this.value.slice(0, 10);
                        numberMsg.style.display = 'none'
                        
                    }
                }
            
        }

        document.getElementById('mobile').addEventListener('input',numberValidate);



        var form = document.getElementById('myForm');
        form.addEventListener('submit', function(event) {
           
           

            // Validate photo upload
           
            var photoField = document.getElementById('photo');
            var photoInvalid = document.getElementById('photoInvalid');
            var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
            if (!allowedExtensions.exec(photoField.value)) {
                photoInvalid.style.display ='block';
            }else
            {
                photoInvalid.style.display ='none';
            }

          
        });
    });


 

    
    var today = new Date();

    var yyyy = today.getFullYear();
    var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
    var dd = String(today.getDate()).padStart(2, '0');

    document.getElementById('inputDoj').value = yyyy + '-' + mm + '-' + dd;


    document.getElementById('inputDob').min = new Date().toISOString().split('T')[0];



    function validateFor() {
        var password = document.getElementById('inputPassword4').value;
        var wrongpass = document.getElementById('wrongpass');
    
    
        if (password.length < 8) {
      
          wrongpass.style.display = 'block';
          
        }else{
            wrongpass.style.display = 'none';
        }
        
        return true;
    }
</script>
</body>
</html>

<%@include file="/WEB-INF/view/footer.jsp" %>

