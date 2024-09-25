/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package florastore.servlet;

import florastore.account.AccountDAO;
import florastore.account.AccountUpdateError;
import florastore.utils.MyAppConstants;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

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

        //1. Get user information
        String username = request.getParameter("txtUsername");
        String gender = request.getParameter("txtGender");
        String phone = request.getParameter("txtPhone");
        String street = request.getParameter("txtStreet");
        String city = request.getParameter("txtCity");

        //1.1 Regex Pattern
        String phoneRegex = "^(0[35789][0-9]{8})?$"; //phone
        String streetRegex = "^(?!.*  )[a-zA-Z,/\\d ]*$"; //street
        //1.2 Regex Process
        //1.2.1 Phone
        Pattern phonePattern = Pattern.compile(phoneRegex);
        Matcher phoneMatcher = phonePattern.matcher(phone);
        //1.2.2 Street
        Pattern streetPattern = Pattern.compile(streetRegex);
        Matcher streetMatcher = streetPattern.matcher(street.trim());

        ServletContext context = request.getServletContext();
        Properties siteMap = (Properties) context.getAttribute("SITE_MAP");
        String url = (String) siteMap.get(MyAppConstants.UpdateFeatures.FAIL_PAGE);

        AccountUpdateError errors = new AccountUpdateError();
        boolean foundErr = false;
        try {
            //2. check all user errors
            //2.1 check phone
            if (!phoneMatcher.matches()) {
                foundErr = true;
                errors.setPhoneError("Phone format: 0+9/8/7/5/3XXXXXXXX");
            }
            //2.2 check street
            if (!streetMatcher.matches()) {
                foundErr = true;
                errors.setStreetError("Street must not have any special word");
            }
            if(foundErr){//errors occur
                request.setAttribute("UPDATE_ERRORS", errors);
            }//errors occur
            else {//no error
                //3. Call method of DAO/Model
                AccountDAO dao = new AccountDAO();
                boolean result = dao.updateAccount(username, gender , phone, street, city);
                //4. process result
                if (result) {
                    url = (String) siteMap.get(MyAppConstants.UpdateFeatures.SUCCESS_PAGE);
                }//creating account is successfully
            }//no error
        } catch(SQLException ex){
            log("UpdateServlet _SQL_ " + ex.getMessage());
        } catch(NamingException ex){
            log("UpdateServlet _Naming_ " + ex.getMessage());
        }finally {
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
