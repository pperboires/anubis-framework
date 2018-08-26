package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.InactivationDataOnDemand;
import net.sourceforge.anubis.domain.InactivationTranslation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect InactivationTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: InactivationTranslationDataOnDemand: @Component;
    
    private Random InactivationTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<InactivationTranslation> InactivationTranslationDataOnDemand.data;
    
    @Autowired
    private InactivationDataOnDemand InactivationTranslationDataOnDemand.inactivationDataOnDemand;
    
    public InactivationTranslation InactivationTranslationDataOnDemand.getNewTransientInactivationTranslation(int index) {
        net.sourceforge.anubis.domain.InactivationTranslation obj = new net.sourceforge.anubis.domain.InactivationTranslation();
        obj.setInactivation(inactivationDataOnDemand.getRandomInactivation());
        obj.setReason("reason_" + index);
        return obj;
    }
    
    public InactivationTranslation InactivationTranslationDataOnDemand.getSpecificInactivationTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        InactivationTranslation obj = data.get(index);
        return InactivationTranslation.findInactivationTranslation(obj.getUid());
    }
    
    public InactivationTranslation InactivationTranslationDataOnDemand.getRandomInactivationTranslation() {
        init();
        InactivationTranslation obj = data.get(rnd.nextInt(data.size()));
        return InactivationTranslation.findInactivationTranslation(obj.getUid());
    }
    
    public boolean InactivationTranslationDataOnDemand.modifyInactivationTranslation(InactivationTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void InactivationTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.InactivationTranslation.findInactivationTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'InactivationTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.InactivationTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.InactivationTranslation obj = getNewTransientInactivationTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
