package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.Locale;
import net.sourceforge.anubis.domain.Resource;

privileged aspect ResourceTranslation_Roo_JavaBean {
    
    public String ResourceTranslation.getName() {
        return this.name;
    }
    
    public void ResourceTranslation.setName(String name) {
        this.name = name;
    }
    
    public String ResourceTranslation.getDescription() {
        return this.description;
    }
    
    public void ResourceTranslation.setDescription(String description) {
        this.description = description;
    }
    
    public Resource ResourceTranslation.getResource() {
        return this.resource;
    }
    
    public void ResourceTranslation.setResource(Resource resource) {
        this.resource = resource;
    }
    
    public Locale ResourceTranslation.getLocale() {
        return this.locale;
    }
    
    public void ResourceTranslation.setLocale(Locale locale) {
        this.locale = locale;
    }
    
}
