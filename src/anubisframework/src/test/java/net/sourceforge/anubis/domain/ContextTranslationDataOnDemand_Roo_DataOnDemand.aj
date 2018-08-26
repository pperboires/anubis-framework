package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ContextDataOnDemand;
import net.sourceforge.anubis.domain.ContextTranslation;
import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContextTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ContextTranslationDataOnDemand: @Component;
    
    private Random ContextTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<ContextTranslation> ContextTranslationDataOnDemand.data;
    
    @Autowired
    private ContextDataOnDemand ContextTranslationDataOnDemand.contextDataOnDemand;
    
    @Autowired
    private LocaleDataOnDemand ContextTranslationDataOnDemand.localeDataOnDemand;
    
    public ContextTranslation ContextTranslationDataOnDemand.getNewTransientContextTranslation(int index) {
        net.sourceforge.anubis.domain.ContextTranslation obj = new net.sourceforge.anubis.domain.ContextTranslation();
        obj.setContext(contextDataOnDemand.getRandomContext());
        obj.setLocale(localeDataOnDemand.getRandomLocale());
        obj.setName("name_" + index);
        return obj;
    }
    
    public ContextTranslation ContextTranslationDataOnDemand.getSpecificContextTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ContextTranslation obj = data.get(index);
        return ContextTranslation.findContextTranslation(obj.getUid());
    }
    
    public ContextTranslation ContextTranslationDataOnDemand.getRandomContextTranslation() {
        init();
        ContextTranslation obj = data.get(rnd.nextInt(data.size()));
        return ContextTranslation.findContextTranslation(obj.getUid());
    }
    
    public boolean ContextTranslationDataOnDemand.modifyContextTranslation(ContextTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ContextTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.ContextTranslation.findContextTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ContextTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.ContextTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.ContextTranslation obj = getNewTransientContextTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
