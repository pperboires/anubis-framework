package net.sourceforge.anubis.domain;

import java.lang.String;
import java.util.Set;
import net.sourceforge.anubis.domain.Characteristic;
import net.sourceforge.anubis.domain.CharacteristicValueTranslation;

privileged aspect CharacteristicValue_Roo_JavaBean {
    
    public String CharacteristicValue.getId() {
        return this.id;
    }
    
    public void CharacteristicValue.setId(String id) {
        this.id = id;
    }
    
    public Characteristic CharacteristicValue.getCharacteristic() {
        return this.characteristic;
    }
    
    public void CharacteristicValue.setCharacteristic(Characteristic characteristic) {
        this.characteristic = characteristic;
    }
    
    public Set<CharacteristicValueTranslation> CharacteristicValue.getTranslations() {
        return this.translations;
    }
    
    public void CharacteristicValue.setTranslations(Set<CharacteristicValueTranslation> translations) {
        this.translations = translations;
    }
    
}
