package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.Inactivation;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect InactivationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: InactivationDataOnDemand: @Component;
    
    private Random InactivationDataOnDemand.rnd = new SecureRandom();
    
    private List<Inactivation> InactivationDataOnDemand.data;
    
    public Inactivation InactivationDataOnDemand.getNewTransientInactivation(int index) {
        net.sourceforge.anubis.domain.Inactivation obj = new net.sourceforge.anubis.domain.Inactivation();
        return obj;
    }
    
    public Inactivation InactivationDataOnDemand.getSpecificInactivation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Inactivation obj = data.get(index);
        return Inactivation.findInactivation(obj.getUid());
    }
    
    public Inactivation InactivationDataOnDemand.getRandomInactivation() {
        init();
        Inactivation obj = data.get(rnd.nextInt(data.size()));
        return Inactivation.findInactivation(obj.getUid());
    }
    
    public boolean InactivationDataOnDemand.modifyInactivation(Inactivation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void InactivationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.Inactivation.findInactivationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Inactivation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.Inactivation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.Inactivation obj = getNewTransientInactivation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
