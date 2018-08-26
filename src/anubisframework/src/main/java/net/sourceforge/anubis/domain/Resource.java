package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Column;
import net.sourceforge.anubis.domain.Application;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import java.util.Set;
import net.sourceforge.anubis.domain.ResourceTranslation;
import java.util.HashSet;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;
import javax.validation.constraints.NotNull;

import net.sourceforge.anubis.domain.ResourceType;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_resource")
public class Resource {

    @Column(name = "id")
    private String id;

    @Column(name = "enabled")
    private Boolean enabled;

    @ManyToOne(targetEntity = Resource.class)
    @JoinColumn(name = "parent_uid")
    private Resource parent;
    
    @ManyToOne(targetEntity = Application.class)
    @JoinColumn(name = "application_uid")
    private Application application;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "resource")
    private Set<ResourceTranslation> translations = new HashSet<ResourceTranslation>();

    @ManyToOne(targetEntity = ResourceType.class)
    @JoinColumn(name = "type_uid")
    private ResourceType type;
}
