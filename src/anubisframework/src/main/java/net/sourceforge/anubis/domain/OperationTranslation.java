package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.persistence.Column;
import net.sourceforge.anubis.domain.Operation;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.validation.constraints.NotNull;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_operation_translation")
public class OperationTranslation {

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @ManyToOne(targetEntity = Operation.class)
    @JoinColumn(name = "operation_uid")
    private Operation operation;
    
    @NotNull
    @ManyToOne(targetEntity = Locale.class)
    @JoinColumn(name = "locale_uid")
    private Locale locale;
    
}
