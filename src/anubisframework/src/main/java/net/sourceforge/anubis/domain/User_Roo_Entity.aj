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
import net.sourceforge.anubis.domain.User;
import org.springframework.transaction.annotation.Transactional;

privileged aspect User_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager User.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long User.uid;
    
    @Version
    @Column(name = "version")
    private Integer User.version;
    
    public Long User.getUid() {
        return this.uid;
    }
    
    public void User.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer User.getVersion() {
        return this.version;
    }
    
    public void User.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void User.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void User.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            User attached = this.entityManager.find(User.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void User.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void User.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        User merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager User.entityManager() {
        EntityManager em = new User().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long User.countUsers() {
        return (Long) entityManager().createQuery("select count(o) from User o").getSingleResult();
    }
    
    public static List<User> User.findAllUsers() {
        return entityManager().createQuery("select o from User o").getResultList();
    }
    
    public static User User.findUser(Long id) {
        if (id == null) return null;
        return entityManager().find(User.class, id);
    }
    
    public static List<User> User.findUserEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from User o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
