package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect PermissionConflictTranslation_Roo_ToString {
    
    public String PermissionConflictTranslation.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("PermissionConflict: ").append(getPermissionConflict()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Description: ").append(getDescription());
        return sb.toString();
    }
    
}
