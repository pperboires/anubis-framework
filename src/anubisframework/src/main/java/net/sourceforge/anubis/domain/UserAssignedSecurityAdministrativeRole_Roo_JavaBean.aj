package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.User;
import net.sourceforge.anubis.domain.Validity;

privileged aspect UserAssignedSecurityAdministrativeRole_Roo_JavaBean {
    
    public User UserAssignedSecurityAdministrativeRole.getUser() {
        return this.user;
    }
    
    public void UserAssignedSecurityAdministrativeRole.setUser(User user) {
        this.user = user;
    }
    
    public Validity UserAssignedSecurityAdministrativeRole.getValidity() {
        return this.validity;
    }
    
    public void UserAssignedSecurityAdministrativeRole.setValidity(Validity validity) {
        this.validity = validity;
    }
    
}
