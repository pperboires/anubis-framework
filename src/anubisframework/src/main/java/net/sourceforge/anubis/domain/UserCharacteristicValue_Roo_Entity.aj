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
import net.sourceforge.anubis.domain.UserCharacteristicValue;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserCharacteristicValue_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager UserCharacteristicValue.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long UserCharacteristicValue.uid;
    
    @Version
    @Column(name = "version")
    private Integer UserCharacteristicValue.version;
    
    public Long UserCharacteristicValue.getUid() {
        return this.uid;
    }
    
    public void UserCharacteristicValue.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer UserCharacteristicValue.getVersion() {
        return this.version;
    }
    
    public void UserCharacteristicValue.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void UserCharacteristicValue.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserCharacteristicValue.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserCharacteristicValue attached = this.entityManager.find(UserCharacteristicValue.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserCharacteristicValue.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UserCharacteristicValue.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserCharacteristicValue merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager UserCharacteristicValue.entityManager() {
        EntityManager em = new UserCharacteristicValue().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserCharacteristicValue.countUserCharacteristicValues() {
        return (Long) entityManager().createQuery("select count(o) from UserCharacteristicValue o").getSingleResult();
    }
    
    public static List<UserCharacteristicValue> UserCharacteristicValue.findAllUserCharacteristicValues() {
        return entityManager().createQuery("select o from UserCharacteristicValue o").getResultList();
    }
    
    public static UserCharacteristicValue UserCharacteristicValue.findUserCharacteristicValue(Long id) {
        if (id == null) return null;
        return entityManager().find(UserCharacteristicValue.class, id);
    }
    
    public static List<UserCharacteristicValue> UserCharacteristicValue.findUserCharacteristicValueEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from UserCharacteristicValue o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
