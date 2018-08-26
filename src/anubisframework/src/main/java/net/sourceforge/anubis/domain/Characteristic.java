package net.sourceforge.anubis.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_characteristic")
public class Characteristic {

    @NotNull
    @Column(name = "id")
    private String id;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "characteristic")
    private Set<CharacteristicTranslation> translations = new HashSet<CharacteristicTranslation>();
    
}
