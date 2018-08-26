package net.sourceforge.anubis.domain;

import java.lang.String;
import java.util.Set;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.ContextTranslation;

privileged aspect Context_Roo_JavaBean {
    
    public String Context.getId() {
        return this.id;
    }
    
    public void Context.setId(String id) {
        this.id = id;
    }
    
    public Application Context.getApplication() {
        return this.application;
    }
    
    public void Context.setApplication(Application application) {
        this.application = application;
    }
    
    public Set<ContextTranslation> Context.getTranslations() {
        return this.translations;
    }
    
    public void Context.setTranslations(Set<ContextTranslation> translations) {
        this.translations = translations;
    }
    
}
