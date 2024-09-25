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
<title>Sign Up | Buy and sell on the website</title>
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
                                        <a href="homePage">
                                            <img src="img/floralogo.png" alt="Flora Logo" width="200">
                                        </a>
                                    </div>
                                    <h2 class="h4 text-center">Registration</h2>
                                    <h3 class="fs-6 fw-normal text-secondary text-center m-0">Enter your details to register</h3>
                                </div>
                            </div>
                        </div>
                        <form action="registerAction" method="POST">
                            <c:set var="errors" value="${requestScope.CREATE_ERRORS}"/>
                            <div class="row gy-3 overflow-hidden">
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="txtFullname" value="${param.txtFullname}" id="fullName" placeholder="Full Name">
                                        <label for="fullName" class="form-label">Full Name</label>
                                        <div style="color: red">
                                            <c:if test="${not empty errors.fullnameError}">
                                                ${errors.fullnameError}
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="txtUsername" value="${param.txtUsername}" id="username" placeholder="Username">
                                        <label for="username" class="form-label">Username</label>
                                        <div style="color: red">
                                            <c:if test="${not empty errors.usernameError}">
                                                ${errors.usernameError}
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control" name="txtEmail" value="${param.txtEmail}" id="email" placeholder="name@example.com">
                                        <label for="email" class="form-label">Email</label>
                                        <div style="color: red">
                                            <c:if test="${not empty errors.emailError}">
                                                ${errors.emailError}
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control" name="txtPassword" id="password" value="" placeholder="Password">
                                        <label for="password" class="form-label">Password</label>
                                        <div style="color: red">
                                            <c:if test="${not empty errors.passwordError}">
                                                ${errors.passwordError}
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control" name="txtConfirm" id="password" value="" placeholder="Confirm Password">
                                        <label for="password" class="form-label">Confirm Password</label>
                                        <div style="color: red">
                                            <c:if test="${not empty errors.confirmNotMatchError}">
                                                ${errors.confirmNotMatchError}
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="txtPhone" id="phone" value="${param.txtPhone}" placeholder="Phone">
                                        <label for="phone" class="form-label">Phone</label>
                                        <div style="color: red">
                                            <c:if test="${not empty errors.phoneError}">
                                                ${errors.phoneError}
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="txtStreet" id="street" value="${param.txtStreet}" placeholder="">
                                        <label for="street" class="form-label">Street</label>
                                        <div style="color: red">
                                            <c:if test="${not empty errors.streetError}">
                                                ${errors.streetError}
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <select class="form-control" name="txtCity" id="city">
                                            <option value="unknown" selected>Select city</option>
                                            <option value="An Giang">An Giang</option>
                                            <option value="Ba Ria Vung Tau">Ba Ria - Vung Tau</option>
                                            <option value="Bac Giang">Bac Giang</option>
                                            <option value="Bac Kan">Bac Kan</option>
                                            <option value="Bac Lieu">Bac Lieu</option>
                                            <option value="Bac Ninh">Bac Ninh</option>
                                            <option value="Ben Tre">Ben Tre</option>
                                            <option value="Binh Dinh">Binh Dinh</option>
                                            <option value="Binh Duong">Binh Duong</option>
                                            <option value="Binh Phuoc">Binh Phuoc</option>
                                            <option value="Binh Thuan">Binh Thuan</option>
                                            <option value="Ca Mau">Ca Mau</option>
                                            <option value="Can Tho">Can Tho</option>
                                            <option value="Cao Bang">Cao Bang</option>
                                            <option value="Da Nang">Da Nang</option>
                                            <option value="Dak Lak">Dak Lak</option>
                                            <option value="Dak Nong">Dak Nong</option>
                                            <option value="Dien Bien">Dien Bien</option>
                                            <option value="Dong Nai">Dong Nai</option>
                                            <option value="Dong Thap">Dong Thap</option>
                                            <option value="Gia Lai">Gia Lai</option>
                                            <option value="Ha Giang">Ha Giang</option>
                                            <option value="Ha Nam">Ha Nam</option>
                                            <option value="Ha Noi">Ha Noi</option>
                                            <option value="Ha Tinh">Ha Tinh</option>
                                            <option value="Hai Duong">Hai Duong</option>
                                            <option value="Hai Phong">Hai Phong</option>
                                            <option value="Hau Giang">Hau Giang</option>
                                            <option value="Ho Chi Minh">Ho Chi Minh</option>
                                            <option value="Hoa Binh">Hoa Binh</option>
                                            <option value="Hung Yen">Hung Yen</option>
                                            <option value="Khanh Hoa">Khanh Hoa</option>
                                            <option value="Kien Giang">Kien Giang</option>
                                            <option value="Kon Tum">Kon Tum</option>
                                            <option value="Lai Chau">Lai Chau</option>
                                            <option value="Lam Dong">Lam Dong</option>
                                            <option value="Lang Son">Lang Son</option>
                                            <option value="Lao Cai">Lao Cai</option>
                                            <option value="Long An">Long An</option>
                                            <option value="Nam Dinh">Nam Dinh</option>
                                            <option value="Nghe An">Nghe An</option>
                                            <option value="Ninh Binh">Ninh Binh</option>
                                            <option value="Ninh Thuan">Ninh Thuan</option>
                                            <option value="Phu Tho">Phu Tho</option>
                                            <option value="Phu Yen">Phu Yen</option>
                                            <option value="Quang Binh">Quang Binh</option>
                                            <option value="Quang Nam">Quang Nam</option>
                                            <option value="Quang Ngai">Quang Ngai</option>
                                            <option value="Quang Ninh">Quang Ninh</option>
                                            <option value="Quang Tri">Quang Tri</option>
                                            <option value="Soc Trang">Soc Trang</option>
                                            <option value="Son La">Son La</option>
                                            <option value="Tay Ninh">Tay Ninh</option>
                                            <option value="Thai Binh">Thai Binh</option>
                                            <option value="Thai Nguyen">Thai Nguyen</option>
                                            <option value="Thanh Hoa">Thanh Hoa</option>
                                            <option value="Thua Thien Hue">Thua Thien - Hue</option>
                                            <option value="Tien Giang">Tien Giang</option>
                                            <option value="Tra Vinh">Tra Vinh</option>
                                            <option value="Tuyen Quang">Tuyen Quang</option>
                                            <option value="Vinh Long">Vinh Long</option>
                                            <option value="Vinh Phuc">Vinh Phuc</option>
                                            <option value="Yen Bai">Yen Bai</option>
                                        </select>
                                        <label for="city" class="form-label">City</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <label class="form-label text-secondary">Gender:</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" value="Male" name="txtGender" id="male" required checked>
                                        <label class="form-check-label text-secondary" for="male">
                                            Male
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" value="Female" name="txtGender" id="female" required>
                                        <label class="form-check-label text-secondary" for="female">
                                            Female
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" value="Hidden" name="txtGender" id="hidden" required>
                                        <label class="form-check-label text-secondary" for="hidden">
                                            Hidden
                                        </label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" name="iAgree" id="iAgree" required>
                                        <label class="form-check-label text-secondary" for="iAgree">
                                            I agree to the <a href="#!" class="link-primary text-decoration-none">terms and conditions</a>
                                        </label>
                                    </div>
                                </div>              
                                <div class="col-12">
                                    <div class="d-grid">
                                        <input type="submit" value="Sign up" class="btn bsb-btn-xl btn-primary" name="btAction" />
                                    </div>
                                </div>
                                <div style="color: red">
                                    <c:if test="${not empty errors.emailIsExisted}">
                                        ${errors.emailIsExisted}
                                    </c:if>
                                </div>
                                <div style="color: red">
                                    <c:if test="${not empty errors.usernameIsExisted}">

                                        ${errors.usernameIsExisted}
                                    </c:if>
                                </div>
                            </div>
                        </form>
                        <div class="row">
                            <div class="col-12">
                                <hr class="mt-5 mb-4 border-secondary-subtle">
                                <p class="m-0 text-secondary text-center">Already have an account? <a href="loginPage" class="link-primary text-decoration-none">Sign in</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
