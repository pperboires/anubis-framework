package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CommonRoleAssignedPermission;
import net.sourceforge.anubis.domain.ContextValue;
import net.sourceforge.anubis.domain.UserAssignedCommonRole;

privileged aspect UserAssignedCommonRoleContextualization_Roo_JavaBean {
    
    public UserAssignedCommonRole UserAssignedCommonRoleContextualization.getUserAssignedCommonRole() {
        return this.userAssignedCommonRole;
    }
    
    public void UserAssignedCommonRoleContextualization.setUserAssignedCommonRole(UserAssignedCommonRole userAssignedCommonRole) {
        this.userAssignedCommonRole = userAssignedCommonRole;
    }
    
    public ContextValue UserAssignedCommonRoleContextualization.getContextValue() {
        return this.contextValue;
    }
    
    public void UserAssignedCommonRoleContextualization.setContextValue(ContextValue contextValue) {
        this.contextValue = contextValue;
    }
    
    public CommonRoleAssignedPermission UserAssignedCommonRoleContextualization.getCommonRoleAssignedPermission() {
        return this.commonRoleAssignedPermission;
    }
    
    public void UserAssignedCommonRoleContextualization.setCommonRoleAssignedPermission(CommonRoleAssignedPermission commonRoleAssignedPermission) {
        this.commonRoleAssignedPermission = commonRoleAssignedPermission;
    }
    
}
