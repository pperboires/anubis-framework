package net.sourceforge.anubis.domain;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import net.sourceforge.anubis.domain.UserAccount;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAccount_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager UserAccount.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long UserAccount.uid;
    
    @Version
    @Column(name = "version")
    private Integer UserAccount.version;
    
    public Long UserAccount.getUid() {
        return this.uid;
    }
    
    public void UserAccount.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer UserAccount.getVersion() {
        return this.version;
    }
    
    public void UserAccount.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void UserAccount.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserAccount.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserAccount attached = this.entityManager.find(UserAccount.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserAccount.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UserAccount.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserAccount merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager UserAccount.entityManager() {
        EntityManager em = new UserAccount().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserAccount.countUserAccounts() {
        return (Long) entityManager().createQuery("select count(o) from UserAccount o").getSingleResult();
    }
    
    public static List<UserAccount> UserAccount.findAllUserAccounts() {
        return entityManager().createQuery("select o from UserAccount o").getResultList();
    }
    
    public static UserAccount UserAccount.findUserAccount(Long id) {
        if (id == null) return null;
        return entityManager().find(UserAccount.class, id);
    }
    
    public static List<UserAccount> UserAccount.findUserAccountEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from UserAccount o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
