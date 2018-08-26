package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ContextDataOnDemand;
import net.sourceforge.anubis.domain.PermissionContext;
import net.sourceforge.anubis.domain.PermissionDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionContextDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PermissionContextDataOnDemand: @Component;
    
    private Random PermissionContextDataOnDemand.rnd = new SecureRandom();
    
    private List<PermissionContext> PermissionContextDataOnDemand.data;
    
    @Autowired
    private ContextDataOnDemand PermissionContextDataOnDemand.contextDataOnDemand;
    
    @Autowired
    private PermissionDataOnDemand PermissionContextDataOnDemand.permissionDataOnDemand;
    
    public PermissionContext PermissionContextDataOnDemand.getNewTransientPermissionContext(int index) {
        net.sourceforge.anubis.domain.PermissionContext obj = new net.sourceforge.anubis.domain.PermissionContext();
        obj.setContext(contextDataOnDemand.getRandomContext());
        obj.setPermission(permissionDataOnDemand.getRandomPermission());
        return obj;
    }
    
    public PermissionContext PermissionContextDataOnDemand.getSpecificPermissionContext(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        PermissionContext obj = data.get(index);
        return PermissionContext.findPermissionContext(obj.getUid());
    }
    
    public PermissionContext PermissionContextDataOnDemand.getRandomPermissionContext() {
        init();
        PermissionContext obj = data.get(rnd.nextInt(data.size()));
        return PermissionContext.findPermissionContext(obj.getUid());
    }
    
    public boolean PermissionContextDataOnDemand.modifyPermissionContext(PermissionContext obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void PermissionContextDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.PermissionContext.findPermissionContextEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'PermissionContext' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.PermissionContext>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.PermissionContext obj = getNewTransientPermissionContext(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
