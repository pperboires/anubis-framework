package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect UserAccount_Roo_ToString {
    
    public String UserAccount.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Login: ").append(getLogin()).append(", ");
        sb.append("Password: ").append(getPassword()).append(", ");
        sb.append("Enabled: ").append(getEnabled()).append(", ");
        sb.append("Email: ").append(getEmail());
        return sb.toString();
    }
    
}
