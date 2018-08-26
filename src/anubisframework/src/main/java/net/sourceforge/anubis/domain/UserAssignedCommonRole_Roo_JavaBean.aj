package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CommonRole;
import net.sourceforge.anubis.domain.Permission;
import net.sourceforge.anubis.domain.User;
import net.sourceforge.anubis.domain.Validity;

privileged aspect UserAssignedCommonRole_Roo_JavaBean {
    
    public User UserAssignedCommonRole.getUser() {
        return this.user;
    }
    
    public void UserAssignedCommonRole.setUser(User user) {
        this.user = user;
    }
    
    public CommonRole UserAssignedCommonRole.getCommonRole() {
        return this.commonRole;
    }
    
    public void UserAssignedCommonRole.setCommonRole(CommonRole commonRole) {
        this.commonRole = commonRole;
    }
    
    public Validity UserAssignedCommonRole.getValidate() {
        return this.validate;
    }
    
    public void UserAssignedCommonRole.setValidate(Validity validate) {
        this.validate = validate;
    }
    
    public Permission UserAssignedCommonRole.getPermission() {
        return this.permission;
    }
    
    public void UserAssignedCommonRole.setPermission(Permission permission) {
        this.permission = permission;
    }
    
}
