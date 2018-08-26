package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.ApplicationDataOnDemand;
import net.sourceforge.anubis.domain.CharacterizedGroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CharacterizedGroupDataOnDemand: @Component;
    
    private Random CharacterizedGroupDataOnDemand.rnd = new SecureRandom();
    
    private List<CharacterizedGroup> CharacterizedGroupDataOnDemand.data;
    
    @Autowired
    private ApplicationDataOnDemand CharacterizedGroupDataOnDemand.applicationDataOnDemand;
    
    public CharacterizedGroup CharacterizedGroupDataOnDemand.getNewTransientCharacterizedGroup(int index) {
        net.sourceforge.anubis.domain.CharacterizedGroup obj = new net.sourceforge.anubis.domain.CharacterizedGroup();
        obj.setApplication(applicationDataOnDemand.getRandomApplication());
        obj.setEnabled(new Boolean(true));
        return obj;
    }
    
    public CharacterizedGroup CharacterizedGroupDataOnDemand.getSpecificCharacterizedGroup(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        CharacterizedGroup obj = data.get(index);
        return CharacterizedGroup.findCharacterizedGroup(obj.getUid());
    }
    
    public CharacterizedGroup CharacterizedGroupDataOnDemand.getRandomCharacterizedGroup() {
        init();
        CharacterizedGroup obj = data.get(rnd.nextInt(data.size()));
        return CharacterizedGroup.findCharacterizedGroup(obj.getUid());
    }
    
    public boolean CharacterizedGroupDataOnDemand.modifyCharacterizedGroup(CharacterizedGroup obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CharacterizedGroupDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.CharacterizedGroup.findCharacterizedGroupEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CharacterizedGroup' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.CharacterizedGroup>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.CharacterizedGroup obj = getNewTransientCharacterizedGroup(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
