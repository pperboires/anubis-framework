package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.Locale;
import net.sourceforge.anubis.domain.ManualGroup;

privileged aspect ManualGroupTranslation_Roo_JavaBean {
    
    public String ManualGroupTranslation.getName() {
        return this.name;
    }
    
    public void ManualGroupTranslation.setName(String name) {
        this.name = name;
    }
    
    public String ManualGroupTranslation.getDescription() {
        return this.description;
    }
    
    public void ManualGroupTranslation.setDescription(String description) {
        this.description = description;
    }
    
    public ManualGroup ManualGroupTranslation.getManualGroup() {
        return this.manualGroup;
    }
    
    public void ManualGroupTranslation.setManualGroup(ManualGroup manualGroup) {
        this.manualGroup = manualGroup;
    }
    
    public Locale ManualGroupTranslation.getLocale() {
        return this.locale;
    }
    
    public void ManualGroupTranslation.setLocale(Locale locale) {
        this.locale = locale;
    }
    
}
