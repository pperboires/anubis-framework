package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.AdministrativeRole;
import net.sourceforge.anubis.domain.ManualGroup;

privileged aspect ManualGroupAssignedAdministrativeRole_Roo_JavaBean {
    
    public ManualGroup ManualGroupAssignedAdministrativeRole.getManualGroup() {
        return this.manualGroup;
    }
    
    public void ManualGroupAssignedAdministrativeRole.setManualGroup(ManualGroup manualGroup) {
        this.manualGroup = manualGroup;
    }
    
    public AdministrativeRole ManualGroupAssignedAdministrativeRole.getAdministrativeRole() {
        return this.administrativeRole;
    }
    
    public void ManualGroupAssignedAdministrativeRole.setAdministrativeRole(AdministrativeRole administrativeRole) {
        this.administrativeRole = administrativeRole;
    }
    
}
