package net.sourceforge.anubis.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Column;
import net.sourceforge.anubis.domain.Application;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_manual_group")
public class ManualGroup {

    @Column(name = "id")
    private String id;

    @NotNull
    @ManyToOne(targetEntity = Application.class)
    @JoinColumn(name = "application_uid")
    private Application application;

    @NotNull
    @Column(name = "enabled")
    private Boolean enabled;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "manualGroup")
    private Set<ManualGroupTranslation> translations = new HashSet<ManualGroupTranslation>();
    
}
