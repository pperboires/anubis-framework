package net.sourceforge.anubis.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Context_Roo_Configurable {
    
    declare @type: Context: @Configurable;
    
}
