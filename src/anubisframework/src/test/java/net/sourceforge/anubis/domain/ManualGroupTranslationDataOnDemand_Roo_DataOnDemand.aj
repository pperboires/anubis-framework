package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import net.sourceforge.anubis.domain.ManualGroupDataOnDemand;
import net.sourceforge.anubis.domain.ManualGroupTranslation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ManualGroupTranslationDataOnDemand: @Component;
    
    private Random ManualGroupTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<ManualGroupTranslation> ManualGroupTranslationDataOnDemand.data;
    
    @Autowired
    private LocaleDataOnDemand ManualGroupTranslationDataOnDemand.localeDataOnDemand;
    
    @Autowired
    private ManualGroupDataOnDemand ManualGroupTranslationDataOnDemand.manualGroupDataOnDemand;
    
    public ManualGroupTranslation ManualGroupTranslationDataOnDemand.getNewTransientManualGroupTranslation(int index) {
        net.sourceforge.anubis.domain.ManualGroupTranslation obj = new net.sourceforge.anubis.domain.ManualGroupTranslation();
        obj.setLocale(localeDataOnDemand.getRandomLocale());
        obj.setManualGroup(manualGroupDataOnDemand.getRandomManualGroup());
        obj.setName("name_" + index);
        return obj;
    }
    
    public ManualGroupTranslation ManualGroupTranslationDataOnDemand.getSpecificManualGroupTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ManualGroupTranslation obj = data.get(index);
        return ManualGroupTranslation.findManualGroupTranslation(obj.getUid());
    }
    
    public ManualGroupTranslation ManualGroupTranslationDataOnDemand.getRandomManualGroupTranslation() {
        init();
        ManualGroupTranslation obj = data.get(rnd.nextInt(data.size()));
        return ManualGroupTranslation.findManualGroupTranslation(obj.getUid());
    }
    
    public boolean ManualGroupTranslationDataOnDemand.modifyManualGroupTranslation(ManualGroupTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ManualGroupTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.ManualGroupTranslation.findManualGroupTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ManualGroupTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.ManualGroupTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.ManualGroupTranslation obj = getNewTransientManualGroupTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
