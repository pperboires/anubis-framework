package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.Locale;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LocaleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LocaleDataOnDemand: @Component;
    
    private Random LocaleDataOnDemand.rnd = new SecureRandom();
    
    private List<Locale> LocaleDataOnDemand.data;
    
    public Locale LocaleDataOnDemand.getNewTransientLocale(int index) {
        net.sourceforge.anubis.domain.Locale obj = new net.sourceforge.anubis.domain.Locale();
        obj.setCode("code_" + index);
        obj.setName("name_" + index);
        return obj;
    }
    
    public Locale LocaleDataOnDemand.getSpecificLocale(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Locale obj = data.get(index);
        return Locale.findLocale(obj.getUid());
    }
    
    public Locale LocaleDataOnDemand.getRandomLocale() {
        init();
        Locale obj = data.get(rnd.nextInt(data.size()));
        return Locale.findLocale(obj.getUid());
    }
    
    public boolean LocaleDataOnDemand.modifyLocale(Locale obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void LocaleDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.Locale.findLocaleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Locale' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.Locale>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.Locale obj = getNewTransientLocale(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
