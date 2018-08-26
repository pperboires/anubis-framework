package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.ContextValue;
import net.sourceforge.anubis.domain.Locale;

privileged aspect ContextValueTranslation_Roo_JavaBean {
    
    public Locale ContextValueTranslation.getLocale() {
        return this.locale;
    }
    
    public void ContextValueTranslation.setLocale(Locale locale) {
        this.locale = locale;
    }
    
    public String ContextValueTranslation.getName() {
        return this.name;
    }
    
    public void ContextValueTranslation.setName(String name) {
        this.name = name;
    }
    
    public String ContextValueTranslation.getDescription() {
        return this.description;
    }
    
    public void ContextValueTranslation.setDescription(String description) {
        this.description = description;
    }
    
    public ContextValue ContextValueTranslation.getContextValue() {
        return this.contextValue;
    }
    
    public void ContextValueTranslation.setContextValue(ContextValue contextValue) {
        this.contextValue = contextValue;
    }
    
}
