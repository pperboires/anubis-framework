package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import net.sourceforge.anubis.domain.OperationTranslation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OperationTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OperationTranslationDataOnDemand: @Component;
    
    private Random OperationTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<OperationTranslation> OperationTranslationDataOnDemand.data;
    
    @Autowired
    private LocaleDataOnDemand OperationTranslationDataOnDemand.localeDataOnDemand;
    
    public OperationTranslation OperationTranslationDataOnDemand.getNewTransientOperationTranslation(int index) {
        net.sourceforge.anubis.domain.OperationTranslation obj = new net.sourceforge.anubis.domain.OperationTranslation();
        obj.setLocale(localeDataOnDemand.getRandomLocale());
        return obj;
    }
    
    public OperationTranslation OperationTranslationDataOnDemand.getSpecificOperationTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        OperationTranslation obj = data.get(index);
        return OperationTranslation.findOperationTranslation(obj.getUid());
    }
    
    public OperationTranslation OperationTranslationDataOnDemand.getRandomOperationTranslation() {
        init();
        OperationTranslation obj = data.get(rnd.nextInt(data.size()));
        return OperationTranslation.findOperationTranslation(obj.getUid());
    }
    
    public boolean OperationTranslationDataOnDemand.modifyOperationTranslation(OperationTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void OperationTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.OperationTranslation.findOperationTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'OperationTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.OperationTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.OperationTranslation obj = getNewTransientOperationTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
