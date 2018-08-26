package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ManualGroupDataOnDemand;
import net.sourceforge.anubis.domain.UserDataOnDemand;
import net.sourceforge.anubis.domain.UserManualGroupMembership;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserManualGroupMembershipDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserManualGroupMembershipDataOnDemand: @Component;
    
    private Random UserManualGroupMembershipDataOnDemand.rnd = new SecureRandom();
    
    private List<UserManualGroupMembership> UserManualGroupMembershipDataOnDemand.data;
    
    @Autowired
    private ManualGroupDataOnDemand UserManualGroupMembershipDataOnDemand.manualGroupDataOnDemand;
    
    @Autowired
    private UserDataOnDemand UserManualGroupMembershipDataOnDemand.userDataOnDemand;
    
    public UserManualGroupMembership UserManualGroupMembershipDataOnDemand.getNewTransientUserManualGroupMembership(int index) {
        net.sourceforge.anubis.domain.UserManualGroupMembership obj = new net.sourceforge.anubis.domain.UserManualGroupMembership();
        obj.setManualGroup(manualGroupDataOnDemand.getRandomManualGroup());
        obj.setUser(userDataOnDemand.getRandomUser());
        return obj;
    }
    
    public UserManualGroupMembership UserManualGroupMembershipDataOnDemand.getSpecificUserManualGroupMembership(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        UserManualGroupMembership obj = data.get(index);
        return UserManualGroupMembership.findUserManualGroupMembership(obj.getUid());
    }
    
    public UserManualGroupMembership UserManualGroupMembershipDataOnDemand.getRandomUserManualGroupMembership() {
        init();
        UserManualGroupMembership obj = data.get(rnd.nextInt(data.size()));
        return UserManualGroupMembership.findUserManualGroupMembership(obj.getUid());
    }
    
    public boolean UserManualGroupMembershipDataOnDemand.modifyUserManualGroupMembership(UserManualGroupMembership obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void UserManualGroupMembershipDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.UserManualGroupMembership.findUserManualGroupMembershipEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'UserManualGroupMembership' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.UserManualGroupMembership>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.UserManualGroupMembership obj = getNewTransientUserManualGroupMembership(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
