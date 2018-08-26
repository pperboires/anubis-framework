package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import net.sourceforge.anubis.domain.CharacterizedGroup;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import net.sourceforge.anubis.domain.Inactivation;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_characterized_group_inactivation")
public class CharacterizedGroupInactivation {

    @NotNull
    @ManyToOne(targetEntity = CharacterizedGroup.class)
    @JoinColumn(name = "characterized_group_uid")
    private CharacterizedGroup characterizedGroup;

    @NotNull
    @ManyToOne(targetEntity = Inactivation.class)
    @JoinColumn(name = "inactivation_uid")
    private Inactivation inactivation;
}
