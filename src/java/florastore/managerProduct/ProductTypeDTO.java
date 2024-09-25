/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package florastore.managerProduct;

import java.io.Serializable;

/**
 *
 * @author acer
 */
public class ProductTypeDTO implements Serializable {

   private String storeId;
    private String type;


    public ProductTypeDTO() {
    }

    public ProductTypeDTO(String storeId, String type) {
        this.storeId = storeId;
        this.type = type;
    }

    /**
     * @return the storeId
     */
    public String getStoreId() {
        return storeId;
    }

    /**
     * @param storeId the storeId to set
     */
    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    
}
