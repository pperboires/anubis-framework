package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect UserManualGroupMembership_Roo_ToString {
    
    public String UserManualGroupMembership.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("ManualGroup: ").append(getManualGroup()).append(", ");
        sb.append("User: ").append(getUser());
        return sb.toString();
    }
    
}
