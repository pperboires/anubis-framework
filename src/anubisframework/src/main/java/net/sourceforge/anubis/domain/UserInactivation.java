package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import net.sourceforge.anubis.domain.User;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import net.sourceforge.anubis.domain.Inactivation;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_user_inactivation")
public class UserInactivation {

    @NotNull
    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_uid")
    private User user;

    @NotNull
    @ManyToOne(targetEntity = Inactivation.class)
    @JoinColumn(name = "inactivation_uid")
    private Inactivation inactivation;
}
