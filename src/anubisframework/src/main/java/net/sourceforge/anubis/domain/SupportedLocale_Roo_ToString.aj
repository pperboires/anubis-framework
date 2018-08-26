package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect SupportedLocale_Roo_ToString {
    
    public String SupportedLocale.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Locale: ").append(getLocale()).append(", ");
        sb.append("Application: ").append(getApplication()).append(", ");
        sb.append("Preference: ").append(getPreference());
        return sb.toString();
    }
    
}
