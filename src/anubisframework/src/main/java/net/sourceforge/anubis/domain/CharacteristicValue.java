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
import net.sourceforge.anubis.domain.Characteristic;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_characteristic_value")
public class CharacteristicValue {

    @NotNull
    @Column(name = "id")
    private String id;

    @NotNull
    @ManyToOne(targetEntity = Characteristic.class)
    @JoinColumn(name = "characteristic_uid")
    private Characteristic characteristic;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "characteristicValue")
    private Set<CharacteristicValueTranslation> translations = new HashSet<CharacteristicValueTranslation>();
    
}
