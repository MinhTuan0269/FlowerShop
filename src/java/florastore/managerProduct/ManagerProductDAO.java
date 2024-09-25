/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package florastore.managerProduct;

import florastore.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author acer
 */
public class ManagerProductDAO implements Serializable {

    private ArrayList<ManagerProductDTO> listProduct;

    public ArrayList<ManagerProductDTO> getListProduct() {
        return listProduct;
    }

    private ArrayList<ProductTypeDTO> listProductType;

    public ArrayList<ProductTypeDTO> getListProductType() {
        return listProductType;
    }

    public void loadListProductFromDbById(String id, int index) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Get connection
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT ProductId, StoreId, ProductName, ProductType, ProductCondition, ProductDetail, ProductPrice, ProductQuantity, ImageURL "
                        + "FROM FlowerProducts "
                        + "WHERE StoreId = ? "
                        + "Order by ProductId "
                        + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
                //2. Create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                stm.setInt(2, (index - 1) * 5);
                //3. Excute Query
                rs = stm.executeQuery();
                while (rs.next()) {
                    int productId = rs.getInt("ProductId");
                    String storeId = rs.getString("StoreId");
                    String name = rs.getString("ProductName");
                    String type = rs.getString("ProductType");
                    String condition = rs.getString("ProductCondition");
                    String detail = rs.getString("ProductDetail");
                    double price = rs.getDouble("ProductPrice");
                    int quantity = rs.getInt("ProductQuantity");
                    String imageURL = rs.getString("ImageURL");
                    ManagerProductDTO items = new ManagerProductDTO(productId, storeId, name, type, condition, detail, price, quantity, imageURL);
                    if (this.listProduct == null) {
                        listProduct = new ArrayList<>();
                    }//end if list is empty
                    listProduct.add(items);
                } //end while loop
            } //end if connection is success

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
    }

    //Count Product in DB
    public int getTotalProduct() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {

                String sql = "Select count(*) "
                        + "From FlowerProducts";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
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

        return 0;
    }

    public boolean deleteProduct(int id)
            throws SQLException, NamingException {

        Connection con = null;
        PreparedStatement stm = null;

        boolean result = false;

        try {
            //1.connect DB
            con = DBHelper.getConnection();     //bắt lỗi ClassNotFoundException
            if (con != null) {

                //2.Create SQL String
                String sql = "DELETE FROM FlowerProducts "
                        + "WHERE ProductId=?";
                //3.Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                //4.Execute Query
                int affectedRows = stm.executeUpdate();
                //5.Process Result
                if (affectedRows > 0) {
                    result = true;
                }
                //username and password are verified

            }//connect has been avaible
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public void delProduct(int id)
            throws SQLException, NamingException {

        Connection con = null;
        PreparedStatement stm = null;

        try {
            //1.connect DB
            con = DBHelper.getConnection();     //bắt lỗi ClassNotFoundException
            if (con != null) {

                //2.Create SQL String
                String sql = "DELETE FROM FlowerProducts "
                        + "WHERE ProductId=?";
                //3.Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                //4.Execute Query
                int affectedRows = stm.executeUpdate();
                //5.Process Result
                //username and password are verified

            }//connect has been avaible
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

    }

    public void loadListProductType(String id) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Get connection
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "Select DISTINCT ProductType "
                        + "From FlowerProducts "
                        + "WHERE StoreId = ?";
                //2. Create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, id);

                //3. Excute Query
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productId = rs.getString("StoreId");

                    String type = rs.getString("ProductType");

                    ProductTypeDTO dto = new ProductTypeDTO(productId, type);
                    if (this.listProductType == null) {
                        listProductType = new ArrayList<>();
                    }//end if list is empty
                    listProductType.add(dto);
                } //end while loop
            } //end if connection is success

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
    }

}
