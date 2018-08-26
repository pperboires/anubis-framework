package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.ApplicationAccountDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ApplicationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ApplicationDataOnDemand: @Component;
    
    private Random ApplicationDataOnDemand.rnd = new SecureRandom();
    
    private List<Application> ApplicationDataOnDemand.data;
    
    @Autowired
    private ApplicationAccountDataOnDemand ApplicationDataOnDemand.applicationAccountDataOnDemand;
    
    public Application ApplicationDataOnDemand.getNewTransientApplication(int index) {
        net.sourceforge.anubis.domain.Application obj = new net.sourceforge.anubis.domain.Application();
        obj.setAccount(applicationAccountDataOnDemand.getRandomApplicationAccount());
        obj.setId("id_" + index);
        obj.setName("name_" + index);
        return obj;
    }
    
    public Application ApplicationDataOnDemand.getSpecificApplication(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Application obj = data.get(index);
        return Application.findApplication(obj.getUid());
    }
    
    public Application ApplicationDataOnDemand.getRandomApplication() {
        init();
        Application obj = data.get(rnd.nextInt(data.size()));
        return Application.findApplication(obj.getUid());
    }
    
    public boolean ApplicationDataOnDemand.modifyApplication(Application obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ApplicationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.Application.findApplicationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Application' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.Application>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.Application obj = getNewTransientApplication(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
