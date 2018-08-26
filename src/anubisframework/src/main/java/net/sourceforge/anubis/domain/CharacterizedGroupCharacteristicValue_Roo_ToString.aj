package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect CharacterizedGroupCharacteristicValue_Roo_ToString {
    
    public String CharacterizedGroupCharacteristicValue.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("CharacterizedGroup: ").append(getCharacterizedGroup()).append(", ");
        sb.append("CharacteristicValue: ").append(getCharacteristicValue());
        return sb.toString();
    }
    
}
