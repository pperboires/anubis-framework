package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect Permission_Roo_ToString {
    
    public String Permission.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Enabled: ").append(getEnabled()).append(", ");
        sb.append("Contextualized: ").append(getContextualized()).append(", ");
        sb.append("Audited: ").append(getAudited()).append(", ");
        sb.append("Operation: ").append(getOperation()).append(", ");
        sb.append("Resource: ").append(getResource());
        return sb.toString();
    }
    
}
