package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.CommonRole;
import net.sourceforge.anubis.domain.Locale;

privileged aspect CommonRoleTranslation_Roo_JavaBean {
    
    public String CommonRoleTranslation.getName() {
        return this.name;
    }
    
    public void CommonRoleTranslation.setName(String name) {
        this.name = name;
    }
    
    public String CommonRoleTranslation.getDescription() {
        return this.description;
    }
    
    public void CommonRoleTranslation.setDescription(String description) {
        this.description = description;
    }
    
    public CommonRole CommonRoleTranslation.getCommonRole() {
        return this.commonRole;
    }
    
    public void CommonRoleTranslation.setCommonRole(CommonRole commonRole) {
        this.commonRole = commonRole;
    }
    
    public Locale CommonRoleTranslation.getLocale() {
        return this.locale;
    }
    
    public void CommonRoleTranslation.setLocale(Locale locale) {
        this.locale = locale;
    }
    
}
