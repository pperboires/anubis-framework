package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacteristicValue;
import net.sourceforge.anubis.domain.CharacterizedGroup;

privileged aspect CharacterizedGroupCharacteristicValue_Roo_JavaBean {
    
    public CharacterizedGroup CharacterizedGroupCharacteristicValue.getCharacterizedGroup() {
        return this.characterizedGroup;
    }
    
    public void CharacterizedGroupCharacteristicValue.setCharacterizedGroup(CharacterizedGroup characterizedGroup) {
        this.characterizedGroup = characterizedGroup;
    }
    
    public CharacteristicValue CharacterizedGroupCharacteristicValue.getCharacteristicValue() {
        return this.characteristicValue;
    }
    
    public void CharacterizedGroupCharacteristicValue.setCharacteristicValue(CharacteristicValue characteristicValue) {
        this.characteristicValue = characteristicValue;
    }
    
}
