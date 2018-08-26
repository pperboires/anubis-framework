package net.sourceforge.anubis.domain;

import java.lang.String;
import java.util.Set;
import net.sourceforge.anubis.domain.CharacteristicTranslation;

privileged aspect Characteristic_Roo_JavaBean {
    
    public String Characteristic.getId() {
        return this.id;
    }
    
    public void Characteristic.setId(String id) {
        this.id = id;
    }
    
    public Set<CharacteristicTranslation> Characteristic.getTranslations() {
        return this.translations;
    }
    
    public void Characteristic.setTranslations(Set<CharacteristicTranslation> translations) {
        this.translations = translations;
    }
    
}
