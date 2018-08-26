package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import net.sourceforge.anubis.domain.CommonRole;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import net.sourceforge.anubis.domain.Locale;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_common_role_translation")
public class CommonRoleTranslation {

    @NotNull
    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @NotNull
    @ManyToOne(targetEntity = CommonRole.class)
    @JoinColumn(name = "common_role_uid")
    private CommonRole commonRole;

    @NotNull
    @ManyToOne(targetEntity = Locale.class)
    @JoinColumn(name = "locale_uid")
    private Locale locale;
}
