package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect CharacterizedGroupAssignedAdministrativeRole_Roo_ToString {
    
    public String CharacterizedGroupAssignedAdministrativeRole.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Uid: ").append(getUid()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("CharacterizedGroup: ").append(getCharacterizedGroup()).append(", ");
        sb.append("AdministrativeRole: ").append(getAdministrativeRole());
        return sb.toString();
    }
    
}
