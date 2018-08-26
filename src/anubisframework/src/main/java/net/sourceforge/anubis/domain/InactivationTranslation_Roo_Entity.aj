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
import net.sourceforge.anubis.domain.InactivationTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect InactivationTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager InactivationTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long InactivationTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer InactivationTranslation.version;
    
    public Long InactivationTranslation.getUid() {
        return this.uid;
    }
    
    public void InactivationTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer InactivationTranslation.getVersion() {
        return this.version;
    }
    
    public void InactivationTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void InactivationTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void InactivationTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            InactivationTranslation attached = this.entityManager.find(InactivationTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void InactivationTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void InactivationTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        InactivationTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager InactivationTranslation.entityManager() {
        EntityManager em = new InactivationTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long InactivationTranslation.countInactivationTranslations() {
        return (Long) entityManager().createQuery("select count(o) from InactivationTranslation o").getSingleResult();
    }
    
    public static List<InactivationTranslation> InactivationTranslation.findAllInactivationTranslations() {
        return entityManager().createQuery("select o from InactivationTranslation o").getResultList();
    }
    
    public static InactivationTranslation InactivationTranslation.findInactivationTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(InactivationTranslation.class, id);
    }
    
    public static List<InactivationTranslation> InactivationTranslation.findInactivationTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from InactivationTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
