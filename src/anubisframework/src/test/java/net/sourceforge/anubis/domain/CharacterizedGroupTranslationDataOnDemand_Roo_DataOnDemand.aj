package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CharacterizedGroupDataOnDemand;
import net.sourceforge.anubis.domain.CharacterizedGroupTranslation;
import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupTranslationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CharacterizedGroupTranslationDataOnDemand: @Component;
    
    private Random CharacterizedGroupTranslationDataOnDemand.rnd = new SecureRandom();
    
    private List<CharacterizedGroupTranslation> CharacterizedGroupTranslationDataOnDemand.data;
    
    @Autowired
    private CharacterizedGroupDataOnDemand CharacterizedGroupTranslationDataOnDemand.characterizedGroupDataOnDemand;
    
    @Autowired
    private LocaleDataOnDemand CharacterizedGroupTranslationDataOnDemand.localeDataOnDemand;
    
    public CharacterizedGroupTranslation CharacterizedGroupTranslationDataOnDemand.getNewTransientCharacterizedGroupTranslation(int index) {
        net.sourceforge.anubis.domain.CharacterizedGroupTranslation obj = new net.sourceforge.anubis.domain.CharacterizedGroupTranslation();
        obj.setCharacterizedGroup(characterizedGroupDataOnDemand.getRandomCharacterizedGroup());
        obj.setLocale(localeDataOnDemand.getRandomLocale());
        obj.setName("name_" + index);
        return obj;
    }
    
    public CharacterizedGroupTranslation CharacterizedGroupTranslationDataOnDemand.getSpecificCharacterizedGroupTranslation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        CharacterizedGroupTranslation obj = data.get(index);
        return CharacterizedGroupTranslation.findCharacterizedGroupTranslation(obj.getUid());
    }
    
    public CharacterizedGroupTranslation CharacterizedGroupTranslationDataOnDemand.getRandomCharacterizedGroupTranslation() {
        init();
        CharacterizedGroupTranslation obj = data.get(rnd.nextInt(data.size()));
        return CharacterizedGroupTranslation.findCharacterizedGroupTranslation(obj.getUid());
    }
    
    public boolean CharacterizedGroupTranslationDataOnDemand.modifyCharacterizedGroupTranslation(CharacterizedGroupTranslation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CharacterizedGroupTranslationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.CharacterizedGroupTranslation.findCharacterizedGroupTranslationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CharacterizedGroupTranslation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.CharacterizedGroupTranslation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.CharacterizedGroupTranslation obj = getNewTransientCharacterizedGroupTranslation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
