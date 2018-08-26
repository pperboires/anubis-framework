package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.Inactivation;
import net.sourceforge.anubis.domain.User;

privileged aspect UserInactivation_Roo_JavaBean {
    
    public User UserInactivation.getUser() {
        return this.user;
    }
    
    public void UserInactivation.setUser(User user) {
        this.user = user;
    }
    
    public Inactivation UserInactivation.getInactivation() {
        return this.inactivation;
    }
    
    public void UserInactivation.setInactivation(Inactivation inactivation) {
        this.inactivation = inactivation;
    }
    
}
