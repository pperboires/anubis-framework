package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ContextDataOnDemand;
import net.sourceforge.anubis.domain.ContextValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContextValueDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ContextValueDataOnDemand: @Component;
    
    private Random ContextValueDataOnDemand.rnd = new SecureRandom();
    
    private List<ContextValue> ContextValueDataOnDemand.data;
    
    @Autowired
    private ContextDataOnDemand ContextValueDataOnDemand.contextDataOnDemand;
    
    public ContextValue ContextValueDataOnDemand.getNewTransientContextValue(int index) {
        net.sourceforge.anubis.domain.ContextValue obj = new net.sourceforge.anubis.domain.ContextValue();
        obj.setContext(contextDataOnDemand.getRandomContext());
        obj.setId("id_" + index);
        return obj;
    }
    
    public ContextValue ContextValueDataOnDemand.getSpecificContextValue(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ContextValue obj = data.get(index);
        return ContextValue.findContextValue(obj.getUid());
    }
    
    public ContextValue ContextValueDataOnDemand.getRandomContextValue() {
        init();
        ContextValue obj = data.get(rnd.nextInt(data.size()));
        return ContextValue.findContextValue(obj.getUid());
    }
    
    public boolean ContextValueDataOnDemand.modifyContextValue(ContextValue obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ContextValueDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.ContextValue.findContextValueEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ContextValue' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.ContextValue>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.ContextValue obj = getNewTransientContextValue(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
