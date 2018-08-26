package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect Locale_Roo_ToString {
    
    public String Locale.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Code: ").append(getCode()).append(", ");
        sb.append("Name: ").append(getName());
        return sb.toString();
    }
    
}
