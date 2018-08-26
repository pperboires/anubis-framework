package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Column;
import net.sourceforge.anubis.domain.Operation;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import net.sourceforge.anubis.domain.Resource;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_permission")
public class Permission {

    @Column(name = "enabled")
    private Boolean enabled;

    @Column(name = "contextualized")
    private Boolean contextualized;

    @Column(name = "audited")
    private Boolean audited;

    @ManyToOne(targetEntity = Operation.class)
    @JoinColumn(name = "operation_uid")
    private Operation operation;

    @ManyToOne(targetEntity = Resource.class)
    @JoinColumn(name = "resource_uid")
    private Resource resource;

}