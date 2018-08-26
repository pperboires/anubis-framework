package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.Validity;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ValidityDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ValidityDataOnDemand: @Component;
    
    private Random ValidityDataOnDemand.rnd = new SecureRandom();
    
    private List<Validity> ValidityDataOnDemand.data;
    
    public Validity ValidityDataOnDemand.getNewTransientValidity(int index) {
        net.sourceforge.anubis.domain.Validity obj = new net.sourceforge.anubis.domain.Validity();
        return obj;
    }
    
    public Validity ValidityDataOnDemand.getSpecificValidity(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Validity obj = data.get(index);
        return Validity.findValidity(obj.getUid());
    }
    
    public Validity ValidityDataOnDemand.getRandomValidity() {
        init();
        Validity obj = data.get(rnd.nextInt(data.size()));
        return Validity.findValidity(obj.getUid());
    }
    
    public boolean ValidityDataOnDemand.modifyValidity(Validity obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ValidityDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.Validity.findValidityEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Validity' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.Validity>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.Validity obj = getNewTransientValidity(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
