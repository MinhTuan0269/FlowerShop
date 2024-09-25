<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Verify Email</title>
        <link rel="icon" href="img/flora-favicon.png"/>
        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
        <link href='' rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            body {
                background-position: center;
                background-color: #eee;
                background-repeat: no-repeat;
                background-size: cover;
                color: #505050;
                font-family: "Rubik", Helvetica, Arial, sans-serif;
                font-size: 14px;
                font-weight: normal;
                line-height: 1.5;
                text-transform: none
            }

            .forgot {
                background-color: #fff;
                padding: 12px;
                border: 1px solid #dfdfdf
            }

            .padding-bottom-3x {
                padding-bottom: 72px !important
            }

            .card-footer {
                background-color: #fff
            }

            .btn {
                font-size: 13px
            }

            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #76b7e9;
                outline: 0;
                box-shadow: 0 0 0 0px #28a745
            }
        </style>
    </head>
    <body oncontextmenu='return false' class='snippet-body'>
        <div class="container padding-bottom-3x mb-2 mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="forgot">
                        <h2>Forgot your password?</h2>
                        <p>Change your password in three easy steps. This will help you
                            to secure your password!</p>
                        <ol class="list-unstyled">
                            <li><span class="text-primary text-medium">1. </span>Enter
                                your username below.</li>
                            <li><span class="text-primary text-medium">2. </span>If
                                your username matches an existing account 
                                we will send a password reset email within a few minutes.</li>
                            <li><span class="text-primary text-medium">3. </span>Enter the verified code on the 
                                next page</li>
                        </ol>
                    </div>
                    <form class="card mt-4" action="forgotPasswordAction" method="POST">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="email-for-pass">Enter your username</label> <input
                                    class="form-control" type="text" name="txtUsername" id="email-for-pass" required><small
                                    class="form-text text-muted">Enter the your username. Then we will
                                    send a verified code to registered email.</small>
                            </div>
                            <div style="color: red">
                                <c:set var="error" value="${requestScope.FORGOT_ERROR}"/>
                                <c:if test="${not empty error.usernameIsNotExisted}">
                                    ${error.usernameIsNotExisted}
                                </c:if>
                            </div>

                        </div>
                        <div class="card-footer">
                            <button class="btn btn-success" type="submit" name="btAction">Get New
                                Password</button>
                            <a href="loginPage">
                                <button class="btn btn-danger" type="button">Back to
                                    Login</button>
                            </a>

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript' src=''></script>
        <script type='text/javascript' src=''></script>
        <script type='text/Javascript'></script>
    </body>
</html>