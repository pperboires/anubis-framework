package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import net.sourceforge.anubis.domain.PermissionConflict;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.Column;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_permission_ConflictTranslation")
public class PermissionConflictTranslation {

    @NotNull
    @ManyToOne(targetEntity = PermissionConflict.class)
    @JoinColumn(name = "permission_conflict_uid")
    private PermissionConflict permissionConflict;

    @NotNull
    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;
}
