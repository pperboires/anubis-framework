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
import net.sourceforge.anubis.domain.AdministrativeRole;
import javax.persistence.Column;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_administrative_role_translation")
public class AdministrativeRoleTranslation {

    @NotNull
    @ManyToOne(targetEntity = Locale.class)
    @JoinColumn(name = "locale")
    private Locale locale;

    @NotNull
    @ManyToOne(targetEntity = AdministrativeRole.class)
    @JoinColumn(name = "administrative_role_uid")
    private AdministrativeRole administrativeRole;

    @NotNull
    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;
}
