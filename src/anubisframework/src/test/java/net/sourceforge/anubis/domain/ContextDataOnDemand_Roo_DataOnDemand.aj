package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ApplicationDataOnDemand;
import net.sourceforge.anubis.domain.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContextDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ContextDataOnDemand: @Component;
    
    private Random ContextDataOnDemand.rnd = new SecureRandom();
    
    private List<Context> ContextDataOnDemand.data;
    
    @Autowired
    private ApplicationDataOnDemand ContextDataOnDemand.applicationDataOnDemand;
    
    public Context ContextDataOnDemand.getNewTransientContext(int index) {
        net.sourceforge.anubis.domain.Context obj = new net.sourceforge.anubis.domain.Context();
        obj.setApplication(applicationDataOnDemand.getRandomApplication());
        obj.setId("id_" + index);
        return obj;
    }
    
    public Context ContextDataOnDemand.getSpecificContext(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Context obj = data.get(index);
        return Context.findContext(obj.getUid());
    }
    
    public Context ContextDataOnDemand.getRandomContext() {
        init();
        Context obj = data.get(rnd.nextInt(data.size()));
        return Context.findContext(obj.getUid());
    }
    
    public boolean ContextDataOnDemand.modifyContext(Context obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ContextDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.Context.findContextEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Context' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.Context>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.Context obj = getNewTransientContext(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
