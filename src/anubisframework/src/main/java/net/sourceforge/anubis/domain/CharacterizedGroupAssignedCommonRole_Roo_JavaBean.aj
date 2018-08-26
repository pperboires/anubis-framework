package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacterizedGroup;
import net.sourceforge.anubis.domain.CommonRole;

privileged aspect CharacterizedGroupAssignedCommonRole_Roo_JavaBean {
    
    public CommonRole CharacterizedGroupAssignedCommonRole.getCommonRole() {
        return this.commonRole;
    }
    
    public void CharacterizedGroupAssignedCommonRole.setCommonRole(CommonRole commonRole) {
        this.commonRole = commonRole;
    }
    
    public CharacterizedGroup CharacterizedGroupAssignedCommonRole.getCharacterizedGroup() {
        return this.characterizedGroup;
    }
    
    public void CharacterizedGroupAssignedCommonRole.setCharacterizedGroup(CharacterizedGroup characterizedGroup) {
        this.characterizedGroup = characterizedGroup;
    }
    
}
