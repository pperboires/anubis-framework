package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.Context;
import net.sourceforge.anubis.domain.Permission;

privileged aspect PermissionContext_Roo_JavaBean {
    
    public Context PermissionContext.getContext() {
        return this.context;
    }
    
    public void PermissionContext.setContext(Context context) {
        this.context = context;
    }
    
    public Permission PermissionContext.getPermission() {
        return this.permission;
    }
    
    public void PermissionContext.setPermission(Permission permission) {
        this.permission = permission;
    }
    
}
