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
import javax.persistence.Column;
import net.sourceforge.anubis.domain.ContextValue;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_context_value_translation")
public class ContextValueTranslation {

    @NotNull
    @ManyToOne(targetEntity = Locale.class)
    @JoinColumn(name = "locale_uid")
    private Locale locale;

    @NotNull
    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @NotNull
    @ManyToOne(targetEntity = ContextValue.class)
    @JoinColumn(name = "context_value_uid")
    private ContextValue contextValue;
}
