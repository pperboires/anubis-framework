package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.CommonRoleAssignedPermission;
import net.sourceforge.anubis.domain.CommonRoleDataOnDemand;
import net.sourceforge.anubis.domain.PermissionDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CommonRoleAssignedPermissionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CommonRoleAssignedPermissionDataOnDemand: @Component;
    
    private Random CommonRoleAssignedPermissionDataOnDemand.rnd = new SecureRandom();
    
    private List<CommonRoleAssignedPermission> CommonRoleAssignedPermissionDataOnDemand.data;
    
    @Autowired
    private CommonRoleDataOnDemand CommonRoleAssignedPermissionDataOnDemand.commonRoleDataOnDemand;
    
    @Autowired
    private PermissionDataOnDemand CommonRoleAssignedPermissionDataOnDemand.permissionDataOnDemand;
    
    public CommonRoleAssignedPermission CommonRoleAssignedPermissionDataOnDemand.getNewTransientCommonRoleAssignedPermission(int index) {
        net.sourceforge.anubis.domain.CommonRoleAssignedPermission obj = new net.sourceforge.anubis.domain.CommonRoleAssignedPermission();
        obj.setCommonRole(commonRoleDataOnDemand.getRandomCommonRole());
        obj.setPermission(permissionDataOnDemand.getRandomPermission());
        return obj;
    }
    
    public CommonRoleAssignedPermission CommonRoleAssignedPermissionDataOnDemand.getSpecificCommonRoleAssignedPermission(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        CommonRoleAssignedPermission obj = data.get(index);
        return CommonRoleAssignedPermission.findCommonRoleAssignedPermission(obj.getUid());
    }
    
    public CommonRoleAssignedPermission CommonRoleAssignedPermissionDataOnDemand.getRandomCommonRoleAssignedPermission() {
        init();
        CommonRoleAssignedPermission obj = data.get(rnd.nextInt(data.size()));
        return CommonRoleAssignedPermission.findCommonRoleAssignedPermission(obj.getUid());
    }
    
    public boolean CommonRoleAssignedPermissionDataOnDemand.modifyCommonRoleAssignedPermission(CommonRoleAssignedPermission obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CommonRoleAssignedPermissionDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.CommonRoleAssignedPermission.findCommonRoleAssignedPermissionEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CommonRoleAssignedPermission' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.CommonRoleAssignedPermission>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.CommonRoleAssignedPermission obj = getNewTransientCommonRoleAssignedPermission(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
