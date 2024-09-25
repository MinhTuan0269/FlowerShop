<%-- 
    Document   : ChangePasswordJSP
    Created on : Sep 14, 2024, 3:05:30 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-7/assets/css/registration-7.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Reset Password | Buy and sell on the website</title>
<link rel="icon" href="img/flora-favicon.png"/>

<!-- Registration 7 - Bootstrap Brain Component -->
<section class="bg-light p-3 p-md-4 p-xl-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
                <div class="card border border-light-subtle rounded-4">
                    <div class="card-body p-3 p-md-4 p-xl-5">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-5">
                                    <div class="text-center mb-4">
                                        <img src="img/floralogo.png" alt="Flora Logo" width="200">
                                    </div>
                                    <h2 class="h4 text-center">Reset Password</h2>
                                    <h3 class="fs-6 fw-normal text-secondary text-center m-0">Enter your password</h3>
                                </div>
                            </div>
                        </div>
                        <form action="resetPasswordAction" method="POST">
                            <input type="hidden" name="txtEmail" value="${sessionScope.email}" />
                            <c:set var="errors" value="${requestScope.RESET_ERRORS}"/>
                            <div class="row gy-3 overflow-hidden">
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control" name="txtPassword" value="" id="password" placeholder="Password" required>
                                        <label for="password" class="form-label">Password</label>
                                        <div style="color: red">
                                            <c:if test="${not empty errors.newPasswordErr}">
                                                ${errors.newPasswordErr}
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control" name="txtConfirmPassword" value="" id="confirmPassword" placeholder="Confirm Password" required>
                                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                                        <div style="color: red">
                                            <c:if test="${not empty errors.confirmPasswordNotMatch}">
                                                ${errors.confirmPasswordNotMatch}
                                            </c:if>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="d-grid">
                                        <input type="submit" value="Reset Password" class="btn bsb-btn-xl btn-primary" name="btAction" />
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="row">
                            <div class="col-12">
                                <hr class="mt-5 mb-4 border-secondary-subtle">
                                <p class="m-0 text-secondary text-center">Yon don't have an account? <a href="registerPage" class="link-primary text-decoration-none">Sign up</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
