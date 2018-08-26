package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole;
import net.sourceforge.anubis.domain.UserDataOnDemand;
import net.sourceforge.anubis.domain.ValidityDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAssignedSecurityAdministrativeRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserAssignedSecurityAdministrativeRoleDataOnDemand: @Component;
    
    private Random UserAssignedSecurityAdministrativeRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<UserAssignedSecurityAdministrativeRole> UserAssignedSecurityAdministrativeRoleDataOnDemand.data;
    
    @Autowired
    private UserDataOnDemand UserAssignedSecurityAdministrativeRoleDataOnDemand.userDataOnDemand;
    
    @Autowired
    private ValidityDataOnDemand UserAssignedSecurityAdministrativeRoleDataOnDemand.validityDataOnDemand;
    
    public UserAssignedSecurityAdministrativeRole UserAssignedSecurityAdministrativeRoleDataOnDemand.getNewTransientUserAssignedSecurityAdministrativeRole(int index) {
        net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole obj = new net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole();
        obj.setUser(userDataOnDemand.getRandomUser());
        obj.setValidity(validityDataOnDemand.getRandomValidity());
        return obj;
    }
    
    public UserAssignedSecurityAdministrativeRole UserAssignedSecurityAdministrativeRoleDataOnDemand.getSpecificUserAssignedSecurityAdministrativeRole(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        UserAssignedSecurityAdministrativeRole obj = data.get(index);
        return UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRole(obj.getUid());
    }
    
    public UserAssignedSecurityAdministrativeRole UserAssignedSecurityAdministrativeRoleDataOnDemand.getRandomUserAssignedSecurityAdministrativeRole() {
        init();
        UserAssignedSecurityAdministrativeRole obj = data.get(rnd.nextInt(data.size()));
        return UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRole(obj.getUid());
    }
    
    public boolean UserAssignedSecurityAdministrativeRoleDataOnDemand.modifyUserAssignedSecurityAdministrativeRole(UserAssignedSecurityAdministrativeRole obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void UserAssignedSecurityAdministrativeRoleDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRoleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'UserAssignedSecurityAdministrativeRole' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole obj = getNewTransientUserAssignedSecurityAdministrativeRole(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
