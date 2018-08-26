package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.Permission;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PermissionDataOnDemand: @Component;
    
    private Random PermissionDataOnDemand.rnd = new SecureRandom();
    
    private List<Permission> PermissionDataOnDemand.data;
    
    public Permission PermissionDataOnDemand.getNewTransientPermission(int index) {
        net.sourceforge.anubis.domain.Permission obj = new net.sourceforge.anubis.domain.Permission();
        return obj;
    }
    
    public Permission PermissionDataOnDemand.getSpecificPermission(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Permission obj = data.get(index);
        return Permission.findPermission(obj.getUid());
    }
    
    public Permission PermissionDataOnDemand.getRandomPermission() {
        init();
        Permission obj = data.get(rnd.nextInt(data.size()));
        return Permission.findPermission(obj.getUid());
    }
    
    public boolean PermissionDataOnDemand.modifyPermission(Permission obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void PermissionDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.Permission.findPermissionEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Permission' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.Permission>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.Permission obj = getNewTransientPermission(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
