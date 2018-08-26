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
import net.sourceforge.anubis.domain.ApplicationAccount;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ApplicationAccount_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ApplicationAccount.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long ApplicationAccount.uid;
    
    @Version
    @Column(name = "version")
    private Integer ApplicationAccount.version;
    
    public Long ApplicationAccount.getUid() {
        return this.uid;
    }
    
    public void ApplicationAccount.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer ApplicationAccount.getVersion() {
        return this.version;
    }
    
    public void ApplicationAccount.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ApplicationAccount.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ApplicationAccount.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ApplicationAccount attached = this.entityManager.find(ApplicationAccount.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ApplicationAccount.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ApplicationAccount.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ApplicationAccount merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager ApplicationAccount.entityManager() {
        EntityManager em = new ApplicationAccount().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ApplicationAccount.countApplicationAccounts() {
        return (Long) entityManager().createQuery("select count(o) from ApplicationAccount o").getSingleResult();
    }
    
    public static List<ApplicationAccount> ApplicationAccount.findAllApplicationAccounts() {
        return entityManager().createQuery("select o from ApplicationAccount o").getResultList();
    }
    
    public static ApplicationAccount ApplicationAccount.findApplicationAccount(Long id) {
        if (id == null) return null;
        return entityManager().find(ApplicationAccount.class, id);
    }
    
    public static List<ApplicationAccount> ApplicationAccount.findApplicationAccountEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ApplicationAccount o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
