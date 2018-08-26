package net.sourceforge.anubis.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect UserAccount_Roo_Configurable {
    
    declare @type: UserAccount: @Configurable;
    
}
