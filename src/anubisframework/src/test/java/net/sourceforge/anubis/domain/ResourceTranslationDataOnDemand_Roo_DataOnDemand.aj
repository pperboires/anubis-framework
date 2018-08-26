package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import net.sourceforge.anubis.domain.ResourceTranslation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ResourceTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ResourceTranslationDataOnDemand: @Component;
    
    private Random ResourceTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<ResourceTranslation> ResourceTranslationDataOnDemand.data;
    
    @Autowired
    private LocaleDataOnDemand ResourceTranslationDataOnDemand.localeDataOnDemand;
    
    public ResourceTranslation ResourceTranslationDataOnDemand.getNewTransientResourceTranslation(int index) {
        net.sourceforge.anubis.domain.ResourceTranslation obj = new net.sourceforge.anubis.domain.ResourceTranslation();
        obj.setLocale(localeDataOnDemand.getRandomLocale());
        return obj;
    }
    
    public ResourceTranslation ResourceTranslationDataOnDemand.getSpecificResourceTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ResourceTranslation obj = data.get(index);
        return ResourceTranslation.findResourceTranslation(obj.getUid());
    }
    
    public ResourceTranslation ResourceTranslationDataOnDemand.getRandomResourceTranslation() {
        init();
        ResourceTranslation obj = data.get(rnd.nextInt(data.size()));
        return ResourceTranslation.findResourceTranslation(obj.getUid());
    }
    
    public boolean ResourceTranslationDataOnDemand.modifyResourceTranslation(ResourceTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ResourceTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.ResourceTranslation.findResourceTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ResourceTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.ResourceTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.ResourceTranslation obj = getNewTransientResourceTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
