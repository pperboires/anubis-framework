package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ManualGroup;
import net.sourceforge.anubis.domain.Validity;

privileged aspect ManualGroupInactivation_Roo_JavaBean {
    
    public ManualGroup ManualGroupInactivation.getManualGroup() {
        return this.manualGroup;
    }
    
    public void ManualGroupInactivation.setManualGroup(ManualGroup manualGroup) {
        this.manualGroup = manualGroup;
    }
    
    public Validity ManualGroupInactivation.getValidity() {
        return this.validity;
    }
    
    public void ManualGroupInactivation.setValidity(Validity validity) {
        this.validity = validity;
    }
    
}
