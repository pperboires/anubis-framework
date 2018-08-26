package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect ManualGroupAssignedAdministrativeRole_Roo_ToString {
    
    public String ManualGroupAssignedAdministrativeRole.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("ManualGroup: ").append(getManualGroup()).append(", ");
        sb.append("AdministrativeRole: ").append(getAdministrativeRole());
        return sb.toString();
    }
    
}
