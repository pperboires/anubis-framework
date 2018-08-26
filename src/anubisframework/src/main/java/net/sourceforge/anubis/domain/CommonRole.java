package net.sourceforge.anubis.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_common_role")
public class CommonRole {

    @Column(name = "id")
    private String id;
    
    @NotNull
    @ManyToOne(targetEntity = Application.class)
    @JoinColumn(name = "application_uid")
    private Application application;
    
    @NotNull
    @Column(name = "enabled")
    private Boolean enabled;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "commonRole")
    private Set<CommonRoleTranslation> translations = new HashSet<CommonRoleTranslation>();
    
}
