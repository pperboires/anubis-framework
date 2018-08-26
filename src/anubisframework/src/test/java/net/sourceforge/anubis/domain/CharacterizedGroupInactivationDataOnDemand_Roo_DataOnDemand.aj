package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CharacterizedGroupDataOnDemand;
import net.sourceforge.anubis.domain.CharacterizedGroupInactivation;
import net.sourceforge.anubis.domain.InactivationDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupInactivationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CharacterizedGroupInactivationDataOnDemand: @Component;
    
    private Random CharacterizedGroupInactivationDataOnDemand.rnd = new SecureRandom();
    
    private List<CharacterizedGroupInactivation> CharacterizedGroupInactivationDataOnDemand.data;
    
    @Autowired
    private CharacterizedGroupDataOnDemand CharacterizedGroupInactivationDataOnDemand.characterizedGroupDataOnDemand;
    
    @Autowired
    private InactivationDataOnDemand CharacterizedGroupInactivationDataOnDemand.inactivationDataOnDemand;
    
    public CharacterizedGroupInactivation CharacterizedGroupInactivationDataOnDemand.getNewTransientCharacterizedGroupInactivation(int index) {
        net.sourceforge.anubis.domain.CharacterizedGroupInactivation obj = new net.sourceforge.anubis.domain.CharacterizedGroupInactivation();
        obj.setCharacterizedGroup(characterizedGroupDataOnDemand.getRandomCharacterizedGroup());
        obj.setInactivation(inactivationDataOnDemand.getRandomInactivation());
        return obj;
    }
    
    public CharacterizedGroupInactivation CharacterizedGroupInactivationDataOnDemand.getSpecificCharacterizedGroupInactivation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        CharacterizedGroupInactivation obj = data.get(index);
        return CharacterizedGroupInactivation.findCharacterizedGroupInactivation(obj.getUid());
    }
    
    public CharacterizedGroupInactivation CharacterizedGroupInactivationDataOnDemand.getRandomCharacterizedGroupInactivation() {
        init();
        CharacterizedGroupInactivation obj = data.get(rnd.nextInt(data.size()));
        return CharacterizedGroupInactivation.findCharacterizedGroupInactivation(obj.getUid());
    }
    
    public boolean CharacterizedGroupInactivationDataOnDemand.modifyCharacterizedGroupInactivation(CharacterizedGroupInactivation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CharacterizedGroupInactivationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.CharacterizedGroupInactivation.findCharacterizedGroupInactivationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CharacterizedGroupInactivation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.CharacterizedGroupInactivation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.CharacterizedGroupInactivation obj = getNewTransientCharacterizedGroupInactivation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
