package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import net.sourceforge.anubis.domain.Locale;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import net.sourceforge.anubis.domain.Application;
import javax.persistence.Column;
import javax.validation.constraints.Min;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_supported_locale")
public class SupportedLocale {

    @NotNull
    @ManyToOne(targetEntity = Locale.class)
    @JoinColumn(name = "locale_uid")
    private Locale locale;

    @NotNull
    @ManyToOne(targetEntity = Application.class)
    @JoinColumn(name = "application_uid")
    private Application application;

    @NotNull
    @Column(name = "preference")
    @Min(1L)
    private Integer preference;
}
