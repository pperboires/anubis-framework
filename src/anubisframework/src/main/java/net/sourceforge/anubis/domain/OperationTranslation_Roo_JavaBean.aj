package net.sourceforge.anubis.domain;

import java.lang.String;
import net.sourceforge.anubis.domain.Locale;
import net.sourceforge.anubis.domain.Operation;

privileged aspect OperationTranslation_Roo_JavaBean {
    
    public String OperationTranslation.getName() {
        return this.name;
    }
    
    public void OperationTranslation.setName(String name) {
        this.name = name;
    }
    
    public String OperationTranslation.getDescription() {
        return this.description;
    }
    
    public void OperationTranslation.setDescription(String description) {
        this.description = description;
    }
    
    public Operation OperationTranslation.getOperation() {
        return this.operation;
    }
    
    public void OperationTranslation.setOperation(Operation operation) {
        this.operation = operation;
    }
    
    public Locale OperationTranslation.getLocale() {
        return this.locale;
    }
    
    public void OperationTranslation.setLocale(Locale locale) {
        this.locale = locale;
    }
    
}
