package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect UserAssignedSecurityAdministrativeRole_Roo_ToString {
    
    public String UserAssignedSecurityAdministrativeRole.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("User: ").append(getUser()).append(", ");
        sb.append("Validity: ").append(getValidity());
        return sb.toString();
    }
    
}
