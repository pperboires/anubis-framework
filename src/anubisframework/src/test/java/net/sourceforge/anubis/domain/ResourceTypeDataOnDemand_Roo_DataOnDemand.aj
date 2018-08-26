package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ResourceType;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ResourceTypeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ResourceTypeDataOnDemand: @Component;
    
    private Random ResourceTypeDataOnDemand.rnd = new SecureRandom();
    
    private List<ResourceType> ResourceTypeDataOnDemand.data;
    
    public ResourceType ResourceTypeDataOnDemand.getNewTransientResourceType(int index) {
        net.sourceforge.anubis.domain.ResourceType obj = new net.sourceforge.anubis.domain.ResourceType();
        obj.setId("id_" + index);
        return obj;
    }
    
    public ResourceType ResourceTypeDataOnDemand.getSpecificResourceType(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ResourceType obj = data.get(index);
        return ResourceType.findResourceType(obj.getUid());
    }
    
    public ResourceType ResourceTypeDataOnDemand.getRandomResourceType() {
        init();
        ResourceType obj = data.get(rnd.nextInt(data.size()));
        return ResourceType.findResourceType(obj.getUid());
    }
    
    public boolean ResourceTypeDataOnDemand.modifyResourceType(ResourceType obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ResourceTypeDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.ResourceType.findResourceTypeEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ResourceType' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.ResourceType>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.ResourceType obj = getNewTransientResourceType(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
