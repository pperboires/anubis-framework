package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.AdministrativeRoleDataOnDemand;
import net.sourceforge.anubis.domain.UserAssignedAdministrativeRole;
import net.sourceforge.anubis.domain.UserDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAssignedAdministrativeRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserAssignedAdministrativeRoleDataOnDemand: @Component;
    
    private Random UserAssignedAdministrativeRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<UserAssignedAdministrativeRole> UserAssignedAdministrativeRoleDataOnDemand.data;
    
    @Autowired
    private AdministrativeRoleDataOnDemand UserAssignedAdministrativeRoleDataOnDemand.administrativeRoleDataOnDemand;
    
    @Autowired
    private UserDataOnDemand UserAssignedAdministrativeRoleDataOnDemand.userDataOnDemand;
    
    public UserAssignedAdministrativeRole UserAssignedAdministrativeRoleDataOnDemand.getNewTransientUserAssignedAdministrativeRole(int index) {
        net.sourceforge.anubis.domain.UserAssignedAdministrativeRole obj = new net.sourceforge.anubis.domain.UserAssignedAdministrativeRole();
        obj.setAdministrativeRole(administrativeRoleDataOnDemand.getRandomAdministrativeRole());
        obj.setUser(userDataOnDemand.getRandomUser());
        return obj;
    }
    
    public UserAssignedAdministrativeRole UserAssignedAdministrativeRoleDataOnDemand.getSpecificUserAssignedAdministrativeRole(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        UserAssignedAdministrativeRole obj = data.get(index);
        return UserAssignedAdministrativeRole.findUserAssignedAdministrativeRole(obj.getUid());
    }
    
    public UserAssignedAdministrativeRole UserAssignedAdministrativeRoleDataOnDemand.getRandomUserAssignedAdministrativeRole() {
        init();
        UserAssignedAdministrativeRole obj = data.get(rnd.nextInt(data.size()));
        return UserAssignedAdministrativeRole.findUserAssignedAdministrativeRole(obj.getUid());
    }
    
    public boolean UserAssignedAdministrativeRoleDataOnDemand.modifyUserAssignedAdministrativeRole(UserAssignedAdministrativeRole obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void UserAssignedAdministrativeRoleDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.UserAssignedAdministrativeRole.findUserAssignedAdministrativeRoleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'UserAssignedAdministrativeRole' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.UserAssignedAdministrativeRole>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.UserAssignedAdministrativeRole obj = getNewTransientUserAssignedAdministrativeRole(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
