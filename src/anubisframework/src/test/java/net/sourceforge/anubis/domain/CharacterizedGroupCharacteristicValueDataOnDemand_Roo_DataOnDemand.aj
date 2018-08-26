package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CharacteristicValueDataOnDemand;
import net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue;
import net.sourceforge.anubis.domain.CharacterizedGroupDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupCharacteristicValueDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CharacterizedGroupCharacteristicValueDataOnDemand: @Component;
    
    private Random CharacterizedGroupCharacteristicValueDataOnDemand.rnd = new SecureRandom();
    
    private List<CharacterizedGroupCharacteristicValue> CharacterizedGroupCharacteristicValueDataOnDemand.data;
    
    @Autowired
    private CharacteristicValueDataOnDemand CharacterizedGroupCharacteristicValueDataOnDemand.characteristicValueDataOnDemand;
    
    @Autowired
    private CharacterizedGroupDataOnDemand CharacterizedGroupCharacteristicValueDataOnDemand.characterizedGroupDataOnDemand;
    
    public CharacterizedGroupCharacteristicValue CharacterizedGroupCharacteristicValueDataOnDemand.getNewTransientCharacterizedGroupCharacteristicValue(int index) {
        net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue obj = new net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue();
        obj.setCharacteristicValue(characteristicValueDataOnDemand.getRandomCharacteristicValue());
        obj.setCharacterizedGroup(characterizedGroupDataOnDemand.getRandomCharacterizedGroup());
        return obj;
    }
    
    public CharacterizedGroupCharacteristicValue CharacterizedGroupCharacteristicValueDataOnDemand.getSpecificCharacterizedGroupCharacteristicValue(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        CharacterizedGroupCharacteristicValue obj = data.get(index);
        return CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValue(obj.getUid());
    }
    
    public CharacterizedGroupCharacteristicValue CharacterizedGroupCharacteristicValueDataOnDemand.getRandomCharacterizedGroupCharacteristicValue() {
        init();
        CharacterizedGroupCharacteristicValue obj = data.get(rnd.nextInt(data.size()));
        return CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValue(obj.getUid());
    }
    
    public boolean CharacterizedGroupCharacteristicValueDataOnDemand.modifyCharacterizedGroupCharacteristicValue(CharacterizedGroupCharacteristicValue obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CharacterizedGroupCharacteristicValueDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValueEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CharacterizedGroupCharacteristicValue' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue obj = getNewTransientCharacterizedGroupCharacteristicValue(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
