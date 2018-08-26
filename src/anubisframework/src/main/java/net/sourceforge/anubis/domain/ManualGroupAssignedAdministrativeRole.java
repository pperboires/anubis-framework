package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import net.sourceforge.anubis.domain.ManualGroup;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import net.sourceforge.anubis.domain.AdministrativeRole;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_manual_group_assigned_administrative_role")
public class ManualGroupAssignedAdministrativeRole {

    @NotNull
    @ManyToOne(targetEntity = ManualGroup.class)
    @JoinColumn(name = "manual_group_uid")
    private ManualGroup manualGroup;

    @NotNull
    @ManyToOne(targetEntity = AdministrativeRole.class)
    @JoinColumn(name = "administrative_role_uid")
    private AdministrativeRole administrativeRole;
}
