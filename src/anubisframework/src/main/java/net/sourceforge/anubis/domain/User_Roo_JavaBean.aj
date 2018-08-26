package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.Locale;
import net.sourceforge.anubis.domain.UserAccount;

privileged aspect User_Roo_JavaBean {
    
    public String User.getName() {
        return this.name;
    }
    
    public void User.setName(String name) {
        this.name = name;
    }
    
    public Locale User.getPreferredLocale() {
        return this.preferredLocale;
    }
    
    public void User.setPreferredLocale(Locale preferredLocale) {
        this.preferredLocale = preferredLocale;
    }
    
    public UserAccount User.getAccount() {
        return this.account;
    }
    
    public void User.setAccount(UserAccount account) {
        this.account = account;
    }
    
}
