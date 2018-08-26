package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ContextValueDataOnDemand;
import net.sourceforge.anubis.domain.ContextValueTranslation;
import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContextValueTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ContextValueTranslationDataOnDemand: @Component;
    
    private Random ContextValueTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<ContextValueTranslation> ContextValueTranslationDataOnDemand.data;
    
    @Autowired
    private ContextValueDataOnDemand ContextValueTranslationDataOnDemand.contextValueDataOnDemand;
    
    @Autowired
    private LocaleDataOnDemand ContextValueTranslationDataOnDemand.localeDataOnDemand;
    
    public ContextValueTranslation ContextValueTranslationDataOnDemand.getNewTransientContextValueTranslation(int index) {
        net.sourceforge.anubis.domain.ContextValueTranslation obj = new net.sourceforge.anubis.domain.ContextValueTranslation();
        obj.setContextValue(contextValueDataOnDemand.getRandomContextValue());
        obj.setLocale(localeDataOnDemand.getRandomLocale());
        obj.setName("name_" + index);
        return obj;
    }
    
    public ContextValueTranslation ContextValueTranslationDataOnDemand.getSpecificContextValueTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ContextValueTranslation obj = data.get(index);
        return ContextValueTranslation.findContextValueTranslation(obj.getUid());
    }
    
    public ContextValueTranslation ContextValueTranslationDataOnDemand.getRandomContextValueTranslation() {
        init();
        ContextValueTranslation obj = data.get(rnd.nextInt(data.size()));
        return ContextValueTranslation.findContextValueTranslation(obj.getUid());
    }
    
    public boolean ContextValueTranslationDataOnDemand.modifyContextValueTranslation(ContextValueTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ContextValueTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.ContextValueTranslation.findContextValueTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ContextValueTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.ContextValueTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.ContextValueTranslation obj = getNewTransientContextValueTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
