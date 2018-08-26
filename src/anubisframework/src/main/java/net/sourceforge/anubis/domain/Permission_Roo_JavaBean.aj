package net.sourceforge.anubis.domain;

import java.lang.Boolean;
import net.sourceforge.anubis.domain.Operation;
import net.sourceforge.anubis.domain.Resource;

privileged aspect Permission_Roo_JavaBean {
    
    public Boolean Permission.getEnabled() {
        return this.enabled;
    }
    
    public void Permission.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
    public Boolean Permission.getContextualized() {
        return this.contextualized;
    }
    
    public void Permission.setContextualized(Boolean contextualized) {
        this.contextualized = contextualized;
    }
    
    public Boolean Permission.getAudited() {
        return this.audited;
    }
    
    public void Permission.setAudited(Boolean audited) {
        this.audited = audited;
    }
    
    public Operation Permission.getOperation() {
        return this.operation;
    }
    
    public void Permission.setOperation(Operation operation) {
        this.operation = operation;
    }
    
    public Resource Permission.getResource() {
        return this.resource;
    }
    
    public void Permission.setResource(Resource resource) {
        this.resource = resource;
    }
    
}
