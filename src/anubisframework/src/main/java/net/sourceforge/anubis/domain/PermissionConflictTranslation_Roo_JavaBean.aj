package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.PermissionConflict;

privileged aspect PermissionConflictTranslation_Roo_JavaBean {
    
    public PermissionConflict PermissionConflictTranslation.getPermissionConflict() {
        return this.permissionConflict;
    }
    
    public void PermissionConflictTranslation.setPermissionConflict(PermissionConflict permissionConflict) {
        this.permissionConflict = permissionConflict;
    }
    
    public String PermissionConflictTranslation.getName() {
        return this.name;
    }
    
    public void PermissionConflictTranslation.setName(String name) {
        this.name = name;
    }
    
    public String PermissionConflictTranslation.getDescription() {
        return this.description;
    }
    
    public void PermissionConflictTranslation.setDescription(String description) {
        this.description = description;
    }
    
}
