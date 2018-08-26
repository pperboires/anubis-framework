package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect OperationTranslation_Roo_ToString {
    
    public String OperationTranslation.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Description: ").append(getDescription()).append(", ");
        sb.append("Operation: ").append(getOperation()).append(", ");
        sb.append("Locale: ").append(getLocale());
        return sb.toString();
    }
    
}
