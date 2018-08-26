package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.ApplicationAccount;

privileged aspect Application_Roo_JavaBean {
    
    public String Application.getId() {
        return this.id;
    }
    
    public void Application.setId(String id) {
        this.id = id;
    }
    
    public String Application.getName() {
        return this.name;
    }
    
    public void Application.setName(String name) {
        this.name = name;
    }
    
    public ApplicationAccount Application.getAccount() {
        return this.account;
    }
    
    public void Application.setAccount(ApplicationAccount account) {
        this.account = account;
    }
    
}
