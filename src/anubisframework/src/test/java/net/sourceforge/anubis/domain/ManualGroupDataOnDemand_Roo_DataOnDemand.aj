package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ApplicationDataOnDemand;
import net.sourceforge.anubis.domain.ManualGroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ManualGroupDataOnDemand: @Component;
    
    private Random ManualGroupDataOnDemand.rnd = new SecureRandom();
    
    private List<ManualGroup> ManualGroupDataOnDemand.data;
    
    @Autowired
    private ApplicationDataOnDemand ManualGroupDataOnDemand.applicationDataOnDemand;
    
    public ManualGroup ManualGroupDataOnDemand.getNewTransientManualGroup(int index) {
        net.sourceforge.anubis.domain.ManualGroup obj = new net.sourceforge.anubis.domain.ManualGroup();
        obj.setApplication(applicationDataOnDemand.getRandomApplication());
        obj.setEnabled(new Boolean(true));
        return obj;
    }
    
    public ManualGroup ManualGroupDataOnDemand.getSpecificManualGroup(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ManualGroup obj = data.get(index);
        return ManualGroup.findManualGroup(obj.getUid());
    }
    
    public ManualGroup ManualGroupDataOnDemand.getRandomManualGroup() {
        init();
        ManualGroup obj = data.get(rnd.nextInt(data.size()));
        return ManualGroup.findManualGroup(obj.getUid());
    }
    
    public boolean ManualGroupDataOnDemand.modifyManualGroup(ManualGroup obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ManualGroupDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.ManualGroup.findManualGroupEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ManualGroup' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.ManualGroup>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.ManualGroup obj = getNewTransientManualGroup(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
