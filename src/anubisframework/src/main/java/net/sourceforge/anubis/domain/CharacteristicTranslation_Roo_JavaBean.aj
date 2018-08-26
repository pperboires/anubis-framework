package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.Characteristic;
import net.sourceforge.anubis.domain.Locale;

privileged aspect CharacteristicTranslation_Roo_JavaBean {
    
    public String CharacteristicTranslation.getName() {
        return this.name;
    }
    
    public void CharacteristicTranslation.setName(String name) {
        this.name = name;
    }
    
    public String CharacteristicTranslation.getDescription() {
        return this.description;
    }
    
    public void CharacteristicTranslation.setDescription(String description) {
        this.description = description;
    }
    
    public Locale CharacteristicTranslation.getLocale() {
        return this.locale;
    }
    
    public void CharacteristicTranslation.setLocale(Locale locale) {
        this.locale = locale;
    }
    
    public Characteristic CharacteristicTranslation.getCharacteristic() {
        return this.characteristic;
    }
    
    public void CharacteristicTranslation.setCharacteristic(Characteristic characteristic) {
        this.characteristic = characteristic;
    }
    
}
