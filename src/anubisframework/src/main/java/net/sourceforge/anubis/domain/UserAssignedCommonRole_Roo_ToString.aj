package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect UserAssignedCommonRole_Roo_ToString {
    
    public String UserAssignedCommonRole.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("User: ").append(getUser()).append(", ");
        sb.append("CommonRole: ").append(getCommonRole()).append(", ");
        sb.append("Validate: ").append(getValidate()).append(", ");
        sb.append("Permission: ").append(getPermission());
        return sb.toString();
    }
    
}
