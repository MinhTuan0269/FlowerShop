/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package florastore.servlet;

import florastore.account.AccountDAO;
import florastore.account.AccountResetPasswordError;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/ResetPasswordServlet"})
public class ResetPasswordServlet extends HttpServlet {

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

        String newPassword = request.getParameter("txtPassword");
        String confirmPassword = request.getParameter("txtConfirmPassword");
        String email = request.getParameter("txtEmail");

        AccountResetPasswordError error = new AccountResetPasswordError();
        boolean foundErr = false;

        String passwordRegex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+\\-=?{}\\[\\];:'\",.<>]).{8,}$"; //password

        Pattern passwordPattern = Pattern.compile(passwordRegex);
        Matcher passwordMatcher = passwordPattern.matcher(newPassword);

        ServletContext context = request.getServletContext();
        Properties siteMap = (Properties) context.getAttribute("SITE_MAP");
        String url = (String) siteMap.get(MyAppConstants.ForgotPasswordFeatures.RESET_PAGE);

        try {
            if (newPassword.length() < 6 || newPassword.length() > 20 || !passwordMatcher.matches() || !newPassword.equals(newPassword.trim())) {
                foundErr = true;
                error.setNewPasswordErr("Password is required from 6 - 20 characters and must have at least one special word, one uppercase word, and one number. No spacing!");
            } else if (!confirmPassword.equals(newPassword)) {
                foundErr = true;
                error.setConfirmPasswordNotMatch("Confirm password must match password");
            }
            if (foundErr) {//errors occur
                request.setAttribute("RESET_ERRORS", error);
            }//errors occur
            else {//no error
                //3. call method of DAO/Model
                AccountDAO dao = new AccountDAO();
                boolean result = dao.resetPassword(newPassword, email);
                //4. process result
                if (result) {
                    url = (String) siteMap.get(MyAppConstants.ForgotPasswordFeatures.LOGIN_PAGE);
                }//creating account is successfully
            }//no error
        } catch (SQLException ex) {
            log("ResetPasswordServlet _ SQL _" + ex.getMessage());
        } catch (NamingException ex) {
            log("ResetPasswordServlet _ Naming _" + ex.getMessage());
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
