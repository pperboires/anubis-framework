package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CommonRoleAssignedPermissionDataOnDemand;
import net.sourceforge.anubis.domain.ContextValueDataOnDemand;
import net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization;
import net.sourceforge.anubis.domain.UserAssignedCommonRoleDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAssignedCommonRoleContextualizationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserAssignedCommonRoleContextualizationDataOnDemand: @Component;
    
    private Random UserAssignedCommonRoleContextualizationDataOnDemand.rnd = new SecureRandom();
    
    private List<UserAssignedCommonRoleContextualization> UserAssignedCommonRoleContextualizationDataOnDemand.data;
    
    @Autowired
    private CommonRoleAssignedPermissionDataOnDemand UserAssignedCommonRoleContextualizationDataOnDemand.commonRoleAssignedPermissionDataOnDemand;
    
    @Autowired
    private ContextValueDataOnDemand UserAssignedCommonRoleContextualizationDataOnDemand.contextValueDataOnDemand;
    
    @Autowired
    private UserAssignedCommonRoleDataOnDemand UserAssignedCommonRoleContextualizationDataOnDemand.userAssignedCommonRoleDataOnDemand;
    
    public UserAssignedCommonRoleContextualization UserAssignedCommonRoleContextualizationDataOnDemand.getNewTransientUserAssignedCommonRoleContextualization(int index) {
        net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization obj = new net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization();
        obj.setCommonRoleAssignedPermission(commonRoleAssignedPermissionDataOnDemand.getRandomCommonRoleAssignedPermission());
        obj.setContextValue(contextValueDataOnDemand.getRandomContextValue());
        obj.setUserAssignedCommonRole(userAssignedCommonRoleDataOnDemand.getRandomUserAssignedCommonRole());
        return obj;
    }
    
    public UserAssignedCommonRoleContextualization UserAssignedCommonRoleContextualizationDataOnDemand.getSpecificUserAssignedCommonRoleContextualization(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        UserAssignedCommonRoleContextualization obj = data.get(index);
        return UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualization(obj.getUid());
    }
    
    public UserAssignedCommonRoleContextualization UserAssignedCommonRoleContextualizationDataOnDemand.getRandomUserAssignedCommonRoleContextualization() {
        init();
        UserAssignedCommonRoleContextualization obj = data.get(rnd.nextInt(data.size()));
        return UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualization(obj.getUid());
    }
    
    public boolean UserAssignedCommonRoleContextualizationDataOnDemand.modifyUserAssignedCommonRoleContextualization(UserAssignedCommonRoleContextualization obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void UserAssignedCommonRoleContextualizationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualizationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'UserAssignedCommonRoleContextualization' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization obj = getNewTransientUserAssignedCommonRoleContextualization(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
