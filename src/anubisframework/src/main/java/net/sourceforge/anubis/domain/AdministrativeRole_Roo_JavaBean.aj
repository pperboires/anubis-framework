package net.sourceforge.anubis.domain;

import java.lang.Boolean;
import java.lang.String;
import java.util.Set;
import net.sourceforge.anubis.domain.AdministrativeRoleTranslation;
import net.sourceforge.anubis.domain.Application;

privileged aspect AdministrativeRole_Roo_JavaBean {
    
    public String AdministrativeRole.getId() {
        return this.id;
    }
    
    public void AdministrativeRole.setId(String id) {
        this.id = id;
    }
    
    public Application AdministrativeRole.getApplication() {
        return this.application;
    }
    
    public void AdministrativeRole.setApplication(Application application) {
        this.application = application;
    }
    
    public Boolean AdministrativeRole.getEnabled() {
        return this.enabled;
    }
    
    public void AdministrativeRole.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
    public Set<AdministrativeRoleTranslation> AdministrativeRole.getTranslations() {
        return this.translations;
    }
    
    public void AdministrativeRole.setTranslations(Set<AdministrativeRoleTranslation> translations) {
        this.translations = translations;
    }
    
}
