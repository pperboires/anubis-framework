package net.sourceforge.anubis.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import net.sourceforge.anubis.domain.Permission;
import javax.validation.constraints.NotNull;
import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_permission_conflict")
public class PermissionConflict {

    @NotNull
    @ManyToOne(targetEntity = Permission.class)
    @JoinColumn(name = "permission_uid")
    private Permission permission;

    @NotNull
    @ManyToOne(targetEntity = Permission.class)
    @JoinColumn(name = "permission_conflicted_uid")
    private Permission permissionConflicted;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "permissionConflict")
    private Set<PermissionConflictTranslation> translations = new HashSet<PermissionConflictTranslation>();
    
}
