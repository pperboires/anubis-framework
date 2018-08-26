package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import java.util.Set;
import net.sourceforge.anubis.domain.ResourceTypeTranslation;
import java.util.HashSet;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid")
@Table(name = "tb_resource_type")
public class ResourceType {

    @NotNull
    @Column(name = "id")
    private String id;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "resourceType")
    private Set<ResourceTypeTranslation> translations = new HashSet<ResourceTypeTranslation>();
}
