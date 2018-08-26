package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect CharacterizedGroupInactivation_Roo_ToString {
    
    public String CharacterizedGroupInactivation.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("CharacterizedGroup: ").append(getCharacterizedGroup()).append(", ");
        sb.append("Inactivation: ").append(getInactivation());
        return sb.toString();
    }
    
}
