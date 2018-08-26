package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.Context;
import net.sourceforge.anubis.domain.Locale;

privileged aspect ContextTranslation_Roo_JavaBean {
    
    public String ContextTranslation.getName() {
        return this.name;
    }
    
    public void ContextTranslation.setName(String name) {
        this.name = name;
    }
    
    public String ContextTranslation.getDescription() {
        return this.description;
    }
    
    public void ContextTranslation.setDescription(String description) {
        this.description = description;
    }
    
    public Context ContextTranslation.getContext() {
        return this.context;
    }
    
    public void ContextTranslation.setContext(Context context) {
        this.context = context;
    }
    
    public Locale ContextTranslation.getLocale() {
        return this.locale;
    }
    
    public void ContextTranslation.setLocale(Locale locale) {
        this.locale = locale;
    }
    
}
