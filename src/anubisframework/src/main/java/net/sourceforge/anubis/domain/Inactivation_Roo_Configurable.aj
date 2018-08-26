package net.sourceforge.anubis.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Inactivation_Roo_Configurable {
    
    declare @type: Inactivation: @Configurable;
    
}
