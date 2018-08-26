package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.AdministrativeRole;
import net.sourceforge.anubis.domain.ApplicationDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AdministrativeRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AdministrativeRoleDataOnDemand: @Component;
    
    private Random AdministrativeRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<AdministrativeRole> AdministrativeRoleDataOnDemand.data;
    
    @Autowired
    private ApplicationDataOnDemand AdministrativeRoleDataOnDemand.applicationDataOnDemand;
    
    public AdministrativeRole AdministrativeRoleDataOnDemand.getNewTransientAdministrativeRole(int index) {
        net.sourceforge.anubis.domain.AdministrativeRole obj = new net.sourceforge.anubis.domain.AdministrativeRole();
        obj.setApplication(applicationDataOnDemand.getRandomApplication());
        obj.setEnabled(new Boolean(true));
        obj.setId("id_" + index);
        return obj;
    }
    
    public AdministrativeRole AdministrativeRoleDataOnDemand.getSpecificAdministrativeRole(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        AdministrativeRole obj = data.get(index);
        return AdministrativeRole.findAdministrativeRole(obj.getUid());
    }
    
    public AdministrativeRole AdministrativeRoleDataOnDemand.getRandomAdministrativeRole() {
        init();
        AdministrativeRole obj = data.get(rnd.nextInt(data.size()));
        return AdministrativeRole.findAdministrativeRole(obj.getUid());
    }
    
    public boolean AdministrativeRoleDataOnDemand.modifyAdministrativeRole(AdministrativeRole obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void AdministrativeRoleDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.AdministrativeRole.findAdministrativeRoleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'AdministrativeRole' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.AdministrativeRole>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.AdministrativeRole obj = getNewTransientAdministrativeRole(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
