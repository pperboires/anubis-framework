package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect CharacteristicValue_Roo_ToString {
    
    public String CharacteristicValue.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Characteristic: ").append(getCharacteristic()).append(", ");
        sb.append("Translations: ").append(getTranslations() == null ? "null" : getTranslations().size());
        return sb.toString();
    }
    
}
