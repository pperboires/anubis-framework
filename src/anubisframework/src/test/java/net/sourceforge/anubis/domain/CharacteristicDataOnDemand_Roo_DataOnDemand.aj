package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.Characteristic;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacteristicDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CharacteristicDataOnDemand: @Component;
    
    private Random CharacteristicDataOnDemand.rnd = new SecureRandom();
    
    private List<Characteristic> CharacteristicDataOnDemand.data;
    
    public Characteristic CharacteristicDataOnDemand.getNewTransientCharacteristic(int index) {
        net.sourceforge.anubis.domain.Characteristic obj = new net.sourceforge.anubis.domain.Characteristic();
        obj.setId("id_" + index);
        return obj;
    }
    
    public Characteristic CharacteristicDataOnDemand.getSpecificCharacteristic(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Characteristic obj = data.get(index);
        return Characteristic.findCharacteristic(obj.getUid());
    }
    
    public Characteristic CharacteristicDataOnDemand.getRandomCharacteristic() {
        init();
        Characteristic obj = data.get(rnd.nextInt(data.size()));
        return Characteristic.findCharacteristic(obj.getUid());
    }
    
    public boolean CharacteristicDataOnDemand.modifyCharacteristic(Characteristic obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CharacteristicDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.Characteristic.findCharacteristicEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Characteristic' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.Characteristic>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.Characteristic obj = getNewTransientCharacteristic(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
