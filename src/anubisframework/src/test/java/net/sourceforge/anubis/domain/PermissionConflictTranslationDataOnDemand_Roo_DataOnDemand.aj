package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.PermissionConflictDataOnDemand;
import net.sourceforge.anubis.domain.PermissionConflictTranslation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionConflictTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PermissionConflictTranslationDataOnDemand: @Component;
    
    private Random PermissionConflictTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<PermissionConflictTranslation> PermissionConflictTranslationDataOnDemand.data;
    
    @Autowired
    private PermissionConflictDataOnDemand PermissionConflictTranslationDataOnDemand.permissionConflictDataOnDemand;
    
    public PermissionConflictTranslation PermissionConflictTranslationDataOnDemand.getNewTransientPermissionConflictTranslation(int index) {
        net.sourceforge.anubis.domain.PermissionConflictTranslation obj = new net.sourceforge.anubis.domain.PermissionConflictTranslation();
        obj.setName("name_" + index);
        obj.setPermissionConflict(permissionConflictDataOnDemand.getRandomPermissionConflict());
        return obj;
    }
    
    public PermissionConflictTranslation PermissionConflictTranslationDataOnDemand.getSpecificPermissionConflictTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        PermissionConflictTranslation obj = data.get(index);
        return PermissionConflictTranslation.findPermissionConflictTranslation(obj.getUid());
    }
    
    public PermissionConflictTranslation PermissionConflictTranslationDataOnDemand.getRandomPermissionConflictTranslation() {
        init();
        PermissionConflictTranslation obj = data.get(rnd.nextInt(data.size()));
        return PermissionConflictTranslation.findPermissionConflictTranslation(obj.getUid());
    }
    
    public boolean PermissionConflictTranslationDataOnDemand.modifyPermissionConflictTranslation(PermissionConflictTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void PermissionConflictTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.PermissionConflictTranslation.findPermissionConflictTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'PermissionConflictTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.PermissionConflictTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.PermissionConflictTranslation obj = getNewTransientPermissionConflictTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
