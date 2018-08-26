package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import net.sourceforge.anubis.domain.Locale;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import net.sourceforge.anubis.domain.ResourceType;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_resource_type_translation")
public class ResourceTypeTranslation {

    @NotNull
    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @ManyToOne(targetEntity = Locale.class)
    @JoinColumn(name = "locale_uid")
    private Locale locale;

    @ManyToOne(targetEntity = ResourceType.class)
    @JoinColumn(name = "resource_type_uid")
    private ResourceType resourceType;
}
