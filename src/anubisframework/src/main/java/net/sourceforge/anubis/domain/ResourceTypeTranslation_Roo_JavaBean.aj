package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.Locale;
import net.sourceforge.anubis.domain.ResourceType;

privileged aspect ResourceTypeTranslation_Roo_JavaBean {
    
    public String ResourceTypeTranslation.getName() {
        return this.name;
    }
    
    public void ResourceTypeTranslation.setName(String name) {
        this.name = name;
    }
    
    public String ResourceTypeTranslation.getDescription() {
        return this.description;
    }
    
    public void ResourceTypeTranslation.setDescription(String description) {
        this.description = description;
    }
    
    public Locale ResourceTypeTranslation.getLocale() {
        return this.locale;
    }
    
    public void ResourceTypeTranslation.setLocale(Locale locale) {
        this.locale = locale;
    }
    
    public ResourceType ResourceTypeTranslation.getResourceType() {
        return this.resourceType;
    }
    
    public void ResourceTypeTranslation.setResourceType(ResourceType resourceType) {
        this.resourceType = resourceType;
    }
    
}
