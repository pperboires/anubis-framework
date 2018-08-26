package net.sourceforge.anubis.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Permission_Roo_Configurable {
    
    declare @type: Permission: @Configurable;
    
}
