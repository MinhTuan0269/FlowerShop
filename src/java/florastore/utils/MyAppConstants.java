/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package florastore.utils;

/**
 *
 * @author ADMIN
 */
public class MyAppConstants {
    public class LoginFeatures {
        public static final String INVALID_PAGE = "loginPage";  
        public static final String HOME_PAGE = "homePage";
    }
    public class LogoutFeatures {
        public static final String LOGIN_PAGE = "loginPage";
    }
    public class RegisterFeatures {
        public static final String LOGIN_PAGE = "loginPage";
        public static final String ERROR_PAGE = "registerPage";
    }
    public class UpdateFeatures {
        public static final String FAIL_PAGE = "viewProfile";
        public static final String SUCCESS_PAGE = "viewProfileAction";
    }
    public class ForgotPasswordFeatures {
        public static final String FAIL_PAGE = "forgotPassword";
        public static final String SUCCESS_PAGE = "enterOtp";
        public static final String RESET_PAGE = "newPassword";
        public static final String WRONG_PAGE = "enterOtp";
        public static final String LOGIN_PAGE = "loginPage";
    }
    public class ViewProfileFeatures {
        public static final String FAIL_PAGE = "error404";
        public static final String SUCCESS_PAGE = "viewProfile";
    }
    public class StartUpFeatures {
        public static final String HOME_PAGE = "homePage";
        public static final String DEFAULT_PAGE = "homePage";
    }
    
        public class ShowProductManager {
         public static final String INVALID_PAGE = "homePage";
         public static final String STORE_PAGE = "managerPage";
    }
}
