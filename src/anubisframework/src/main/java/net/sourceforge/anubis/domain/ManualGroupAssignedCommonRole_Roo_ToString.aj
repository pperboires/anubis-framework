package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect ManualGroupAssignedCommonRole_Roo_ToString {
    
    public String ManualGroupAssignedCommonRole.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("ManualGroup: ").append(getManualGroup()).append(", ");
        sb.append("CommonRole: ").append(getCommonRole());
        return sb.toString();
    }
    
}
