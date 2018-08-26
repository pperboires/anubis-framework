package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.AdministrativeRole;
import net.sourceforge.anubis.domain.Locale;

privileged aspect AdministrativeRoleTranslation_Roo_JavaBean {
    
    public Locale AdministrativeRoleTranslation.getLocale() {
        return this.locale;
    }
    
    public void AdministrativeRoleTranslation.setLocale(Locale locale) {
        this.locale = locale;
    }
    
    public AdministrativeRole AdministrativeRoleTranslation.getAdministrativeRole() {
        return this.administrativeRole;
    }
    
    public void AdministrativeRoleTranslation.setAdministrativeRole(AdministrativeRole administrativeRole) {
        this.administrativeRole = administrativeRole;
    }
    
    public String AdministrativeRoleTranslation.getName() {
        return this.name;
    }
    
    public void AdministrativeRoleTranslation.setName(String name) {
        this.name = name;
    }
    
    public String AdministrativeRoleTranslation.getDescription() {
        return this.description;
    }
    
    public void AdministrativeRoleTranslation.setDescription(String description) {
        this.description = description;
    }
    
}
