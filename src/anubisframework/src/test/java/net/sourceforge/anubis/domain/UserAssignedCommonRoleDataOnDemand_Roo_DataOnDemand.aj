package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CommonRoleDataOnDemand;
import net.sourceforge.anubis.domain.UserAssignedCommonRole;
import net.sourceforge.anubis.domain.UserDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAssignedCommonRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserAssignedCommonRoleDataOnDemand: @Component;
    
    private Random UserAssignedCommonRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<UserAssignedCommonRole> UserAssignedCommonRoleDataOnDemand.data;
    
    @Autowired
    private CommonRoleDataOnDemand UserAssignedCommonRoleDataOnDemand.commonRoleDataOnDemand;
    
    @Autowired
    private UserDataOnDemand UserAssignedCommonRoleDataOnDemand.userDataOnDemand;
    
    public UserAssignedCommonRole UserAssignedCommonRoleDataOnDemand.getNewTransientUserAssignedCommonRole(int index) {
        net.sourceforge.anubis.domain.UserAssignedCommonRole obj = new net.sourceforge.anubis.domain.UserAssignedCommonRole();
        obj.setCommonRole(commonRoleDataOnDemand.getRandomCommonRole());
        obj.setUser(userDataOnDemand.getRandomUser());
        return obj;
    }
    
    public UserAssignedCommonRole UserAssignedCommonRoleDataOnDemand.getSpecificUserAssignedCommonRole(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        UserAssignedCommonRole obj = data.get(index);
        return UserAssignedCommonRole.findUserAssignedCommonRole(obj.getUid());
    }
    
    public UserAssignedCommonRole UserAssignedCommonRoleDataOnDemand.getRandomUserAssignedCommonRole() {
        init();
        UserAssignedCommonRole obj = data.get(rnd.nextInt(data.size()));
        return UserAssignedCommonRole.findUserAssignedCommonRole(obj.getUid());
    }
    
    public boolean UserAssignedCommonRoleDataOnDemand.modifyUserAssignedCommonRole(UserAssignedCommonRole obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void UserAssignedCommonRoleDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.UserAssignedCommonRole.findUserAssignedCommonRoleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'UserAssignedCommonRole' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.UserAssignedCommonRole>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.UserAssignedCommonRole obj = getNewTransientUserAssignedCommonRole(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
