package net.sourceforge.anubis.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import net.sourceforge.anubis.domain.Application;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_administrative_role")
public class AdministrativeRole {

    @NotNull
    @Column(name = "id")
    private String id;

    @NotNull
    @ManyToOne(targetEntity = Application.class)
    @JoinColumn(name = "application_uid")
    private Application application;

    @NotNull
    @Column(name = "enabled")
    private Boolean enabled;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "administrativeRole")
    private Set<AdministrativeRoleTranslation> translations = new HashSet<AdministrativeRoleTranslation>();
    
}
