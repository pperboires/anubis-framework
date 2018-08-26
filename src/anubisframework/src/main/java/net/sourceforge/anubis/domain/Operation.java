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
import net.sourceforge.anubis.domain.OperationTranslation;
import java.util.HashSet;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_operation")
public class Operation {

    @Column(name = "id")
    private String id;

    @ManyToOne(targetEntity = Application.class)
    @JoinColumn(name = "application_uid")
    private Application application;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "operation")
    private Set<OperationTranslation> translations = new HashSet<OperationTranslation>();
}
