<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management</title>
    <link rel="shortcut icon" href="https://www.nitssoftwares.com/assets/img/Nits-Fevicon.png" type="image/x-icon">
    
    <style>
        .navbar-light .navbar-nav .nav-link {
  color: #000;
}
.nav-item{
    width: 15%;
    text-align: center;
}

    </style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top bg-light navbar-light mb-4">
    <div class="container-lg">
      <a class="navbar-brand" href="/loginprocess"
        ><img
          id="MDB-logo"
          src="https://www.nitssoftwares.com/assets/img/logo-headers-Black.png"
          alt="Logo"
          draggable="false"
          height="30"
      /></a>
      <button
        class="navbar-toggler"
        type="button"
        data-mdb-toggle="collapse"
        data-mdb-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent" style="    justify-content: space-around;">
        <ul class="navbar-nav " style="justify-content: end;width: 100%;flex-direction: row;">
          <li class="nav-item">
            <a class="nav-link" href="/homePage"><i class="fa-solid fa-house-chimney pe-2"></i>Home</a>
          </li>
        
          </li>
          <% 

          String role=(String)session.getAttribute("role");

         if(role.equalsIgnoreCase("Admin"))
         { %>
           <li class="nav-item">
             <a class="nav-link " href="/addEmployee"><i class="fa-solid fa-user-plus pe-2"></i>Add Employee</a>
           </li>

           <%

         }
         
         
         %> 
          </li>
            <a class="nav-link" href="/employeeList"><i class="fa-solid fa-users pe-2"></i>Employee List</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/getemployeeid/<%=session.getAttribute("id") %>"><i class="fa-solid fa-id-card-clip pe-2"></i> Profile-(<%= session.getAttribute("name") %>)</a>
          </li>
          <li class="nav-item ">
            <a class="btn btn-black btn-rounded mx-2" href="#!">Log out</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- Navbar -->

