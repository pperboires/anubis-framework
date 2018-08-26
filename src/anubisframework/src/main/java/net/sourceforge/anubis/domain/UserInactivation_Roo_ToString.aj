package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect UserInactivation_Roo_ToString {
    
    public String UserInactivation.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("User: ").append(getUser()).append(", ");
        sb.append("Inactivation: ").append(getInactivation());
        return sb.toString();
    }
    
}
