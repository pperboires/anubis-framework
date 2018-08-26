package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect User_Roo_ToString {
    
    public String User.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("PreferredLocale: ").append(getPreferredLocale()).append(", ");
        sb.append("Account: ").append(getAccount());
        return sb.toString();
    }
    
}
