package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.AdministrativeRoleDataOnDemand;
import net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole;
import net.sourceforge.anubis.domain.CharacterizedGroupDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupAssignedAdministrativeRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CharacterizedGroupAssignedAdministrativeRoleDataOnDemand: @Component;
    
    private Random CharacterizedGroupAssignedAdministrativeRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<CharacterizedGroupAssignedAdministrativeRole> CharacterizedGroupAssignedAdministrativeRoleDataOnDemand.data;
    
    @Autowired
    private AdministrativeRoleDataOnDemand CharacterizedGroupAssignedAdministrativeRoleDataOnDemand.administrativeRoleDataOnDemand;
    
    @Autowired
    private CharacterizedGroupDataOnDemand CharacterizedGroupAssignedAdministrativeRoleDataOnDemand.characterizedGroupDataOnDemand;
    
    public CharacterizedGroupAssignedAdministrativeRole CharacterizedGroupAssignedAdministrativeRoleDataOnDemand.getNewTransientCharacterizedGroupAssignedAdministrativeRole(int index) {
        net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole obj = new net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole();
        obj.setAdministrativeRole(administrativeRoleDataOnDemand.getRandomAdministrativeRole());
        obj.setCharacterizedGroup(characterizedGroupDataOnDemand.getRandomCharacterizedGroup());
        return obj;
    }
    
    public CharacterizedGroupAssignedAdministrativeRole CharacterizedGroupAssignedAdministrativeRoleDataOnDemand.getSpecificCharacterizedGroupAssignedAdministrativeRole(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        CharacterizedGroupAssignedAdministrativeRole obj = data.get(index);
        return CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRole(obj.getUid());
    }
    
    public CharacterizedGroupAssignedAdministrativeRole CharacterizedGroupAssignedAdministrativeRoleDataOnDemand.getRandomCharacterizedGroupAssignedAdministrativeRole() {
        init();
        CharacterizedGroupAssignedAdministrativeRole obj = data.get(rnd.nextInt(data.size()));
        return CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRole(obj.getUid());
    }
    
    public boolean CharacterizedGroupAssignedAdministrativeRoleDataOnDemand.modifyCharacterizedGroupAssignedAdministrativeRole(CharacterizedGroupAssignedAdministrativeRole obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CharacterizedGroupAssignedAdministrativeRoleDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRoleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CharacterizedGroupAssignedAdministrativeRole' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole obj = getNewTransientCharacterizedGroupAssignedAdministrativeRole(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
