package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect CharacterizedGroupAssignedCommonRole_Roo_ToString {
    
    public String CharacterizedGroupAssignedCommonRole.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("CommonRole: ").append(getCommonRole()).append(", ");
        sb.append("CharacterizedGroup: ").append(getCharacterizedGroup());
        return sb.toString();
    }
    
}
