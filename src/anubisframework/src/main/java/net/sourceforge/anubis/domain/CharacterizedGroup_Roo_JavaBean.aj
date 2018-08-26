package net.sourceforge.anubis.domain;

import java.lang.Boolean;
import java.lang.String;
import java.util.Set;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.CharacterizedGroupTranslation;

privileged aspect CharacterizedGroup_Roo_JavaBean {
    
    public String CharacterizedGroup.getId() {
        return this.id;
    }
    
    public void CharacterizedGroup.setId(String id) {
        this.id = id;
    }
    
    public Boolean CharacterizedGroup.getEnabled() {
        return this.enabled;
    }
    
    public void CharacterizedGroup.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
    public Application CharacterizedGroup.getApplication() {
        return this.application;
    }
    
    public void CharacterizedGroup.setApplication(Application application) {
        this.application = application;
    }
    
    public Set<CharacterizedGroupTranslation> CharacterizedGroup.getTranslations() {
        return this.translations;
    }
    
    public void CharacterizedGroup.setTranslations(Set<CharacterizedGroupTranslation> translations) {
        this.translations = translations;
    }
    
}
