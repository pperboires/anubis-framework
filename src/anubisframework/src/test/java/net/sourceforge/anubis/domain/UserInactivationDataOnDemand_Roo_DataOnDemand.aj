package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.InactivationDataOnDemand;
import net.sourceforge.anubis.domain.UserDataOnDemand;
import net.sourceforge.anubis.domain.UserInactivation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserInactivationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserInactivationDataOnDemand: @Component;
    
    private Random UserInactivationDataOnDemand.rnd = new SecureRandom();
    
    private List<UserInactivation> UserInactivationDataOnDemand.data;
    
    @Autowired
    private InactivationDataOnDemand UserInactivationDataOnDemand.inactivationDataOnDemand;
    
    @Autowired
    private UserDataOnDemand UserInactivationDataOnDemand.userDataOnDemand;
    
    public UserInactivation UserInactivationDataOnDemand.getNewTransientUserInactivation(int index) {
        net.sourceforge.anubis.domain.UserInactivation obj = new net.sourceforge.anubis.domain.UserInactivation();
        obj.setInactivation(inactivationDataOnDemand.getRandomInactivation());
        obj.setUser(userDataOnDemand.getRandomUser());
        return obj;
    }
    
    public UserInactivation UserInactivationDataOnDemand.getSpecificUserInactivation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        UserInactivation obj = data.get(index);
        return UserInactivation.findUserInactivation(obj.getUid());
    }
    
    public UserInactivation UserInactivationDataOnDemand.getRandomUserInactivation() {
        init();
        UserInactivation obj = data.get(rnd.nextInt(data.size()));
        return UserInactivation.findUserInactivation(obj.getUid());
    }
    
    public boolean UserInactivationDataOnDemand.modifyUserInactivation(UserInactivation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void UserInactivationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.UserInactivation.findUserInactivationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'UserInactivation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.UserInactivation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.UserInactivation obj = getNewTransientUserInactivation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
