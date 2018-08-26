package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CharacteristicDataOnDemand;
import net.sourceforge.anubis.domain.CharacteristicValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacteristicValueDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CharacteristicValueDataOnDemand: @Component;
    
    private Random CharacteristicValueDataOnDemand.rnd = new SecureRandom();
    
    private List<CharacteristicValue> CharacteristicValueDataOnDemand.data;
    
    @Autowired
    private CharacteristicDataOnDemand CharacteristicValueDataOnDemand.characteristicDataOnDemand;
    
    public CharacteristicValue CharacteristicValueDataOnDemand.getNewTransientCharacteristicValue(int index) {
        net.sourceforge.anubis.domain.CharacteristicValue obj = new net.sourceforge.anubis.domain.CharacteristicValue();
        obj.setCharacteristic(characteristicDataOnDemand.getRandomCharacteristic());
        obj.setId("id_" + index);
        return obj;
    }
    
    public CharacteristicValue CharacteristicValueDataOnDemand.getSpecificCharacteristicValue(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        CharacteristicValue obj = data.get(index);
        return CharacteristicValue.findCharacteristicValue(obj.getUid());
    }
    
    public CharacteristicValue CharacteristicValueDataOnDemand.getRandomCharacteristicValue() {
        init();
        CharacteristicValue obj = data.get(rnd.nextInt(data.size()));
        return CharacteristicValue.findCharacteristicValue(obj.getUid());
    }
    
    public boolean CharacteristicValueDataOnDemand.modifyCharacteristicValue(CharacteristicValue obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CharacteristicValueDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.CharacteristicValue.findCharacteristicValueEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CharacteristicValue' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.CharacteristicValue>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.CharacteristicValue obj = getNewTransientCharacteristicValue(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
