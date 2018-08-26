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
import net.sourceforge.anubis.domain.UserInactivation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserInactivation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager UserInactivation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long UserInactivation.uid;
    
    @Version
    @Column(name = "version")
    private Integer UserInactivation.version;
    
    public Long UserInactivation.getUid() {
        return this.uid;
    }
    
    public void UserInactivation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer UserInactivation.getVersion() {
        return this.version;
    }
    
    public void UserInactivation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void UserInactivation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserInactivation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserInactivation attached = this.entityManager.find(UserInactivation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserInactivation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UserInactivation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserInactivation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager UserInactivation.entityManager() {
        EntityManager em = new UserInactivation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserInactivation.countUserInactivations() {
        return (Long) entityManager().createQuery("select count(o) from UserInactivation o").getSingleResult();
    }
    
    public static List<UserInactivation> UserInactivation.findAllUserInactivations() {
        return entityManager().createQuery("select o from UserInactivation o").getResultList();
    }
    
    public static UserInactivation UserInactivation.findUserInactivation(Long id) {
        if (id == null) return null;
        return entityManager().find(UserInactivation.class, id);
    }
    
    public static List<UserInactivation> UserInactivation.findUserInactivationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from UserInactivation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
