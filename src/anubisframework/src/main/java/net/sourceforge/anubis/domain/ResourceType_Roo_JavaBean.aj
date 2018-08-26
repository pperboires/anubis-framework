package net.sourceforge.anubis.domain;

import java.lang.String;
import java.util.Set;
import net.sourceforge.anubis.domain.ResourceTypeTranslation;

privileged aspect ResourceType_Roo_JavaBean {
    
    public String ResourceType.getId() {
        return this.id;
    }
    
    public void ResourceType.setId(String id) {
        this.id = id;
    }
    
    public Set<ResourceTypeTranslation> ResourceType.getTranslations() {
        return this.translations;
    }
    
    public void ResourceType.setTranslations(Set<ResourceTypeTranslation> translations) {
        this.translations = translations;
    }
    
}
