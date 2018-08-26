package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.AdministrativeRoleDataOnDemand;
import net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole;
import net.sourceforge.anubis.domain.ManualGroupDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupAssignedAdministrativeRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ManualGroupAssignedAdministrativeRoleDataOnDemand: @Component;
    
    private Random ManualGroupAssignedAdministrativeRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<ManualGroupAssignedAdministrativeRole> ManualGroupAssignedAdministrativeRoleDataOnDemand.data;
    
    @Autowired
    private AdministrativeRoleDataOnDemand ManualGroupAssignedAdministrativeRoleDataOnDemand.administrativeRoleDataOnDemand;
    
    @Autowired
    private ManualGroupDataOnDemand ManualGroupAssignedAdministrativeRoleDataOnDemand.manualGroupDataOnDemand;
    
    public ManualGroupAssignedAdministrativeRole ManualGroupAssignedAdministrativeRoleDataOnDemand.getNewTransientManualGroupAssignedAdministrativeRole(int index) {
        net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole obj = new net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole();
        obj.setAdministrativeRole(administrativeRoleDataOnDemand.getRandomAdministrativeRole());
        obj.setManualGroup(manualGroupDataOnDemand.getRandomManualGroup());
        return obj;
    }
    
    public ManualGroupAssignedAdministrativeRole ManualGroupAssignedAdministrativeRoleDataOnDemand.getSpecificManualGroupAssignedAdministrativeRole(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ManualGroupAssignedAdministrativeRole obj = data.get(index);
        return ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRole(obj.getUid());
    }
    
    public ManualGroupAssignedAdministrativeRole ManualGroupAssignedAdministrativeRoleDataOnDemand.getRandomManualGroupAssignedAdministrativeRole() {
        init();
        ManualGroupAssignedAdministrativeRole obj = data.get(rnd.nextInt(data.size()));
        return ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRole(obj.getUid());
    }
    
    public boolean ManualGroupAssignedAdministrativeRoleDataOnDemand.modifyManualGroupAssignedAdministrativeRole(ManualGroupAssignedAdministrativeRole obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ManualGroupAssignedAdministrativeRoleDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRoleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ManualGroupAssignedAdministrativeRole' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole obj = getNewTransientManualGroupAssignedAdministrativeRole(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
