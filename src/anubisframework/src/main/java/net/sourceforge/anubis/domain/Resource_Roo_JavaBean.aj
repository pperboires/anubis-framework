package net.sourceforge.anubis.domain;

import java.lang.Boolean;
import java.lang.String;
import java.util.Set;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.Resource;
import net.sourceforge.anubis.domain.ResourceTranslation;
import net.sourceforge.anubis.domain.ResourceType;

privileged aspect Resource_Roo_JavaBean {
    
    public String Resource.getId() {
        return this.id;
    }
    
    public void Resource.setId(String id) {
        this.id = id;
    }
    
    public Boolean Resource.getEnabled() {
        return this.enabled;
    }
    
    public void Resource.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
    public Resource Resource.getParent() {
        return this.parent;
    }
    
    public void Resource.setParent(Resource parent) {
        this.parent = parent;
    }
    
    public Application Resource.getApplication() {
        return this.application;
    }
    
    public void Resource.setApplication(Application application) {
        this.application = application;
    }
    
    public Set<ResourceTranslation> Resource.getTranslations() {
        return this.translations;
    }
    
    public void Resource.setTranslations(Set<ResourceTranslation> translations) {
        this.translations = translations;
    }
    
    public ResourceType Resource.getType() {
        return this.type;
    }
    
    public void Resource.setType(ResourceType type) {
        this.type = type;
    }
    
}
