package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ApplicationDataOnDemand;
import net.sourceforge.anubis.domain.CommonRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CommonRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CommonRoleDataOnDemand: @Component;
    
    private Random CommonRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<CommonRole> CommonRoleDataOnDemand.data;
    
    @Autowired
    private ApplicationDataOnDemand CommonRoleDataOnDemand.applicationDataOnDemand;
    
    public CommonRole CommonRoleDataOnDemand.getNewTransientCommonRole(int index) {
        net.sourceforge.anubis.domain.CommonRole obj = new net.sourceforge.anubis.domain.CommonRole();
        obj.setApplication(applicationDataOnDemand.getRandomApplication());
        obj.setEnabled(new Boolean(true));
        return obj;
    }
    
    public CommonRole CommonRoleDataOnDemand.getSpecificCommonRole(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        CommonRole obj = data.get(index);
        return CommonRole.findCommonRole(obj.getUid());
    }
    
    public CommonRole CommonRoleDataOnDemand.getRandomCommonRole() {
        init();
        CommonRole obj = data.get(rnd.nextInt(data.size()));
        return CommonRole.findCommonRole(obj.getUid());
    }
    
    public boolean CommonRoleDataOnDemand.modifyCommonRole(CommonRole obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CommonRoleDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.CommonRole.findCommonRoleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CommonRole' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.CommonRole>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.CommonRole obj = getNewTransientCommonRole(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
