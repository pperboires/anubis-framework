package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ManualGroupDataOnDemand;
import net.sourceforge.anubis.domain.ManualGroupInactivation;
import net.sourceforge.anubis.domain.ValidityDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupInactivationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ManualGroupInactivationDataOnDemand: @Component;
    
    private Random ManualGroupInactivationDataOnDemand.rnd = new SecureRandom();
    
    private List<ManualGroupInactivation> ManualGroupInactivationDataOnDemand.data;
    
    @Autowired
    private ManualGroupDataOnDemand ManualGroupInactivationDataOnDemand.manualGroupDataOnDemand;
    
    @Autowired
    private ValidityDataOnDemand ManualGroupInactivationDataOnDemand.validityDataOnDemand;
    
    public ManualGroupInactivation ManualGroupInactivationDataOnDemand.getNewTransientManualGroupInactivation(int index) {
        net.sourceforge.anubis.domain.ManualGroupInactivation obj = new net.sourceforge.anubis.domain.ManualGroupInactivation();
        obj.setManualGroup(manualGroupDataOnDemand.getRandomManualGroup());
        obj.setValidity(validityDataOnDemand.getRandomValidity());
        return obj;
    }
    
    public ManualGroupInactivation ManualGroupInactivationDataOnDemand.getSpecificManualGroupInactivation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ManualGroupInactivation obj = data.get(index);
        return ManualGroupInactivation.findManualGroupInactivation(obj.getUid());
    }
    
    public ManualGroupInactivation ManualGroupInactivationDataOnDemand.getRandomManualGroupInactivation() {
        init();
        ManualGroupInactivation obj = data.get(rnd.nextInt(data.size()));
        return ManualGroupInactivation.findManualGroupInactivation(obj.getUid());
    }
    
    public boolean ManualGroupInactivationDataOnDemand.modifyManualGroupInactivation(ManualGroupInactivation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ManualGroupInactivationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.ManualGroupInactivation.findManualGroupInactivationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ManualGroupInactivation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.ManualGroupInactivation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.ManualGroupInactivation obj = getNewTransientManualGroupInactivation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
