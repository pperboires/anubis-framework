package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ApplicationAccount;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ApplicationAccountDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ApplicationAccountDataOnDemand: @Component;
    
    private Random ApplicationAccountDataOnDemand.rnd = new SecureRandom();
    
    private List<ApplicationAccount> ApplicationAccountDataOnDemand.data;
    
    public ApplicationAccount ApplicationAccountDataOnDemand.getNewTransientApplicationAccount(int index) {
        net.sourceforge.anubis.domain.ApplicationAccount obj = new net.sourceforge.anubis.domain.ApplicationAccount();
        obj.setEnabled(new Boolean(true));
        obj.setPassword("password_" + index);
        return obj;
    }
    
    public ApplicationAccount ApplicationAccountDataOnDemand.getSpecificApplicationAccount(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ApplicationAccount obj = data.get(index);
        return ApplicationAccount.findApplicationAccount(obj.getUid());
    }
    
    public ApplicationAccount ApplicationAccountDataOnDemand.getRandomApplicationAccount() {
        init();
        ApplicationAccount obj = data.get(rnd.nextInt(data.size()));
        return ApplicationAccount.findApplicationAccount(obj.getUid());
    }
    
    public boolean ApplicationAccountDataOnDemand.modifyApplicationAccount(ApplicationAccount obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ApplicationAccountDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.ApplicationAccount.findApplicationAccountEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ApplicationAccount' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.ApplicationAccount>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.ApplicationAccount obj = getNewTransientApplicationAccount(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
