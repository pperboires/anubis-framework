package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.PermissionConflict;
import net.sourceforge.anubis.domain.PermissionDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionConflictDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PermissionConflictDataOnDemand: @Component;
    
    private Random PermissionConflictDataOnDemand.rnd = new SecureRandom();
    
    private List<PermissionConflict> PermissionConflictDataOnDemand.data;
    
    @Autowired
    private PermissionDataOnDemand PermissionConflictDataOnDemand.permissionDataOnDemand;
    
    public PermissionConflict PermissionConflictDataOnDemand.getNewTransientPermissionConflict(int index) {
        net.sourceforge.anubis.domain.PermissionConflict obj = new net.sourceforge.anubis.domain.PermissionConflict();
        obj.setPermission(permissionDataOnDemand.getRandomPermission());
        obj.setPermissionConflicted(permissionDataOnDemand.getRandomPermission());
        return obj;
    }
    
    public PermissionConflict PermissionConflictDataOnDemand.getSpecificPermissionConflict(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        PermissionConflict obj = data.get(index);
        return PermissionConflict.findPermissionConflict(obj.getUid());
    }
    
    public PermissionConflict PermissionConflictDataOnDemand.getRandomPermissionConflict() {
        init();
        PermissionConflict obj = data.get(rnd.nextInt(data.size()));
        return PermissionConflict.findPermissionConflict(obj.getUid());
    }
    
    public boolean PermissionConflictDataOnDemand.modifyPermissionConflict(PermissionConflict obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void PermissionConflictDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.PermissionConflict.findPermissionConflictEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'PermissionConflict' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.PermissionConflict>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.PermissionConflict obj = getNewTransientPermissionConflict(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
