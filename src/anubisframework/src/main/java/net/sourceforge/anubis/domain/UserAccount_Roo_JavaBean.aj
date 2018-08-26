package net.sourceforge.anubis.domain;

import java.lang.Boolean;
import java.lang.String;

privileged aspect UserAccount_Roo_JavaBean {
    
    public String UserAccount.getLogin() {
        return this.login;
    }
    
    public void UserAccount.setLogin(String login) {
        this.login = login;
    }
    
    public String UserAccount.getPassword() {
        return this.password;
    }
    
    public void UserAccount.setPassword(String password) {
        this.password = password;
    }
    
    public Boolean UserAccount.getEnabled() {
        return this.enabled;
    }
    
    public void UserAccount.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
    public String UserAccount.getEmail() {
        return this.email;
    }
    
    public void UserAccount.setEmail(String email) {
        this.email = email;
    }
    
}
