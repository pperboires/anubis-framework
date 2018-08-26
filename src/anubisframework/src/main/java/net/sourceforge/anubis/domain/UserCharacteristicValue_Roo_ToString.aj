package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect UserCharacteristicValue_Roo_ToString {
    
    public String UserCharacteristicValue.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("User: ").append(getUser()).append(", ");
        sb.append("CharacteristcValue: ").append(getCharacteristcValue());
        return sb.toString();
    }
    
}
