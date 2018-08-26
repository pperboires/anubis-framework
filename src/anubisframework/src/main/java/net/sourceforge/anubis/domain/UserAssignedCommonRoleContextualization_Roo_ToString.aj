package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect UserAssignedCommonRoleContextualization_Roo_ToString {
    
    public String UserAssignedCommonRoleContextualization.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("UserAssignedCommonRole: ").append(getUserAssignedCommonRole()).append(", ");
        sb.append("ContextValue: ").append(getContextValue()).append(", ");
        sb.append("CommonRoleAssignedPermission: ").append(getCommonRoleAssignedPermission());
        return sb.toString();
    }
    
}
