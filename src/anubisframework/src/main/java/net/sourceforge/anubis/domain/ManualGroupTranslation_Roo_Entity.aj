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
import net.sourceforge.anubis.domain.ManualGroupTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ManualGroupTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long ManualGroupTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer ManualGroupTranslation.version;
    
    public Long ManualGroupTranslation.getUid() {
        return this.uid;
    }
    
    public void ManualGroupTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer ManualGroupTranslation.getVersion() {
        return this.version;
    }
    
    public void ManualGroupTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ManualGroupTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ManualGroupTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ManualGroupTranslation attached = this.entityManager.find(ManualGroupTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ManualGroupTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ManualGroupTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ManualGroupTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager ManualGroupTranslation.entityManager() {
        EntityManager em = new ManualGroupTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ManualGroupTranslation.countManualGroupTranslations() {
        return (Long) entityManager().createQuery("select count(o) from ManualGroupTranslation o").getSingleResult();
    }
    
    public static List<ManualGroupTranslation> ManualGroupTranslation.findAllManualGroupTranslations() {
        return entityManager().createQuery("select o from ManualGroupTranslation o").getResultList();
    }
    
    public static ManualGroupTranslation ManualGroupTranslation.findManualGroupTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(ManualGroupTranslation.class, id);
    }
    
    public static List<ManualGroupTranslation> ManualGroupTranslation.findManualGroupTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ManualGroupTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
