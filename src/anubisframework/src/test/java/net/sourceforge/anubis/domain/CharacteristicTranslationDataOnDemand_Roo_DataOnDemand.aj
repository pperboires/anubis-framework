package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CharacteristicDataOnDemand;
import net.sourceforge.anubis.domain.CharacteristicTranslation;
import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacteristicTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CharacteristicTranslationDataOnDemand: @Component;
    
    private Random CharacteristicTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<CharacteristicTranslation> CharacteristicTranslationDataOnDemand.data;
    
    @Autowired
    private CharacteristicDataOnDemand CharacteristicTranslationDataOnDemand.characteristicDataOnDemand;
    
    @Autowired
    private LocaleDataOnDemand CharacteristicTranslationDataOnDemand.localeDataOnDemand;
    
    public CharacteristicTranslation CharacteristicTranslationDataOnDemand.getNewTransientCharacteristicTranslation(int index) {
        net.sourceforge.anubis.domain.CharacteristicTranslation obj = new net.sourceforge.anubis.domain.CharacteristicTranslation();
        obj.setCharacteristic(characteristicDataOnDemand.getRandomCharacteristic());
        obj.setLocale(localeDataOnDemand.getRandomLocale());
        obj.setName("name_" + index);
        return obj;
    }
    
    public CharacteristicTranslation CharacteristicTranslationDataOnDemand.getSpecificCharacteristicTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        CharacteristicTranslation obj = data.get(index);
        return CharacteristicTranslation.findCharacteristicTranslation(obj.getUid());
    }
    
    public CharacteristicTranslation CharacteristicTranslationDataOnDemand.getRandomCharacteristicTranslation() {
        init();
        CharacteristicTranslation obj = data.get(rnd.nextInt(data.size()));
        return CharacteristicTranslation.findCharacteristicTranslation(obj.getUid());
    }
    
    public boolean CharacteristicTranslationDataOnDemand.modifyCharacteristicTranslation(CharacteristicTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CharacteristicTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.CharacteristicTranslation.findCharacteristicTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CharacteristicTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.CharacteristicTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.CharacteristicTranslation obj = getNewTransientCharacteristicTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
