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
import net.sourceforge.anubis.domain.CommonRole;
import net.sourceforge.anubis.domain.Validity;
import net.sourceforge.anubis.domain.Permission;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_user_assigned_common_role")
public class UserAssignedCommonRole {

    @NotNull
    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_uid")
    private User user;

    @NotNull
    @ManyToOne(targetEntity = CommonRole.class)
    @JoinColumn(name = "common_role_uid")
    private CommonRole commonRole;

    @ManyToOne(targetEntity = Validity.class)
    @JoinColumn(name = "validity_uid")
    private Validity validate;

    @ManyToOne(targetEntity = Permission.class)
    @JoinColumn(name = "permission_uid")
    private Permission permission;
    
}
