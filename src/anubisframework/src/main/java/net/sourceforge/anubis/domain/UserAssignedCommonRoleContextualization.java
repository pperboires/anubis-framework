package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import net.sourceforge.anubis.domain.UserAssignedCommonRole;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import net.sourceforge.anubis.domain.ContextValue;
import net.sourceforge.anubis.domain.CommonRoleAssignedPermission;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_user_assigned_common_role_contextualization")
public class UserAssignedCommonRoleContextualization {

    @NotNull
    @ManyToOne(targetEntity = UserAssignedCommonRole.class)
    @JoinColumn(name = "user_assigned_common_role_uid")
    private UserAssignedCommonRole userAssignedCommonRole;

    @NotNull
    @ManyToOne(targetEntity = ContextValue.class)
    @JoinColumn(name = "context_value_uid")
    private ContextValue contextValue;

    @NotNull
    @ManyToOne(targetEntity = CommonRoleAssignedPermission.class)
    @JoinColumn(name = "common_role_assigned_permission_uid")
    private CommonRoleAssignedPermission commonRoleAssignedPermission;
}
