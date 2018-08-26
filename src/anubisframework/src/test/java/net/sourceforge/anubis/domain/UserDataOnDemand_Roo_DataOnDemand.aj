package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import net.sourceforge.anubis.domain.User;
import net.sourceforge.anubis.domain.UserAccountDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserDataOnDemand: @Component;
    
    private Random UserDataOnDemand.rnd = new SecureRandom();
    
    private List<User> UserDataOnDemand.data;
    
    @Autowired
    private UserAccountDataOnDemand UserDataOnDemand.userAccountDataOnDemand;
    
    @Autowired
    private LocaleDataOnDemand UserDataOnDemand.localeDataOnDemand;
    
    public User UserDataOnDemand.getNewTransientUser(int index) {
        net.sourceforge.anubis.domain.User obj = new net.sourceforge.anubis.domain.User();
        obj.setAccount(userAccountDataOnDemand.getRandomUserAccount());
        obj.setName("name_" + index);
        obj.setPreferredLocale(localeDataOnDemand.getRandomLocale());
        return obj;
    }
    
    public User UserDataOnDemand.getSpecificUser(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        User obj = data.get(index);
        return User.findUser(obj.getUid());
    }
    
    public User UserDataOnDemand.getRandomUser() {
        init();
        User obj = data.get(rnd.nextInt(data.size()));
        return User.findUser(obj.getUid());
    }
    
    public boolean UserDataOnDemand.modifyUser(User obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void UserDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.User.findUserEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'User' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.User>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.User obj = getNewTransientUser(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
