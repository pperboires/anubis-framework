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
import net.sourceforge.anubis.domain.ContextValue;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContextValue_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ContextValue.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long ContextValue.uid;
    
    @Version
    @Column(name = "version")
    private Integer ContextValue.version;
    
    public Long ContextValue.getUid() {
        return this.uid;
    }
    
    public void ContextValue.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer ContextValue.getVersion() {
        return this.version;
    }
    
    public void ContextValue.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ContextValue.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ContextValue.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ContextValue attached = this.entityManager.find(ContextValue.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ContextValue.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ContextValue.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ContextValue merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager ContextValue.entityManager() {
        EntityManager em = new ContextValue().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ContextValue.countContextValues() {
        return (Long) entityManager().createQuery("select count(o) from ContextValue o").getSingleResult();
    }
    
    public static List<ContextValue> ContextValue.findAllContextValues() {
        return entityManager().createQuery("select o from ContextValue o").getResultList();
    }
    
    public static ContextValue ContextValue.findContextValue(Long id) {
        if (id == null) return null;
        return entityManager().find(ContextValue.class, id);
    }
    
    public static List<ContextValue> ContextValue.findContextValueEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ContextValue o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
