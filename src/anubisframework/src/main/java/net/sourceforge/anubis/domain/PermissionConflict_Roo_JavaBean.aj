package net.sourceforge.anubis.domain;

import java.util.Set;
import net.sourceforge.anubis.domain.Permission;
import net.sourceforge.anubis.domain.PermissionConflictTranslation;

privileged aspect PermissionConflict_Roo_JavaBean {
    
    public Permission PermissionConflict.getPermission() {
        return this.permission;
    }
    
    public void PermissionConflict.setPermission(Permission permission) {
        this.permission = permission;
    }
    
    public Permission PermissionConflict.getPermissionConflicted() {
        return this.permissionConflicted;
    }
    
    public void PermissionConflict.setPermissionConflicted(Permission permissionConflicted) {
        this.permissionConflicted = permissionConflicted;
    }
    
    public Set<PermissionConflictTranslation> PermissionConflict.getTranslations() {
        return this.translations;
    }
    
    public void PermissionConflict.setTranslations(Set<PermissionConflictTranslation> translations) {
        this.translations = translations;
    }
    
}
