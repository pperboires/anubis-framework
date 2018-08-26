package net.sourceforge.anubis.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Operation_Roo_Configurable {
    
    declare @type: Operation: @Configurable;
    
}
