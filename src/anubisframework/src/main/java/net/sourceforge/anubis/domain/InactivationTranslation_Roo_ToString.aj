package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect InactivationTranslation_Roo_ToString {
    
    public String InactivationTranslation.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Inactivation: ").append(getInactivation()).append(", ");
        sb.append("Reason: ").append(getReason());
        return sb.toString();
    }
    
}
