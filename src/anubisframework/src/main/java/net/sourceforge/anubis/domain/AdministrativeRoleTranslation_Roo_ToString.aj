package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect AdministrativeRoleTranslation_Roo_ToString {
    
    public String AdministrativeRoleTranslation.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Locale: ").append(getLocale()).append(", ");
        sb.append("AdministrativeRole: ").append(getAdministrativeRole()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Description: ").append(getDescription());
        return sb.toString();
    }
    
}
