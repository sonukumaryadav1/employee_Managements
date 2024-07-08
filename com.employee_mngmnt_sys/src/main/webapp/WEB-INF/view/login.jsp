

<!DOCTYPE html>
<html lang="en">
<head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
      <title>HTML Login Form</title>
      <link rel="stylesheet" href="/resources/css/style.css">
      <script type="text/javascript" src="/resources/js/script.js"></script>

      
     
</head>

<body>
      <div class="main">
            <h1>Login page</h1>
            <h3>Enter your login credentials</h3>
            <form action="/loginprocess" method="post">
                  <label for="Username">
                        Username:
                  </label>
                  <input type="text" 
                         id="email" 
                         name="email" 
                         placeholder="Enter your Username" required>

                  <label for="password">
                        Password:
                  </label>
                  <input type="password"
                         id="possword" 
                         name="possword"
                         placeholder="Enter your Password" required>
                       <h3>${msg}</h3>

                  <div class="wrap">
                        <button type="submit"
                                onclick="solve()">
                              Submit
                        </button>

                  </div>
            </form>
            <p>Not registered?
                  <a href="#"
                     style="text-decoration: none;">
                        Create an account
                  </a>
            </p>
      </div>
      <script>
            let msg="${msg}"
                  if( msg){
                        
                        alert("msg")
                  }
      </script>

</body>
</html>