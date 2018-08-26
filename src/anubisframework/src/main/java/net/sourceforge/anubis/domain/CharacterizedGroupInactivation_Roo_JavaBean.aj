package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacterizedGroup;
import net.sourceforge.anubis.domain.Inactivation;

privileged aspect CharacterizedGroupInactivation_Roo_JavaBean {
    
    public CharacterizedGroup CharacterizedGroupInactivation.getCharacterizedGroup() {
        return this.characterizedGroup;
    }
    
    public void CharacterizedGroupInactivation.setCharacterizedGroup(CharacterizedGroup characterizedGroup) {
        this.characterizedGroup = characterizedGroup;
    }
    
    public Inactivation CharacterizedGroupInactivation.getInactivation() {
        return this.inactivation;
    }
    
    public void CharacterizedGroupInactivation.setInactivation(Inactivation inactivation) {
        this.inactivation = inactivation;
    }
    
}
