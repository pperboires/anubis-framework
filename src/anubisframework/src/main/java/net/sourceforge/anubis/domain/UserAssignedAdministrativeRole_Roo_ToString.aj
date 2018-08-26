package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect UserAssignedAdministrativeRole_Roo_ToString {
    
    public String UserAssignedAdministrativeRole.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("User: ").append(getUser()).append(", ");
        sb.append("AdministrativeRole: ").append(getAdministrativeRole()).append(", ");
        sb.append("Validity: ").append(getValidity());
        return sb.toString();
    }
    
}
