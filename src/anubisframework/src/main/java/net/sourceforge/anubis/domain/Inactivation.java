package net.sourceforge.anubis.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import net.sourceforge.anubis.domain.Validity;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_inactivation")
public class Inactivation {

    @ManyToOne(targetEntity = Validity.class)
    @JoinColumn(name = "validity_uid")
    private Validity validity;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "inactivation")
    private Set<InactivationTranslation> translations = new HashSet<InactivationTranslation>();
    
}
