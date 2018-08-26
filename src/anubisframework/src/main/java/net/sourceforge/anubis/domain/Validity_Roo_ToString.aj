package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect Validity_Roo_ToString {
    
    public String Validity.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Begin_date: ").append(getBegin_date()).append(", ");
        sb.append("End_date: ").append(getEnd_date());
        return sb.toString();
    }
    
}
