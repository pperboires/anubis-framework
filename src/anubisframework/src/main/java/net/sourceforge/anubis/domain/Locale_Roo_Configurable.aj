package net.sourceforge.anubis.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Locale_Roo_Configurable {
    
    declare @type: Locale: @Configurable;
    
}
