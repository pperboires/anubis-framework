package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import java.lang.Long;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import net.sourceforge.anubis.domain.ApplicationAccount;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid", identifierType = Long.class)
@Table(name = "tb_application")
public class Application {

    @NotNull
    @Column(name = "id")
    private String id;

    @NotNull
    @Column(name = "name")
    private String name;

    @NotNull
    @ManyToOne(targetEntity = ApplicationAccount.class, cascade=CascadeType.ALL)
    @JoinColumn(name = "application_account_uid")
    private ApplicationAccount account;
}
