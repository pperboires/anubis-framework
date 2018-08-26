package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect PermissionConflict_Roo_ToString {
    
    public String PermissionConflict.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Permission: ").append(getPermission()).append(", ");
        sb.append("PermissionConflicted: ").append(getPermissionConflicted()).append(", ");
        sb.append("Translations: ").append(getTranslations() == null ? "null" : getTranslations().size());
        return sb.toString();
    }
    
}
