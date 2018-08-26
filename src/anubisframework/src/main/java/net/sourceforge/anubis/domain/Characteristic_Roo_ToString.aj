package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect Characteristic_Roo_ToString {
    
    public String Characteristic.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Translations: ").append(getTranslations() == null ? "null" : getTranslations().size());
        return sb.toString();
    }
    
}
