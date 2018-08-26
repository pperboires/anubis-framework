package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.UserAccount;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAccountDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserAccountDataOnDemand: @Component;
    
    private Random UserAccountDataOnDemand.rnd = new SecureRandom();
    
    private List<UserAccount> UserAccountDataOnDemand.data;
    
    public UserAccount UserAccountDataOnDemand.getNewTransientUserAccount(int index) {
        net.sourceforge.anubis.domain.UserAccount obj = new net.sourceforge.anubis.domain.UserAccount();
        obj.setEmail("email_" + index);
        return obj;
    }
    
    public UserAccount UserAccountDataOnDemand.getSpecificUserAccount(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        UserAccount obj = data.get(index);
        return UserAccount.findUserAccount(obj.getUid());
    }
    
    public UserAccount UserAccountDataOnDemand.getRandomUserAccount() {
        init();
        UserAccount obj = data.get(rnd.nextInt(data.size()));
        return UserAccount.findUserAccount(obj.getUid());
    }
    
    public boolean UserAccountDataOnDemand.modifyUserAccount(UserAccount obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void UserAccountDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.UserAccount.findUserAccountEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'UserAccount' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.UserAccount>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.UserAccount obj = getNewTransientUserAccount(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
