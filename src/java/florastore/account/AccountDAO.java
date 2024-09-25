/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package florastore.account;

import florastore.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author ADMIN
 */
public class AccountDAO implements Serializable {

    public AccountDTO getAccountByLogin(String username, String password)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO dto = null;
        try {
            //1. connect database
            con = DBHelper.getConnection();
            if (con != null) {
                //2.Create SQL String
                String sql = "SELECT Fullname, Role, Email, Gender, Phone, Street, City, SaleId "
                        + "FROM Account "
                        + "WHERE Username = ? "
                        + "AND Password = ?";
                //3.Create statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4.Query Data 
                rs = stm.executeQuery();
                //5.Process Data
                if (rs.next()) {
                    String fullName = rs.getString("FullName");
                    String role = rs.getString("Role");
                    String email = rs.getString("Email");
                    String gender = rs.getString("Gender");
                    String phone = rs.getString("Phone");
                    String street = rs.getString("Street");
                    String city = rs.getString("City");
                    String saleId = rs.getString("SaleId");
                    dto = new AccountDTO(username, password, fullName, role, email, gender, phone, street, city, saleId);
                }//username and password are verified
            }//connection has been available
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return dto;
    }

    public boolean createAccount(AccountDTO dto)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            //1. connect DB
            con = DBHelper.getConnection();
            if (con != null) {
                //2. Create SQL String 
                String sql = "Insert Into Account("
                        + "Username, Password, Fullname, Role, Email, Gender, Phone, Street, City"
                        + ") Values("
                        + "?, ?, ?, ?, ?, ?, ?, ?, ?"
                        + ")";
                //3. Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getUsername());
                stm.setString(2, dto.getPassword());
                stm.setString(3, dto.getFullName());
                stm.setString(4, dto.getRole());
                stm.setString(5, dto.getEmail());
                stm.setString(6, dto.getGender());
                stm.setString(7, dto.getPhone());
                stm.setString(8, dto.getStreet());
                stm.setString(9, dto.getCity());
                //4. Execute Query
                int affectedRows = stm.executeUpdate();
                //5. process result
                if (affectedRows > 0) {
                    result = true;
                }
            }//connection has been available
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public AccountDTO getAccountByGoogleAccount(String email) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO user = null;

        try {
            // Establish connection
            conn = DBHelper.getConnection();
            if (conn != null) {
                // Prepare SQL statement for querying the Account table by email
                String sql = "SELECT Email, Username, Fullname, Role, Gender, Phone, Street, City, SaleId "
                        + "FROM Account "
                        + "WHERE Email = ?";

                // Prepare statement with email
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);

                // Execute the query
                rs = stm.executeQuery();

                // If the user exists, initialize the UserProfileDTO
                if (rs.next()) {
                    String username = rs.getString("Username");
                    String fullname = rs.getString("Fullname");
                    String role = rs.getString("Role");
                    String gender = rs.getString("Gender");
                    String phone = rs.getString("Phone");
                    String street = rs.getString("Street");
                    String city = rs.getString("City");
                    String saleId = rs.getString("SaleId");
                    user = new AccountDTO(username, "", fullname, role, email, gender, phone, street, city, saleId);
                }
            }
        } finally {
            // Close connections
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return user;
    }

    public AccountDTO checkExistedUsername(String username)
            throws SQLException, NamingException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String validEmail = null;
        AccountDTO dto = null;

        try {
            //1. connect DB
            con = DBHelper.getConnection();
            if (con != null) {
                //2. Create SQL String 
                String sql = "SELECT Email "
                        + "FROM Account "
                        + "WHERE Username = ?";

                //3.Create statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                //4. Execute Query
                rs = stm.executeQuery();
                //5. process result
                if (rs.next()) {
                    validEmail = rs.getString("Email");
                    dto = new AccountDTO(username, "", "", "", validEmail, "", "", "", "", "");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return dto;
    }

    public boolean resetPassword(String password, String email)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "UPDATE Account "
                        + "SET Password = ? "
                        + "WHERE Email = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, email);

                //4. Execute querry
                int affectedRows = stm.executeUpdate();

                //5. process result
                if (affectedRows > 0) {
                    result = true; //nếu số dóng ảnh hưởng > 0 thì update được
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return result;
    }

    public AccountDTO getUserInfo(String username)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO dto = null;
        try {
            //1. connect database
            con = DBHelper.getConnection();
            if (con != null) {
                //2.Create SQL String
                String sql = "SELECT Fullname, Email, Gender, Phone, Street, City "
                        + "FROM Account "
                        + "WHERE Username = ? ";
                //3.Create statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                //4.Query Data 
                rs = stm.executeQuery();
                //5.Process Data
                if (rs.next()) {
                    String fullName = rs.getString("FullName");
                    String email = rs.getString("Email");
                    String gender = rs.getString("Gender");
                    String phone = rs.getString("Phone");
                    String street = rs.getString("Street");
                    String city = rs.getString("City");
                    dto = new AccountDTO(username, "", fullName, "", email, gender, phone, street, city, null);
                }//username and password are verified
            }//connection has been available
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return dto;
    }

    public boolean updateAccount(String username, String gender, String phone, String street, String city)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            //1. kết nối DB
            con = DBHelper.getConnection();
            if (con != null) { //nếu kết nối DB được
//                //lấy UserID
//                String sqlID = "SELECT UserID "
//                        + "FROM Account "
//                        + "WHERE Fullname = ?";
//                stm = con.prepareStatement(sqlID);
//                stm.setString(1, fullname);
//                rs = stm.executeQuery();
//                if (rs.next()) {
//                    UserID = rs.getString("UserID");
//                }
//                String sql = "UPDATE UserDetail "
//                        + "SET Street=?, Phone=? "
//                        + "WHERE UserID = ?";
//              2. khởi tạo lệnh SQL
                String sql = "UPDATE Account "
                        + "SET Phone = ?, Street = ?, City = ?, Gender = ? "
                        + "WHERE Username = ?";
                //3. khởi tạo statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, phone);
                stm.setString(2, street);
                stm.setString(3, city);
                stm.setString(4, gender);
                stm.setString(5, username);

                //4. Execute querry
                int affectedRows = stm.executeUpdate();

                //5. process result
                if (affectedRows > 0) {
                    result = true; //nếu số dóng ảnh hưởng > 0 thì update được
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return result;
    }
}
