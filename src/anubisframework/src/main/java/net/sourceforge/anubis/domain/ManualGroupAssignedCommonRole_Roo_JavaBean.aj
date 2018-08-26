package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CommonRole;
import net.sourceforge.anubis.domain.ManualGroup;

privileged aspect ManualGroupAssignedCommonRole_Roo_JavaBean {
    
    public ManualGroup ManualGroupAssignedCommonRole.getManualGroup() {
        return this.manualGroup;
    }
    
    public void ManualGroupAssignedCommonRole.setManualGroup(ManualGroup manualGroup) {
        this.manualGroup = manualGroup;
    }
    
    public CommonRole ManualGroupAssignedCommonRole.getCommonRole() {
        return this.commonRole;
    }
    
    public void ManualGroupAssignedCommonRole.setCommonRole(CommonRole commonRole) {
        this.commonRole = commonRole;
    }
    
}
