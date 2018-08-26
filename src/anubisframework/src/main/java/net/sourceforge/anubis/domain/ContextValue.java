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
import net.sourceforge.anubis.domain.Context;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_context_value")
public class ContextValue {

    @NotNull
    @Column(name = "id")
    private String id;

    @NotNull
    @ManyToOne(targetEntity = Context.class)
    @JoinColumn(name = "context_uid")
    private Context context;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "contextValue")
    private Set<ContextValueTranslation> translations = new HashSet<ContextValueTranslation>();
    
}
