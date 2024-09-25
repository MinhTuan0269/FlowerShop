/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package florastore.account;

/**
 *
 * @author ADMIN
 */
public class AccountResetPasswordError {
    private String usernameIsNotExisted;
    private String newPasswordErr;
    private String confirmPasswordNotMatch;

    /**
     * @return the emailIsNotExisted
     */
    public String getUsernameIsNotExisted() {
        return usernameIsNotExisted;
    }

    /**
     * @param emailIsNotExisted the emailIsNotExisted to set
     */
    public void setUsernameIsNotExisted(String emailIsNotExisted) {
        this.usernameIsNotExisted = emailIsNotExisted;
    }

    /**
     * @return the newPasswordErr
     */
    public String getNewPasswordErr() {
        return newPasswordErr;
    }

    /**
     * @param newPasswordErr the newPasswordErr to set
     */
    public void setNewPasswordErr(String newPasswordErr) {
        this.newPasswordErr = newPasswordErr;
    }

    /**
     * @return the confirmPasswordNotMatch
     */
    public String getConfirmPasswordNotMatch() {
        return confirmPasswordNotMatch;
    }

    /**
     * @param confirmPasswordNotMatch the confirmPasswordNotMatch to set
     */
    public void setConfirmPasswordNotMatch(String confirmPasswordNotMatch) {
        this.confirmPasswordNotMatch = confirmPasswordNotMatch;
    }
    
}
