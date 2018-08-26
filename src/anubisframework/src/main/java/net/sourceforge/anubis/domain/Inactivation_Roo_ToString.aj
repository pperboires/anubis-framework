package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect Inactivation_Roo_ToString {
    
    public String Inactivation.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Validity: ").append(getValidity()).append(", ");
        sb.append("Translations: ").append(getTranslations() == null ? "null" : getTranslations().size());
        return sb.toString();
    }
    
}
