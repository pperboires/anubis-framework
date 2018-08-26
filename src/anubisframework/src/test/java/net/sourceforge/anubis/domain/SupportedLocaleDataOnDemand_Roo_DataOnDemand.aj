package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ApplicationDataOnDemand;
import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import net.sourceforge.anubis.domain.SupportedLocale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SupportedLocaleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SupportedLocaleDataOnDemand: @Component;
    
    private Random SupportedLocaleDataOnDemand.rnd = new SecureRandom();
    
    private List<SupportedLocale> SupportedLocaleDataOnDemand.data;
    
    @Autowired
    private ApplicationDataOnDemand SupportedLocaleDataOnDemand.applicationDataOnDemand;
    
    @Autowired
    private LocaleDataOnDemand SupportedLocaleDataOnDemand.localeDataOnDemand;
    
    public SupportedLocale SupportedLocaleDataOnDemand.getNewTransientSupportedLocale(int index) {
        net.sourceforge.anubis.domain.SupportedLocale obj = new net.sourceforge.anubis.domain.SupportedLocale();
        obj.setApplication(applicationDataOnDemand.getRandomApplication());
        obj.setLocale(localeDataOnDemand.getRandomLocale());
        obj.setPreference(new Integer(index));
        return obj;
    }
    
    public SupportedLocale SupportedLocaleDataOnDemand.getSpecificSupportedLocale(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        SupportedLocale obj = data.get(index);
        return SupportedLocale.findSupportedLocale(obj.getUid());
    }
    
    public SupportedLocale SupportedLocaleDataOnDemand.getRandomSupportedLocale() {
        init();
        SupportedLocale obj = data.get(rnd.nextInt(data.size()));
        return SupportedLocale.findSupportedLocale(obj.getUid());
    }
    
    public boolean SupportedLocaleDataOnDemand.modifySupportedLocale(SupportedLocale obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void SupportedLocaleDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.SupportedLocale.findSupportedLocaleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'SupportedLocale' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.SupportedLocale>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.SupportedLocale obj = getNewTransientSupportedLocale(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
