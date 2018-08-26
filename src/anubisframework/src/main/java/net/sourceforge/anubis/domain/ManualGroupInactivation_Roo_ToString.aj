package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect ManualGroupInactivation_Roo_ToString {
    
    public String ManualGroupInactivation.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("ManualGroup: ").append(getManualGroup()).append(", ");
        sb.append("Validity: ").append(getValidity());
        return sb.toString();
    }
    
}
