package net.sourceforge.anubis.domain;

import java.lang.String;
import java.util.Set;
import net.sourceforge.anubis.domain.Context;
import net.sourceforge.anubis.domain.ContextValueTranslation;

privileged aspect ContextValue_Roo_JavaBean {
    
    public String ContextValue.getId() {
        return this.id;
    }
    
    public void ContextValue.setId(String id) {
        this.id = id;
    }
    
    public Context ContextValue.getContext() {
        return this.context;
    }
    
    public void ContextValue.setContext(Context context) {
        this.context = context;
    }
    
    public Set<ContextValueTranslation> ContextValue.getTranslations() {
        return this.translations;
    }
    
    public void ContextValue.setTranslations(Set<ContextValueTranslation> translations) {
        this.translations = translations;
    }
    
}
