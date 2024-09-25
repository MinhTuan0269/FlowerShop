/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package florastore.account;

/**
 *
 * @author ASUS
 */
public class AccountUpdateError {

    private String phoneError;
    private String streetError;

    /**
     * @return the phoneError
     */
    public String getPhoneError() {
        return phoneError;
    }

    /**
     * @param phoneError the phoneError to set
     */
    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    /**
     * @return the streetError
     */
    public String getStreetError() {
        return streetError;
    }

    /**
     * @param streetError the streetError to set
     */
    public void setStreetError(String streetError) {
        this.streetError = streetError;
    }

}
