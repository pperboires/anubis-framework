package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CommonRoleDataOnDemand;
import net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole;
import net.sourceforge.anubis.domain.ManualGroupDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupAssignedCommonRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ManualGroupAssignedCommonRoleDataOnDemand: @Component;
    
    private Random ManualGroupAssignedCommonRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<ManualGroupAssignedCommonRole> ManualGroupAssignedCommonRoleDataOnDemand.data;
    
    @Autowired
    private CommonRoleDataOnDemand ManualGroupAssignedCommonRoleDataOnDemand.commonRoleDataOnDemand;
    
    @Autowired
    private ManualGroupDataOnDemand ManualGroupAssignedCommonRoleDataOnDemand.manualGroupDataOnDemand;
    
    public ManualGroupAssignedCommonRole ManualGroupAssignedCommonRoleDataOnDemand.getNewTransientManualGroupAssignedCommonRole(int index) {
        net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole obj = new net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole();
        obj.setCommonRole(commonRoleDataOnDemand.getRandomCommonRole());
        obj.setManualGroup(manualGroupDataOnDemand.getRandomManualGroup());
        return obj;
    }
    
    public ManualGroupAssignedCommonRole ManualGroupAssignedCommonRoleDataOnDemand.getSpecificManualGroupAssignedCommonRole(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ManualGroupAssignedCommonRole obj = data.get(index);
        return ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRole(obj.getUid());
    }
    
    public ManualGroupAssignedCommonRole ManualGroupAssignedCommonRoleDataOnDemand.getRandomManualGroupAssignedCommonRole() {
        init();
        ManualGroupAssignedCommonRole obj = data.get(rnd.nextInt(data.size()));
        return ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRole(obj.getUid());
    }
    
    public boolean ManualGroupAssignedCommonRoleDataOnDemand.modifyManualGroupAssignedCommonRole(ManualGroupAssignedCommonRole obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ManualGroupAssignedCommonRoleDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRoleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ManualGroupAssignedCommonRole' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole obj = getNewTransientManualGroupAssignedCommonRole(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
