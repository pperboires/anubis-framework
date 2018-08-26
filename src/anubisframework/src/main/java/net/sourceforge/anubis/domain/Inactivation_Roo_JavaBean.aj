package net.sourceforge.anubis.domain;

import java.util.Set;
import net.sourceforge.anubis.domain.InactivationTranslation;
import net.sourceforge.anubis.domain.Validity;

privileged aspect Inactivation_Roo_JavaBean {
    
    public Validity Inactivation.getValidity() {
        return this.validity;
    }
    
    public void Inactivation.setValidity(Validity validity) {
        this.validity = validity;
    }
    
    public Set<InactivationTranslation> Inactivation.getTranslations() {
        return this.translations;
    }
    
    public void Inactivation.setTranslations(Set<InactivationTranslation> translations) {
        this.translations = translations;
    }
    
}
