package net.sourceforge.anubis.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Application_Roo_Configurable {
    
    declare @type: Application: @Configurable;
    
}
