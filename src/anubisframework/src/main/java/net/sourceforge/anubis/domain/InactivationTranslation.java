package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import net.sourceforge.anubis.domain.Inactivation;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.Column;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_inactivation_translation")
public class InactivationTranslation {

    @NotNull
    @ManyToOne(targetEntity = Inactivation.class)
    @JoinColumn(name = "inactivation_uid")
    private Inactivation inactivation;

    @NotNull
    @Column(name = "reason")
    private String reason;
}
