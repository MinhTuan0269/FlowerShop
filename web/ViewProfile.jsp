<%-- 
    Document   : viewProfile
    Created on : 16/09/2024, 12:04:19 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-7/assets/css/registration-7.css">
<link rel="icon" href="img/flora-favicon.png"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Registration 7 - Bootstrap Brain Component -->
<section class="bg-light p-3 p-md-4 p-xl-5">
    <div class="container">
        <a href="HomePageJSP.jsp">Back to main page</a>
        <div class="row justify-content-center">
            <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
                <div class="card border border-light-subtle rounded-4">
                    <div class="card-body p-3 p-md-4 p-xl-5">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-5">
                                    <div class="text-center mb-4">
                                        <a href="#!">
                                            <img src="img/floralogo.png" alt="Logo" width="360" >
                                        </a>
                                    </div>
                                    <h2 class="h4 text-center">My Profile</h2>
                                    <h3 class="fs-6 fw-normal text-secondary text-center m-0">You can update your profile here</h3>
                                    <h3 class="fs-6 fw-normal text-secondary text-center m-0">Full Name and Email cannot be edited</h3>
                                </div>
                            </div>
                        </div>
                        <form action="updateAction" method="POST" onsubmit="return confirmUpdate()">
                            <%--
                            <div class="row gy-3 overflow-hidden">

                                <div class="col-12">
                                    Full name: ${sessionScope.USER.fullName}
                                </div>

                                <div class="col-12">
                                    Email: ${sessionScope.USER.email}
                              
                                    <div class="form-floating mb-3">

                                        </div>
                              
                                </div>

                                <div class="col-12">
                               
                                    <div class="form-floating mb-3">
                                        
                                    </div>
                                
                                    Gender: 
                                    <select style="border: 0">
                                        <option>Male</option>
                                        <option>Female</option>
                                        <option>Other</option>
                                        <option>Hidden</option>
                                    </select>
                                </div>

                                <c:set var="errors" value="${requestScope.CREATE_ERROR}"/>
                                <c:if test="${sessionScope.confirmFlag == null}">
                                    <c:if test="${not empty errors.emailFormat}">
                                        <font color="red">
                                        ${errors.emailFormat}
                                        </font> <br/>
                                    </c:if> 

                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" name="txtPhone" id="phone" value="${sessionScope.PHONE}" required>
                                            <label for="phone" class="form-label">Phone</label>
                                        </div>
                                    </div>
                                    <c:if test="${not empty errors.phonelength}">
                                        <font color="red">
                                        ${errors.phonelength}
                                        </font> <br/>
                                    </c:if> 

                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" name="txtAddress" id="address" value="${sessionScope.ADDRESS}" required>
                                            <label for="address" class="form-label">Address</label>
                                        </div>
                                    </div>
                                    <c:if test="${not empty errors.addressFormat}">
                                        <font color="red">
                                        ${errors.addressFormat}
                                        </font> <br/>
                                    </c:if> 
                              
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control" name="txtPassword" id="password" value="************" placeholder="Password" required>
                                            <label for="password" class="form-label">Password</label>
                                        </div>
                                    </div>
                                    <c:if test="${not empty errors.passwordLength}">
                                        <font color="red">
                                        ${errors.passwordLength}
                                        </font> <br/>
                                    </c:if> 
                                    <c:if test="${not empty errors.passwordFormat}">
                                        <font color="red">
                                        ${errors.passwordFormat}
                                        </font> <br/>
                                    </c:if> 
                             
                                </c:if>

                                <c:if test="${sessionScope.confirmFlag != null}">
                            
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="email" class="form-control" name="txtEmail" id="email" value="${param.txtEmail}" placeholder="name@example.com" required>
                                            <label for="email" class="form-label">Email</label>
                                        </div>
                                    </div>
                                
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" name="txtPhone" id="email" value="${param.txtPhone}">
                                            <label for="phone" class="form-label">Phone</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" name="txtAddress" id="email" value="${param.txtAddress}" required>
                                            <label for="address" class="form-label">Address</label>
                                        </div>
                                    </div>
                                
                            <div class="col-12">
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control" name="txtPassword" id="password" value="${param.txtPassword}" placeholder="Password" required>
                                    <label for="password" class="form-label">Password</label>
                                </div>
                            </div>
                           
                                </c:if>
                           
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control" name="txtPassword2" id="password" value="${param.txtPassword2}" placeholder="Password" required>
                                        <label for="password" class="form-label">Confirm Password</label>
                                    </div>
                                    <c:if test="${not empty errors.confirmNotMatched}">
                                        <font color="red">
                                        ${errors.confirmNotMatched}
                                        </font> <br/>
                                    </c:if>
                                </div>
                        
                                <div class="col-12" >
                                    <div style="text-align: right">
                                        <button class="btn bsb-btn-xl btn-primary" type="submit">Save</button><br>
                                        <input type="hidden" name="txtFullname" value="${sessionScope.USER.fullName}" readonly="readonly" />
                                        <font style="color: brown">
                                        <c:if test="${sessionScope.confirmFlag != null}">
                                            ${sessionScope.confirmFlag}
                                        </c:if>
                                        <font/>
                                    </div>
                                </div>
                            </div>
                            --%>
                            <c:set var="errors" value="${requestScope.UPDATE_ERRORS}"/>
                            <input type="hidden" name="txtUsername" value="${sessionScope.USER_INFO.username}"/>
                            <div class="row gy-3 overflow-hidden">
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="txtFullname" value="${sessionScope.USER_INFO.fullName}" id="fullName" placeholder="Full Name" readonly>
                                        <label for="fullName" class="form-label">Full Name</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control" name="txtEmail" value="${sessionScope.USER_INFO.email}" id="email" placeholder="name@example.com" readonly>
                                        <label for="email" class="form-label">Email</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="txtPhone" id="phone" value="${sessionScope.USER_INFO.phone}" placeholder="" >
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
                                        <input type="text" class="form-control" name="txtStreet" id="street" value="${sessionScope.USER_INFO.street}" placeholder="" >
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
                                        <select class="form-control" name="txtCity" id="city" >
                                            <option value="unknown"  selected>Select city</option>
                                            <option value="An Giang"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'An Giang'}">
                                                        selected="selected"
                                                    </c:if>>An Giang</option>
                                            <option value="Ba Ria Vung Tau"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Ba Ria Vung Tau'}">
                                                        selected="selected"
                                                    </c:if>>Ba Ria - Vung Tau</option>
                                            <option value="Bac Giang"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Bac Giang'}">
                                                        selected="selected"
                                                    </c:if>>Bac Giang</option>
                                            <option value="Bac Kan"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Bac Kan'}">
                                                        selected="selected"
                                                    </c:if>>Bac Kan</option>
                                            <option value="Bac Lieu"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Bac Lieu'}">
                                                        selected="selected"
                                                    </c:if>>Bac Lieu</option>
                                            <option value="Bac Ninh"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Bac Ninh'}">
                                                        selected="selected"
                                                    </c:if>>Bac Ninh</option>
                                            <option value="Ben Tre"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Ben Tre'}">
                                                        selected="selected"
                                                    </c:if>>Ben Tre</option>
                                            <option value="Binh Dinh"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Binh Dinh'}">
                                                        selected="selected"
                                                    </c:if>>Binh Dinh</option>
                                            <option value="Binh Duong"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Binh Duong'}">
                                                        selected="selected"
                                                    </c:if>>Binh Duong</option>
                                            <option value="Binh Phuoc"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Binh Phuoc'}">
                                                        selected="selected"
                                                    </c:if>>Binh Phuoc</option>
                                            <option value="Binh Thuan"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Binh Thuan'}">
                                                        selected="selected"
                                                    </c:if>>Binh Thuan</option>
                                            <option value="Ca Mau"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Ca Mau'}">
                                                        selected="selected"
                                                    </c:if>>Ca Mau</option>
                                            <option value="Can Tho"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Can Tho'}">
                                                        selected="selected"
                                                    </c:if>>Can Tho</option>
                                            <option value="Cao Bang"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Cao Bang'}">
                                                        selected="selected"
                                                    </c:if>>Cao Bang</option>
                                            <option value="Da Nang"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Da Nang'}">
                                                        selected="selected"
                                                    </c:if>>Da Nang</option>
                                            <option value="Dak Lak"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Dak Lak'}">
                                                        selected="selected"
                                                    </c:if>>Dak Lak</option>
                                            <option value="Dak Nong"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Dak Nong'}">
                                                        selected="selected"
                                                    </c:if>>Dak Nong</option>
                                            <option value="Dien Bien"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Dien Bien'}">
                                                        selected="selected"
                                                    </c:if>>Dien Bien</option>
                                            <option value="Dong Nai"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Dong Nai'}">
                                                        selected="selected"
                                                    </c:if>>Dong Nai</option>
                                            <option value="Dong Thap"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Dong Thap'}">
                                                        selected="selected"
                                                    </c:if>>Dong Thap</option>
                                            <option value="Gia Lai"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Gia Lai'}">
                                                        selected="selected"
                                                    </c:if>>Gia Lai</option>
                                            <option value="Ha Giang"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Ha Giang'}">
                                                        selected="selected"
                                                    </c:if>>Ha Giang</option>
                                            <option value="Ha Nam"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Ha Nam'}">
                                                        selected="selected"
                                                    </c:if>>Ha Nam</option>
                                            <option value="Ha Noi"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Ha Noi'}">
                                                        selected="selected"
                                                    </c:if>>Ha Noi</option>
                                            <option value="Ha Tinh"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Ha Tinh'}">
                                                        selected="selected"
                                                    </c:if>>Ha Tinh</option>
                                            <option value="Hai Duong"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Hai Duong'}">
                                                        selected="selected"
                                                    </c:if>>Hai Duong</option>
                                            <option value="Hai Phong"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Hai Phong'}">
                                                        selected="selected"
                                                    </c:if>>Hai Phong</option>
                                            <option value="Hau Giang"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Hau Giang'}">
                                                        selected="selected"
                                                    </c:if>>Hau Giang</option>
                                            <option value="Ho Chi Minh"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Ho Chi Minh'}">
                                                        selected="selected"
                                                    </c:if>>Ho Chi Minh</option>
                                            <option value="Hoa Binh"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Hoa Binh'}">
                                                        selected="selected"
                                                    </c:if>>Hoa Binh</option>
                                            <option value="Hung Yen"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Hung Yen'}">
                                                        selected="selected"
                                                    </c:if>>Hung Yen</option>
                                            <option value="Khanh Hoa"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Khanh Hoa'}">
                                                        selected="selected"
                                                    </c:if>>Khanh Hoa</option>
                                            <option value="Kien Giang"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Kien Giang'}">
                                                        selected="selected"
                                                    </c:if>>Kien Giang</option>
                                            <option value="Kon Tum"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Kon Tum'}">
                                                        selected="selected"
                                                    </c:if>>Kon Tum</option>
                                            <option value="Lai Chau"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Lai Chau'}">
                                                        selected="selected"
                                                    </c:if>>Lai Chau</option>
                                            <option value="Lam Dong"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Lam Dong'}">
                                                        selected="selected"
                                                    </c:if>>Lam Dong</option>
                                            <option value="Lang Son"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Lang Son'}">
                                                        selected="selected"
                                                    </c:if>>Lang Son</option>
                                            <option value="Lao Cai"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Lao Cai'}">
                                                        selected="selected"
                                                    </c:if>>Lao Cai</option>
                                            <option value="Long An"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Long An'}">
                                                        selected="selected"
                                                    </c:if>>Long An</option>
                                            <option value="Nam Dinh"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Nam Dinh'}">
                                                        selected="selected"
                                                    </c:if>>Nam Dinh</option>
                                            <option value="Nghe An"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Nghe An'}">
                                                        selected="selected"
                                                    </c:if>>Nghe An</option>
                                            <option value="Ninh Binh"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Ninh Binh'}">
                                                        selected="selected"
                                                    </c:if>>Ninh Binh</option>
                                            <option value="Ninh Thuan"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Ninh Thuan'}">
                                                        selected="selected"
                                                    </c:if>>Ninh Thuan</option>
                                            <option value="Phu Tho"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Phu Tho'}">
                                                        selected="selected"
                                                    </c:if>>Phu Tho</option>
                                            <option value="Phu Yen"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Phu Yen'}">
                                                        selected="selected"
                                                    </c:if>>Phu Yen</option>
                                            <option value="Quang Binh"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Quang Binh'}">
                                                        selected="selected"
                                                    </c:if>>Quang Binh</option>
                                            <option value="Quang Nam"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Quang Nam'}">
                                                        selected="selected"
                                                    </c:if>>Quang Nam</option>
                                            <option value="Quang Ngai"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Quang Ngai'}">
                                                        selected="selected"
                                                    </c:if>>Quang Ngai</option>
                                            <option value="Quang Ninh"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Quang Ninh'}">
                                                        selected="selected"
                                                    </c:if>>Quang Ninh</option>
                                            <option value="Quang Tri"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Quang Tri'}">
                                                        selected="selected"
                                                    </c:if>>Quang Tri</option>
                                            <option value="Soc Trang"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Soc Trang'}">
                                                        selected="selected"
                                                    </c:if>>Soc Trang</option>
                                            <option value="Son La"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Son La'}">
                                                        selected="selected"
                                                    </c:if>>Son La</option>
                                            <option value="Tay Ninh"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Tay Ninh'}">
                                                        selected="selected"
                                                    </c:if>>Tay Ninh</option>
                                            <option value="Thai Binh"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Thai Binh'}">
                                                        selected="selected"
                                                    </c:if>>Thai Binh</option>
                                            <option value="Thai Nguyen"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Thai Nguyen'}">
                                                        selected="selected"
                                                    </c:if>>Thai Nguyen</option>
                                            <option value="Thanh Hoa"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Thanh Hoa'}">
                                                        selected="selected"
                                                    </c:if>>Thanh Hoa</option>
                                            <option value="Thu Duc"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Thu Duc'}">
                                                        selected="selected"
                                                    </c:if>>Thu Duc</option>
                                            <option value="Thua Thien Hue"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Thua Thien Hue'}">
                                                        selected="selected"
                                                    </c:if>>Thua Thien - Hue</option>
                                            <option value="Tien Giang"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Tien Giang'}">
                                                        selected="selected"
                                                    </c:if>>Tien Giang</option>
                                            <option value="Tra Vinh"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Tra Vinh'}">
                                                        selected="selected"
                                                    </c:if>>Tra Vinh</option>
                                            <option value="Tuyen Quang"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Tuyen Quang'}">
                                                        selected="selected"
                                                    </c:if>>Tuyen Quang</option>
                                            <option value="Vinh Long"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Vinh Long'}">
                                                        selected="selected"
                                                    </c:if>>Vinh Long</option>
                                            <option value="Vinh Phuc"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Vinh Phuc'}">
                                                        selected="selected"
                                                    </c:if>>Vinh Phuc</option>
                                            <option value="Yen Bai"
                                                    <c:if test="${sessionScope.USER_INFO.city == 'Yen Bai'}">
                                                        selected="selected"
                                                    </c:if>>Yen Bai</option>
                                        </select>
                                        <label for="city" class="form-label">City</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <label class="form-label text-secondary">Gender:</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" value="Male" name="txtGender" id="male" required
                                               <c:if test="${sessionScope.USER_INFO.gender == 'Male'}">
                                                   checked="checked"
                                               </c:if> />
                                        <label class="form-check-label text-secondary" for="male">
                                            Male
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" value="Female" name="txtGender" id="female" required
                                               <c:if test="${sessionScope.USER_INFO.gender == 'Female'}">
                                                   checked="checked"
                                               </c:if> />
                                        <label class="form-check-label text-secondary" for="female">
                                            Female
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" value="Hidden" name="txtGender" id="hidden" required
                                               <c:if test="${sessionScope.USER_INFO.gender == 'Hidden'}">
                                                   checked="checked"
                                               </c:if> />
                                        <label class="form-check-label text-secondary" for="hidden">
                                            Hidden
                                        </label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="d-grid">
                                        <input type="submit" value="Save" class="btn bsb-btn-xl btn-primary" name="btAction" />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    function confirmUpdate() {
        let confirmation = confirm("Are you sure you want to update your profile?");

        if (confirmation) {
// If the user clicks "Yes", submit the form
            document.getElementById("updateForm").submit();
        } else {
// If the user clicks "No", do nothing (cancel the update)
            return false;
        }
    }
</script>
