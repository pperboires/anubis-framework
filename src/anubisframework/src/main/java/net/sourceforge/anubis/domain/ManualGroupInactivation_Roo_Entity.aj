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
import net.sourceforge.anubis.domain.ManualGroupInactivation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupInactivation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ManualGroupInactivation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long ManualGroupInactivation.uid;
    
    @Version
    @Column(name = "version")
    private Integer ManualGroupInactivation.version;
    
    public Long ManualGroupInactivation.getUid() {
        return this.uid;
    }
    
    public void ManualGroupInactivation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer ManualGroupInactivation.getVersion() {
        return this.version;
    }
    
    public void ManualGroupInactivation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ManualGroupInactivation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ManualGroupInactivation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ManualGroupInactivation attached = this.entityManager.find(ManualGroupInactivation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ManualGroupInactivation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ManualGroupInactivation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ManualGroupInactivation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager ManualGroupInactivation.entityManager() {
        EntityManager em = new ManualGroupInactivation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ManualGroupInactivation.countManualGroupInactivations() {
        return (Long) entityManager().createQuery("select count(o) from ManualGroupInactivation o").getSingleResult();
    }
    
    public static List<ManualGroupInactivation> ManualGroupInactivation.findAllManualGroupInactivations() {
        return entityManager().createQuery("select o from ManualGroupInactivation o").getResultList();
    }
    
    public static ManualGroupInactivation ManualGroupInactivation.findManualGroupInactivation(Long id) {
        if (id == null) return null;
        return entityManager().find(ManualGroupInactivation.class, id);
    }
    
    public static List<ManualGroupInactivation> ManualGroupInactivation.findManualGroupInactivationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ManualGroupInactivation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
