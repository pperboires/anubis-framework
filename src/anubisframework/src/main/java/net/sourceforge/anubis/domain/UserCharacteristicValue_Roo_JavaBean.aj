package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacteristicValue;
import net.sourceforge.anubis.domain.User;

privileged aspect UserCharacteristicValue_Roo_JavaBean {
    
    public User UserCharacteristicValue.getUser() {
        return this.user;
    }
    
    public void UserCharacteristicValue.setUser(User user) {
        this.user = user;
    }
    
    public CharacteristicValue UserCharacteristicValue.getCharacteristcValue() {
        return this.characteristcValue;
    }
    
    public void UserCharacteristicValue.setCharacteristcValue(CharacteristicValue characteristcValue) {
        this.characteristcValue = characteristcValue;
    }
    
}
