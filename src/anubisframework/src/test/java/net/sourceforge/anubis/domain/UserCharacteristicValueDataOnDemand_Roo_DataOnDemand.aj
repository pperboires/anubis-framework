package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CharacteristicValueDataOnDemand;
import net.sourceforge.anubis.domain.UserCharacteristicValue;
import net.sourceforge.anubis.domain.UserDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserCharacteristicValueDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserCharacteristicValueDataOnDemand: @Component;
    
    private Random UserCharacteristicValueDataOnDemand.rnd = new SecureRandom();
    
    private List<UserCharacteristicValue> UserCharacteristicValueDataOnDemand.data;
    
    @Autowired
    private CharacteristicValueDataOnDemand UserCharacteristicValueDataOnDemand.characteristicValueDataOnDemand;
    
    @Autowired
    private UserDataOnDemand UserCharacteristicValueDataOnDemand.userDataOnDemand;
    
    public UserCharacteristicValue UserCharacteristicValueDataOnDemand.getNewTransientUserCharacteristicValue(int index) {
        net.sourceforge.anubis.domain.UserCharacteristicValue obj = new net.sourceforge.anubis.domain.UserCharacteristicValue();
        obj.setCharacteristcValue(characteristicValueDataOnDemand.getRandomCharacteristicValue());
        obj.setUser(userDataOnDemand.getRandomUser());
        return obj;
    }
    
    public UserCharacteristicValue UserCharacteristicValueDataOnDemand.getSpecificUserCharacteristicValue(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        UserCharacteristicValue obj = data.get(index);
        return UserCharacteristicValue.findUserCharacteristicValue(obj.getUid());
    }
    
    public UserCharacteristicValue UserCharacteristicValueDataOnDemand.getRandomUserCharacteristicValue() {
        init();
        UserCharacteristicValue obj = data.get(rnd.nextInt(data.size()));
        return UserCharacteristicValue.findUserCharacteristicValue(obj.getUid());
    }
    
    public boolean UserCharacteristicValueDataOnDemand.modifyUserCharacteristicValue(UserCharacteristicValue obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void UserCharacteristicValueDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.UserCharacteristicValue.findUserCharacteristicValueEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'UserCharacteristicValue' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.UserCharacteristicValue>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.UserCharacteristicValue obj = getNewTransientUserCharacteristicValue(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
