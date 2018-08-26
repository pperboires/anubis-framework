package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.AdministrativeRoleDataOnDemand;
import net.sourceforge.anubis.domain.AdministrativeRoleTranslation;
import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AdministrativeRoleTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AdministrativeRoleTranslationDataOnDemand: @Component;
    
    private Random AdministrativeRoleTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<AdministrativeRoleTranslation> AdministrativeRoleTranslationDataOnDemand.data;
    
    @Autowired
    private AdministrativeRoleDataOnDemand AdministrativeRoleTranslationDataOnDemand.administrativeRoleDataOnDemand;
    
    @Autowired
    private LocaleDataOnDemand AdministrativeRoleTranslationDataOnDemand.localeDataOnDemand;
    
    public AdministrativeRoleTranslation AdministrativeRoleTranslationDataOnDemand.getNewTransientAdministrativeRoleTranslation(int index) {
        net.sourceforge.anubis.domain.AdministrativeRoleTranslation obj = new net.sourceforge.anubis.domain.AdministrativeRoleTranslation();
        obj.setAdministrativeRole(administrativeRoleDataOnDemand.getRandomAdministrativeRole());
        obj.setLocale(localeDataOnDemand.getRandomLocale());
        obj.setName("name_" + index);
        return obj;
    }
    
    public AdministrativeRoleTranslation AdministrativeRoleTranslationDataOnDemand.getSpecificAdministrativeRoleTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        AdministrativeRoleTranslation obj = data.get(index);
        return AdministrativeRoleTranslation.findAdministrativeRoleTranslation(obj.getUid());
    }
    
    public AdministrativeRoleTranslation AdministrativeRoleTranslationDataOnDemand.getRandomAdministrativeRoleTranslation() {
        init();
        AdministrativeRoleTranslation obj = data.get(rnd.nextInt(data.size()));
        return AdministrativeRoleTranslation.findAdministrativeRoleTranslation(obj.getUid());
    }
    
    public boolean AdministrativeRoleTranslationDataOnDemand.modifyAdministrativeRoleTranslation(AdministrativeRoleTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void AdministrativeRoleTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.AdministrativeRoleTranslation.findAdministrativeRoleTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'AdministrativeRoleTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.AdministrativeRoleTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.AdministrativeRoleTranslation obj = getNewTransientAdministrativeRoleTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
