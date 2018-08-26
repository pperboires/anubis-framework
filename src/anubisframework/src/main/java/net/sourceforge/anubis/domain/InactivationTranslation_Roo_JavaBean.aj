package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.Inactivation;

privileged aspect InactivationTranslation_Roo_JavaBean {
    
    public Inactivation InactivationTranslation.getInactivation() {
        return this.inactivation;
    }
    
    public void InactivationTranslation.setInactivation(Inactivation inactivation) {
        this.inactivation = inactivation;
    }
    
    public String InactivationTranslation.getReason() {
        return this.reason;
    }
    
    public void InactivationTranslation.setReason(String reason) {
        this.reason = reason;
    }
    
}
