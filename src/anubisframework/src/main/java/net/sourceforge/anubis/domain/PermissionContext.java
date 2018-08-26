package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import net.sourceforge.anubis.domain.Context;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import net.sourceforge.anubis.domain.Permission;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_permission_context")
public class PermissionContext {

    @NotNull
    @ManyToOne(targetEntity = Context.class)
    @JoinColumn(name = "context_uid")
    private Context context;

    @NotNull
    @ManyToOne(targetEntity = Permission.class)
    @JoinColumn(name = "permission_uid")
    private Permission permission;
}
