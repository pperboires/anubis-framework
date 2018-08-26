package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect PermissionContext_Roo_ToString {
    
    public String PermissionContext.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Context: ").append(getContext()).append(", ");
        sb.append("Permission: ").append(getPermission());
        return sb.toString();
    }
    
}
