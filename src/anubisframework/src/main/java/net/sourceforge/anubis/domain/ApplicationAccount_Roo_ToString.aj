package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect ApplicationAccount_Roo_ToString {
    
    public String ApplicationAccount.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Password: ").append(getPassword()).append(", ");
        sb.append("Enabled: ").append(getEnabled());
        return sb.toString();
    }
    
}
