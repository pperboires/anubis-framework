package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CharacteristicValueDataOnDemand;
import net.sourceforge.anubis.domain.CharacteristicValueTranslation;
import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacteristicValueTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CharacteristicValueTranslationDataOnDemand: @Component;
    
    private Random CharacteristicValueTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<CharacteristicValueTranslation> CharacteristicValueTranslationDataOnDemand.data;
    
    @Autowired
    private CharacteristicValueDataOnDemand CharacteristicValueTranslationDataOnDemand.characteristicValueDataOnDemand;
    
    @Autowired
    private LocaleDataOnDemand CharacteristicValueTranslationDataOnDemand.localeDataOnDemand;
    
    public CharacteristicValueTranslation CharacteristicValueTranslationDataOnDemand.getNewTransientCharacteristicValueTranslation(int index) {
        net.sourceforge.anubis.domain.CharacteristicValueTranslation obj = new net.sourceforge.anubis.domain.CharacteristicValueTranslation();
        obj.setCharacteristicValue(characteristicValueDataOnDemand.getRandomCharacteristicValue());
        obj.setLocale(localeDataOnDemand.getRandomLocale());
        obj.setName("name_" + index);
        return obj;
    }
    
    public CharacteristicValueTranslation CharacteristicValueTranslationDataOnDemand.getSpecificCharacteristicValueTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        CharacteristicValueTranslation obj = data.get(index);
        return CharacteristicValueTranslation.findCharacteristicValueTranslation(obj.getUid());
    }
    
    public CharacteristicValueTranslation CharacteristicValueTranslationDataOnDemand.getRandomCharacteristicValueTranslation() {
        init();
        CharacteristicValueTranslation obj = data.get(rnd.nextInt(data.size()));
        return CharacteristicValueTranslation.findCharacteristicValueTranslation(obj.getUid());
    }
    
    public boolean CharacteristicValueTranslationDataOnDemand.modifyCharacteristicValueTranslation(CharacteristicValueTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CharacteristicValueTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.CharacteristicValueTranslation.findCharacteristicValueTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CharacteristicValueTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.CharacteristicValueTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.CharacteristicValueTranslation obj = getNewTransientCharacteristicValueTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
