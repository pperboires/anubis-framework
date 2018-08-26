package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.CharacteristicValue;
import net.sourceforge.anubis.domain.Locale;

privileged aspect CharacteristicValueTranslation_Roo_JavaBean {
    
    public String CharacteristicValueTranslation.getName() {
        return this.name;
    }
    
    public void CharacteristicValueTranslation.setName(String name) {
        this.name = name;
    }
    
    public String CharacteristicValueTranslation.getDescription() {
        return this.description;
    }
    
    public void CharacteristicValueTranslation.setDescription(String description) {
        this.description = description;
    }
    
    public Locale CharacteristicValueTranslation.getLocale() {
        return this.locale;
    }
    
    public void CharacteristicValueTranslation.setLocale(Locale locale) {
        this.locale = locale;
    }
    
    public CharacteristicValue CharacteristicValueTranslation.getCharacteristicValue() {
        return this.characteristicValue;
    }
    
    public void CharacteristicValueTranslation.setCharacteristicValue(CharacteristicValue characteristicValue) {
        this.characteristicValue = characteristicValue;
    }
    
}
