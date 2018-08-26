package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CommonRole;
import net.sourceforge.anubis.domain.Permission;

privileged aspect CommonRoleAssignedPermission_Roo_JavaBean {
    
    public CommonRole CommonRoleAssignedPermission.getCommonRole() {
        return this.commonRole;
    }
    
    public void CommonRoleAssignedPermission.setCommonRole(CommonRole commonRole) {
        this.commonRole = commonRole;
    }
    
    public Permission CommonRoleAssignedPermission.getPermission() {
        return this.permission;
    }
    
    public void CommonRoleAssignedPermission.setPermission(Permission permission) {
        this.permission = permission;
    }
    
}
