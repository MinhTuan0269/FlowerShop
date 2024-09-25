<%-- 
    Document   : LoginJSP
    Created on : Sep 14, 2024, 12:50:27 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <style>
        .fa-eye {
  cursor: pointer;
}
        #notification {
            position: absolute; /* Định vị cố định */
            top: 38%;
            left: 50%;
            transform: translate(-50%, -50%); /* Di chuyển về giữa */
            background-color: #ffffff;
            padding: 8px;
            padding-top: 18px;
            border-radius: 5px;
            color: red;

        }
    </style>
    
    <script>
        function togglePassword() {
  var password = document.getElementById("myPassword");
  var eyeIcon = document.querySelector('.fa fa-eye');

  if (password.type === "password") {
    password.type = "text";
    eyeIcon.classList.remove("fa fa-eye");
    eyeIcon.classList.add("fa fa-eye-slash");
  } else {
    password.type = "password";
    eyeIcon.classList.remove("fa fa-eye-slash");
    eyeIcon.classList.add("fa fa-eye");
  }
}
    </script>    
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="CodeHim">
        <title>Sign In | Buy and sell on the website</title>
        <!-- Style CSS -->
        <link rel="stylesheet" href="./css/style.css">
        <!-- Demo CSS (No need to include it into your project) -->
        <link rel="stylesheet" href="./css/demo.css">
        <!--        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>-->
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="icon" href="img/flora-favicon.png"/>
    </head>
    <body>
        <header class="cd__intro">
            <a href="homePage">
                <img src="img/floralogo.png" alt="Home Page" width="360px">
            </a> 
        </header>

        <main class="cd__main">
            <section class="py-3 py-md-5 py-xl-8">
                <div class="container">
                    <div class="row content">
                        <div class="col-12">
                            <div class="mb-5">
                                <h2 class="display-5 fw-bold text-center">Sign in</h2>
                            </div>
                        </div>                        
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="mb-5 text-center">

                                <c:set var="error" value="${requestScope.LOGIN_ERROR}"/>
                                <c:if test="${not empty error.loginErr}">   
                                    <div id="notification" style="background-color: rgb(245, 229, 229)">
                                        <p>
                                            ${error.loginErr}
                                        </p>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-12 col-lg-10 col-xl-8">
                            <div class="row gy-5 justify-content-center">
                                <div class="col-12 col-lg-5">
                                    <form action="loginAction" method="POST">
                                        <div class="row gy-3 overflow-hidden">
                                            <div class="col-12">
                                                <div class="form-floating mb-3">
                                                    <input type="text" name="txtUsername" value="" class="form-control" id="username" placeholder="Username" required />
                                                    <label for="username" class="form-label">Username</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-floating mb-3">
                                                    <div class="form-group">
                                                        <label for="password">Password</label>
                                                        
                                                        <input type="password" id="myPassword" name="txtPassword" value="" class="form-control">
                                                        <i class="fa fa-eye" onclick="togglePassword()"></i>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="row justify-content-between">
                                                    <div class="col-6">
                                                        <div class="form-check">
                                                            <input type="checkbox" name="checkbox" class="form-check-input" id="checkbox">
                                                            <label class="form-check-label" for="checkbox">Remember Me</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="text-end">
                                                            <a href="forgotPassword" class="link-secondary text-decoration-none">Forgot password?</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="d-grid">          
                                                    <input type="submit" class="btn btn-class" value="Login" name="btAction" />
                                                    <br/>
                                                    <a class="btn btn-class" href="registerPage">Or Sign Up</a>                                           
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="col-12 col-lg-2 d-flex align-items-center justify-content-center gap-3 flex-lg-column">
                                    <div class="bg-dark h-100 d-none d-lg-block" style="width: 1px; background-color: rgba(0, 0, 0, 0.1);"></div>
                                    <div class="bg-dark w-100 d-lg-none" style="height: 1px; background-color: rgba(0, 0, 0, 0.1);"></div>
                                    <div>or</div>
                                    <div class="bg-dark h-100 d-none d-lg-block" style="width: 1px; background-color: rgba(0, 0, 0, 0.1);"></div>
                                    <div class="bg-dark w-100 d-lg-none" style="height: 1px; background-color: rgba(0, 0, 0, 0.1);"></div>
                                </div>
                                <div class="col-12 col-lg-5 d-flex align-items-center">
                                    <div class="d-flex gap-3 flex-column w-100 ">
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8084/FloraRewind/loginAction&response_type=code&client_id=979532933754-dkafh4bakdj768m3nldv4fqt97e8acob.apps.googleusercontent.com&approval_prompt=force" class="btn btn-lg btn-danger">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                            <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                            </svg>
                                            <span class="ms-2 fs-6">Sign in with Google</span>
                                        </a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                 
                </div>
            </section>
            <!-- END EDMO HTML (Happy Coding!)-->
        </main>

        <!-- Script JS -->
        <script src="./js/script.js"></script>
        <!--$%analytics%$-->
    </body>
</html>