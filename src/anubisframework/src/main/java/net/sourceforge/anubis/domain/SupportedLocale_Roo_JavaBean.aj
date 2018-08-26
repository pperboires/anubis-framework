package net.sourceforge.anubis.domain;

import java.lang.Integer;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.Locale;

privileged aspect SupportedLocale_Roo_JavaBean {
    
    public Locale SupportedLocale.getLocale() {
        return this.locale;
    }
    
    public void SupportedLocale.setLocale(Locale locale) {
        this.locale = locale;
    }
    
    public Application SupportedLocale.getApplication() {
        return this.application;
    }
    
    public void SupportedLocale.setApplication(Application application) {
        this.application = application;
    }
    
    public Integer SupportedLocale.getPreference() {
        return this.preference;
    }
    
    public void SupportedLocale.setPreference(Integer preference) {
        this.preference = preference;
    }
    
}
