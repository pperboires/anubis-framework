package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect Application_Roo_ToString {
    
    public String Application.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Account: ").append(getAccount());
        return sb.toString();
    }
    
}
