package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ResourceTypeTranslation;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ResourceTypeTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ResourceTypeTranslationDataOnDemand: @Component;
    
    private Random ResourceTypeTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<ResourceTypeTranslation> ResourceTypeTranslationDataOnDemand.data;
    
    public ResourceTypeTranslation ResourceTypeTranslationDataOnDemand.getNewTransientResourceTypeTranslation(int index) {
        net.sourceforge.anubis.domain.ResourceTypeTranslation obj = new net.sourceforge.anubis.domain.ResourceTypeTranslation();
        obj.setName("name_" + index);
        return obj;
    }
    
    public ResourceTypeTranslation ResourceTypeTranslationDataOnDemand.getSpecificResourceTypeTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ResourceTypeTranslation obj = data.get(index);
        return ResourceTypeTranslation.findResourceTypeTranslation(obj.getUid());
    }
    
    public ResourceTypeTranslation ResourceTypeTranslationDataOnDemand.getRandomResourceTypeTranslation() {
        init();
        ResourceTypeTranslation obj = data.get(rnd.nextInt(data.size()));
        return ResourceTypeTranslation.findResourceTypeTranslation(obj.getUid());
    }
    
    public boolean ResourceTypeTranslationDataOnDemand.modifyResourceTypeTranslation(ResourceTypeTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ResourceTypeTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.ResourceTypeTranslation.findResourceTypeTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ResourceTypeTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.ResourceTypeTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.ResourceTypeTranslation obj = getNewTransientResourceTypeTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
