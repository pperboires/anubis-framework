package net.sourceforge.anubis.domain;

import java.lang.String;
import java.util.Set;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.OperationTranslation;

privileged aspect Operation_Roo_JavaBean {
    
    public String Operation.getId() {
        return this.id;
    }
    
    public void Operation.setId(String id) {
        this.id = id;
    }
    
    public Application Operation.getApplication() {
        return this.application;
    }
    
    public void Operation.setApplication(Application application) {
        this.application = application;
    }
    
    public Set<OperationTranslation> Operation.getTranslations() {
        return this.translations;
    }
    
    public void Operation.setTranslations(Set<OperationTranslation> translations) {
        this.translations = translations;
    }
    
}
