package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.CharacterizedGroup;
import net.sourceforge.anubis.domain.Locale;

privileged aspect CharacterizedGroupTranslation_Roo_JavaBean {
    
    public String CharacterizedGroupTranslation.getName() {
        return this.name;
    }
    
    public void CharacterizedGroupTranslation.setName(String name) {
        this.name = name;
    }
    
    public String CharacterizedGroupTranslation.getDescription() {
        return this.description;
    }
    
    public void CharacterizedGroupTranslation.setDescription(String description) {
        this.description = description;
    }
    
    public Locale CharacterizedGroupTranslation.getLocale() {
        return this.locale;
    }
    
    public void CharacterizedGroupTranslation.setLocale(Locale locale) {
        this.locale = locale;
    }
    
    public CharacterizedGroup CharacterizedGroupTranslation.getCharacterizedGroup() {
        return this.characterizedGroup;
    }
    
    public void CharacterizedGroupTranslation.setCharacterizedGroup(CharacterizedGroup characterizedGroup) {
        this.characterizedGroup = characterizedGroup;
    }
    
}
