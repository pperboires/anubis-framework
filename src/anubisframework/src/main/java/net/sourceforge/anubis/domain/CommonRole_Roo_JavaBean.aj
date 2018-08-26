package net.sourceforge.anubis.domain;

import java.lang.Boolean;
import java.lang.String;
import java.util.Set;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.CommonRoleTranslation;

privileged aspect CommonRole_Roo_JavaBean {
    
    public String CommonRole.getId() {
        return this.id;
    }
    
    public void CommonRole.setId(String id) {
        this.id = id;
    }
    
    public Application CommonRole.getApplication() {
        return this.application;
    }
    
    public void CommonRole.setApplication(Application application) {
        this.application = application;
    }
    
    public Boolean CommonRole.getEnabled() {
        return this.enabled;
    }
    
    public void CommonRole.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
    public Set<CommonRoleTranslation> CommonRole.getTranslations() {
        return this.translations;
    }
    
    public void CommonRole.setTranslations(Set<CommonRoleTranslation> translations) {
        this.translations = translations;
    }
    
}
