package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ManualGroup;
import net.sourceforge.anubis.domain.User;

privileged aspect UserManualGroupMembership_Roo_JavaBean {
    
    public ManualGroup UserManualGroupMembership.getManualGroup() {
        return this.manualGroup;
    }
    
    public void UserManualGroupMembership.setManualGroup(ManualGroup manualGroup) {
        this.manualGroup = manualGroup;
    }
    
    public User UserManualGroupMembership.getUser() {
        return this.user;
    }
    
    public void UserManualGroupMembership.setUser(User user) {
        this.user = user;
    }
    
}
