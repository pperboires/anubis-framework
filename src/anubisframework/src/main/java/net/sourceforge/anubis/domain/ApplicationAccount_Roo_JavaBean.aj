package net.sourceforge.anubis.domain;

import java.lang.Boolean;
import java.lang.String;

privileged aspect ApplicationAccount_Roo_JavaBean {
    
    public String ApplicationAccount.getPassword() {
        return this.password;
    }
    
    public void ApplicationAccount.setPassword(String password) {
        this.password = password;
    }
    
    public Boolean ApplicationAccount.getEnabled() {
        return this.enabled;
    }
    
    public void ApplicationAccount.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
}
