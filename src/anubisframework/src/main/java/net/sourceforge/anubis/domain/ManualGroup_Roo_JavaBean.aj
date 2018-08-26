package net.sourceforge.anubis.domain;

import java.lang.Boolean;
import java.lang.String;
import java.util.Set;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.ManualGroupTranslation;

privileged aspect ManualGroup_Roo_JavaBean {
    
    public String ManualGroup.getId() {
        return this.id;
    }
    
    public void ManualGroup.setId(String id) {
        this.id = id;
    }
    
    public Application ManualGroup.getApplication() {
        return this.application;
    }
    
    public void ManualGroup.setApplication(Application application) {
        this.application = application;
    }
    
    public Boolean ManualGroup.getEnabled() {
        return this.enabled;
    }
    
    public void ManualGroup.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
    public Set<ManualGroupTranslation> ManualGroup.getTranslations() {
        return this.translations;
    }
    
    public void ManualGroup.setTranslations(Set<ManualGroupTranslation> translations) {
        this.translations = translations;
    }
    
}
