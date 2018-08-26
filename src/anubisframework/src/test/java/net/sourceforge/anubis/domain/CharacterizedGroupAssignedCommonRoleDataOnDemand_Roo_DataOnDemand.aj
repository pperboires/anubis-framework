package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole;
import net.sourceforge.anubis.domain.CharacterizedGroupDataOnDemand;
import net.sourceforge.anubis.domain.CommonRoleDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupAssignedCommonRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CharacterizedGroupAssignedCommonRoleDataOnDemand: @Component;
    
    private Random CharacterizedGroupAssignedCommonRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<CharacterizedGroupAssignedCommonRole> CharacterizedGroupAssignedCommonRoleDataOnDemand.data;
    
    @Autowired
    private CharacterizedGroupDataOnDemand CharacterizedGroupAssignedCommonRoleDataOnDemand.characterizedGroupDataOnDemand;
    
    @Autowired
    private CommonRoleDataOnDemand CharacterizedGroupAssignedCommonRoleDataOnDemand.commonRoleDataOnDemand;
    
    public CharacterizedGroupAssignedCommonRole CharacterizedGroupAssignedCommonRoleDataOnDemand.getNewTransientCharacterizedGroupAssignedCommonRole(int index) {
        net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole obj = new net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole();
        obj.setCharacterizedGroup(characterizedGroupDataOnDemand.getRandomCharacterizedGroup());
        obj.setCommonRole(commonRoleDataOnDemand.getRandomCommonRole());
        return obj;
    }
    
    public CharacterizedGroupAssignedCommonRole CharacterizedGroupAssignedCommonRoleDataOnDemand.getSpecificCharacterizedGroupAssignedCommonRole(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        CharacterizedGroupAssignedCommonRole obj = data.get(index);
        return CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRole(obj.getUid());
    }
    
    public CharacterizedGroupAssignedCommonRole CharacterizedGroupAssignedCommonRoleDataOnDemand.getRandomCharacterizedGroupAssignedCommonRole() {
        init();
        CharacterizedGroupAssignedCommonRole obj = data.get(rnd.nextInt(data.size()));
        return CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRole(obj.getUid());
    }
    
    public boolean CharacterizedGroupAssignedCommonRoleDataOnDemand.modifyCharacterizedGroupAssignedCommonRole(CharacterizedGroupAssignedCommonRole obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CharacterizedGroupAssignedCommonRoleDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRoleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CharacterizedGroupAssignedCommonRole' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole obj = getNewTransientCharacterizedGroupAssignedCommonRole(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
