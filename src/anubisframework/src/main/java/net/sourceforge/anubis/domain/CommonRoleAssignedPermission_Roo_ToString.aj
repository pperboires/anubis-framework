package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect CommonRoleAssignedPermission_Roo_ToString {
    
    public String CommonRoleAssignedPermission.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("CommonRole: ").append(getCommonRole()).append(", ");
        sb.append("Permission: ").append(getPermission());
        return sb.toString();
    }
    
}
