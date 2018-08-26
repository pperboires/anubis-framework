package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CommonRoleDataOnDemand;
import net.sourceforge.anubis.domain.CommonRoleTranslation;
import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CommonRoleTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CommonRoleTranslationDataOnDemand: @Component;
    
    private Random CommonRoleTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<CommonRoleTranslation> CommonRoleTranslationDataOnDemand.data;
    
    @Autowired
    private CommonRoleDataOnDemand CommonRoleTranslationDataOnDemand.commonRoleDataOnDemand;
    
    @Autowired
    private LocaleDataOnDemand CommonRoleTranslationDataOnDemand.localeDataOnDemand;
    
    public CommonRoleTranslation CommonRoleTranslationDataOnDemand.getNewTransientCommonRoleTranslation(int index) {
        net.sourceforge.anubis.domain.CommonRoleTranslation obj = new net.sourceforge.anubis.domain.CommonRoleTranslation();
        obj.setCommonRole(commonRoleDataOnDemand.getRandomCommonRole());
        obj.setLocale(localeDataOnDemand.getRandomLocale());
        obj.setName("name_" + index);
        return obj;
    }
    
    public CommonRoleTranslation CommonRoleTranslationDataOnDemand.getSpecificCommonRoleTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        CommonRoleTranslation obj = data.get(index);
        return CommonRoleTranslation.findCommonRoleTranslation(obj.getUid());
    }
    
    public CommonRoleTranslation CommonRoleTranslationDataOnDemand.getRandomCommonRoleTranslation() {
        init();
        CommonRoleTranslation obj = data.get(rnd.nextInt(data.size()));
        return CommonRoleTranslation.findCommonRoleTranslation(obj.getUid());
    }
    
    public boolean CommonRoleTranslationDataOnDemand.modifyCommonRoleTranslation(CommonRoleTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CommonRoleTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.CommonRoleTranslation.findCommonRoleTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CommonRoleTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.CommonRoleTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.CommonRoleTranslation obj = getNewTransientCommonRoleTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
