package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.AdministrativeRole;
import net.sourceforge.anubis.domain.User;
import net.sourceforge.anubis.domain.Validity;

privileged aspect UserAssignedAdministrativeRole_Roo_JavaBean {
    
    public User UserAssignedAdministrativeRole.getUser() {
        return this.user;
    }
    
    public void UserAssignedAdministrativeRole.setUser(User user) {
        this.user = user;
    }
    
    public AdministrativeRole UserAssignedAdministrativeRole.getAdministrativeRole() {
        return this.administrativeRole;
    }
    
    public void UserAssignedAdministrativeRole.setAdministrativeRole(AdministrativeRole administrativeRole) {
        this.administrativeRole = administrativeRole;
    }
    
    public Validity UserAssignedAdministrativeRole.getValidity() {
        return this.validity;
    }
    
    public void UserAssignedAdministrativeRole.setValidity(Validity validity) {
        this.validity = validity;
    }
    
}
