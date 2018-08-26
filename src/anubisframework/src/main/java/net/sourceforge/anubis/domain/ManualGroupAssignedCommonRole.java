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
import net.sourceforge.anubis.domain.CommonRole;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_manual_group_assigned_common_role")
public class ManualGroupAssignedCommonRole {

    @NotNull
    @ManyToOne(targetEntity = ManualGroup.class)
    @JoinColumn(name = "manual_group_uid")
    private ManualGroup manualGroup;

    @NotNull
    @ManyToOne(targetEntity = CommonRole.class)
    @JoinColumn(name = "common_role_uid")
    private CommonRole commonRole;
}
