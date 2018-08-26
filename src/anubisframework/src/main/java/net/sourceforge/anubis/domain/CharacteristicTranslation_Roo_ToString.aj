package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect CharacteristicTranslation_Roo_ToString {
    
    public String CharacteristicTranslation.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Description: ").append(getDescription()).append(", ");
        sb.append("Locale: ").append(getLocale()).append(", ");
        sb.append("Characteristic: ").append(getCharacteristic());
        return sb.toString();
    }
    
}
