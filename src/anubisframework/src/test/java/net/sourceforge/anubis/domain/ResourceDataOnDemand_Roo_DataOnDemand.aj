package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.Resource;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ResourceDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ResourceDataOnDemand: @Component;
    
    private Random ResourceDataOnDemand.rnd = new SecureRandom();
    
    private List<Resource> ResourceDataOnDemand.data;
    
    public Resource ResourceDataOnDemand.getNewTransientResource(int index) {
        net.sourceforge.anubis.domain.Resource obj = new net.sourceforge.anubis.domain.Resource();
        return obj;
    }
    
    public Resource ResourceDataOnDemand.getSpecificResource(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Resource obj = data.get(index);
        return Resource.findResource(obj.getUid());
    }
    
    public Resource ResourceDataOnDemand.getRandomResource() {
        init();
        Resource obj = data.get(rnd.nextInt(data.size()));
        return Resource.findResource(obj.getUid());
    }
    
    public boolean ResourceDataOnDemand.modifyResource(Resource obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ResourceDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.Resource.findResourceEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Resource' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.Resource>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.Resource obj = getNewTransientResource(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
