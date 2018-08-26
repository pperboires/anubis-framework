package net.sourceforge.anubis.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import net.sourceforge.anubis.domain.Locale;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import net.sourceforge.anubis.domain.UserAccount;

@Entity
@RooJavaBean
@RooToString
@RooEntity(identifierField = "uid", identifierColumn = "uid")
@Table(name = "tb_user")
public class User {

    @NotNull
    @Column(name = "name")
    private String name;

    @NotNull
    @ManyToOne(targetEntity = Locale.class)
    @JoinColumn(name = "preferred_locale_uid")
    private Locale preferredLocale;

    @NotNull
    @ManyToOne(targetEntity = UserAccount.class)
    @JoinColumn(name = "account_uid")
    private UserAccount account;
}
