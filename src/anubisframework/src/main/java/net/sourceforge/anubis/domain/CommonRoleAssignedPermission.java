package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import net.sourceforge.anubis.domain.CommonRole;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import net.sourceforge.anubis.domain.Permission;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_common_role_assigned_permission")
public class CommonRoleAssignedPermission {

    @NotNull
    @ManyToOne(targetEntity = CommonRole.class)
    @JoinColumn(name = "common_role_uid")
    private CommonRole commonRole;

    @NotNull
    @ManyToOne(targetEntity = Permission.class)
    @JoinColumn(name = "permission_uid")
    private Permission permission;
}
