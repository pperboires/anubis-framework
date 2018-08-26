package net.sourceforge.anubis.domain;

import java.lang.String;

privileged aspect Locale_Roo_JavaBean {
    
    public String Locale.getCode() {
        return this.code;
    }
    
    public void Locale.setCode(String code) {
        this.code = code;
    }
    
    public String Locale.getName() {
        return this.name;
    }
    
    public void Locale.setName(String name) {
        this.name = name;
    }
    
}
