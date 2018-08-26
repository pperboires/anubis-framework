package net.sourceforge.anubis.domain;

import java.util.Date;

privileged aspect Validity_Roo_JavaBean {
    
    public Date Validity.getBegin_date() {
        return this.begin_date;
    }
    
    public void Validity.setBegin_date(Date begin_date) {
        this.begin_date = begin_date;
    }
    
    public Date Validity.getEnd_date() {
        return this.end_date;
    }
    
    public void Validity.setEnd_date(Date end_date) {
        this.end_date = end_date;
    }
    
}
