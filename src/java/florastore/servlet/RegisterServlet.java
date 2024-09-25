/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package florastore.servlet;

import florastore.account.AccountDAO;
import florastore.account.AccountDTO;
import florastore.account.AccountRegisterError;
import florastore.utils.MyAppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //1. get all user's information
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirm");
        String fullname = request.getParameter("txtFullname");
        String email = request.getParameter("txtEmail");
        String gender = request.getParameter("txtGender");
        String phone = request.getParameter("txtPhone");
        String street = request.getParameter("txtStreet");
        String city = request.getParameter("txtCity");
        //1.1 Regex Pattern
        String emailRegex = "^(?!.*\\s)[A-Za-z0-9_+-]+(\\.[A-Za-z0-9_+-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$"; //email
        String passwordRegex = "^(?=.*\\d)(?=.*[A-Z])(?=.*[\\W_])(?!.*\\s)^\\S.*\\S$"; //password
        String fullnameRegex = "^[a-zA-Z\\s]+$"; //full name
        String usernameRegex = "^[a-zA-Z][a-zA-Z0-9._-]+$"; //username
        String phoneRegex = "^(0[35789][0-9]{8})?$"; //phone
        String streetRegex = "^(?!.*  )[a-zA-Z,/\\d ]*$"; //street
        //1.2 Regex Process
        //1.2.1 Email
        Pattern emailPattern = Pattern.compile(emailRegex);
        Matcher emailMatcher = emailPattern.matcher(email.toLowerCase());
        //1.2.2 Password
        Pattern passwordPattern = Pattern.compile(passwordRegex);
        Matcher passwordMatcher = passwordPattern.matcher(password);
        //1.2.3 Full name
        Pattern fullnamePattern = Pattern.compile(fullnameRegex);
        Matcher fullnameMatcher = fullnamePattern.matcher(fullname.trim());
        //1.2.4 Username
        Pattern usernamePattern = Pattern.compile(usernameRegex);
        Matcher usernameMatcher = usernamePattern.matcher(username);
        //1.2.5 Phone
        Pattern phonePattern = Pattern.compile(phoneRegex);
        Matcher phoneMatcher = phonePattern.matcher(phone);
        //1.2.6 Street
        Pattern streetPattern = Pattern.compile(streetRegex);
        Matcher streetMatcher = streetPattern.matcher(street.trim());

        ServletContext context = request.getServletContext();
        Properties siteMap = (Properties) context.getAttribute("SITE_MAP");
        String url = (String) siteMap.get(MyAppConstants.RegisterFeatures.ERROR_PAGE);

        AccountRegisterError errors = new AccountRegisterError();
        boolean foundErr = false;
        try {
            //6 user errors and 2 system error --> ErrorObj
            //2. check all user errors
            //2.1 check username
            if (username.length() < 5 || username.length() > 30 || !usernameMatcher.matches()) {
                foundErr = true;
                errors.setUsernameError("Username is required from 5 - 30 characters, start with a letter, allows (.,_,-) and must not have any spaces ");
            }
            //2.2 check password and confirm password
            if ((password.length() < 6 || password.length() > 20) || !passwordMatcher.matches()) {
                foundErr = true;
                errors.setPasswordError("Password is required from 6 - 20 characters and must have at least one special word, one uppercase word, and one number. No spacing!");
            } else if (!confirm.trim().equals(password.trim())) {
                foundErr = true;
                errors.setConfirmNotMatchError("Confirm password must match password");
            }
            //2.3 check fullname
            if ((fullname.trim().length() < 2 || fullname.trim().length() > 30) || !fullnameMatcher.matches()) {
                foundErr = true;
                errors.setFullnameError("Full name length requires 2 - 30 characters and must not have any special words and numbers");
            }
            //2.4 check email
            if (!emailMatcher.matches()) {
                foundErr = true;
                errors.setEmailError("Email format: example@gmail.com");
            }
            //2.5 check phone
            if (!phoneMatcher.matches()) {
                foundErr = true;
                errors.setPhoneError("Phone format: 0+9/8/7/5/3XXXXXXXX");
            }
            //2.6 check street
            if (!streetMatcher.matches()) {
                foundErr = true;
                errors.setStreetError("Street must not have any special word");
            }
            if (foundErr) {//errors occur
                request.setAttribute("CREATE_ERRORS", errors);
            } else {//no error
                //3. call method of DAO/Model
                AccountDAO dao = new AccountDAO();
                AccountDTO dto = new AccountDTO(username, password, fullname, "Customer", email, gender, phone, street, city, null);
                boolean result = dao.createAccount(dto);
                //4. process result
                if (result) {
                    url = (String) siteMap.get(MyAppConstants.RegisterFeatures.LOGIN_PAGE);
                }//creating account is successfully
            }//no error
        } catch (NamingException ex) {
            log("RegisterServlet _ Naming: " + ex.getMessage());
        } catch (SQLException ex) {//3. check system error
            String msg = ex.getMessage();
            log("RegisterServlet _ SQL: " + msg);
            //3.1 check user da ton tai
            if (msg.contains("PRIMARY KEY")) {
                errors.setUsernameIsExisted(username + " is existed");
                request.setAttribute("CREATE_ERRORS", errors);
            }
            //3.2 check email da ton tai
            if (msg.contains("UNIQUE KEY")) {
                errors.setEmailIsExisted(email + " is existed");
                request.setAttribute("CREATE_ERRORS", errors);
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
