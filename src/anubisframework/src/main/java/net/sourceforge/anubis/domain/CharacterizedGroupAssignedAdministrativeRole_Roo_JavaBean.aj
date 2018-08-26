package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.AdministrativeRole;
import net.sourceforge.anubis.domain.CharacterizedGroup;

privileged aspect CharacterizedGroupAssignedAdministrativeRole_Roo_JavaBean {
    
    public CharacterizedGroup CharacterizedGroupAssignedAdministrativeRole.getCharacterizedGroup() {
        return this.characterizedGroup;
    }
    
    public void CharacterizedGroupAssignedAdministrativeRole.setCharacterizedGroup(CharacterizedGroup characterizedGroup) {
        this.characterizedGroup = characterizedGroup;
    }
    
    public AdministrativeRole CharacterizedGroupAssignedAdministrativeRole.getAdministrativeRole() {
        return this.administrativeRole;
    }
    
    public void CharacterizedGroupAssignedAdministrativeRole.setAdministrativeRole(AdministrativeRole administrativeRole) {
        this.administrativeRole = administrativeRole;
    }
    
}
