package net.sourceforge.anubis.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_characterized_group")
public class CharacterizedGroup {

    @Column(name = "id")
    private String id;

    @NotNull
    @Column(name = "enabled")
    private Boolean enabled;
    
    @NotNull
    @ManyToOne(targetEntity = Application.class)
    @JoinColumn(name = "application_uid")
    private Application application;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "characterizedGroup")
    private Set<CharacterizedGroupTranslation> translations = new HashSet<CharacterizedGroupTranslation>();
    
}
