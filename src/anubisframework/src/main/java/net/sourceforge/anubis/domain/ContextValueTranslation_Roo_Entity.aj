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
import net.sourceforge.anubis.domain.ContextValueTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContextValueTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ContextValueTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long ContextValueTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer ContextValueTranslation.version;
    
    public Long ContextValueTranslation.getUid() {
        return this.uid;
    }
    
    public void ContextValueTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer ContextValueTranslation.getVersion() {
        return this.version;
    }
    
    public void ContextValueTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ContextValueTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ContextValueTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ContextValueTranslation attached = this.entityManager.find(ContextValueTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ContextValueTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ContextValueTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ContextValueTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager ContextValueTranslation.entityManager() {
        EntityManager em = new ContextValueTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ContextValueTranslation.countContextValueTranslations() {
        return (Long) entityManager().createQuery("select count(o) from ContextValueTranslation o").getSingleResult();
    }
    
    public static List<ContextValueTranslation> ContextValueTranslation.findAllContextValueTranslations() {
        return entityManager().createQuery("select o from ContextValueTranslation o").getResultList();
    }
    
    public static ContextValueTranslation ContextValueTranslation.findContextValueTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(ContextValueTranslation.class, id);
    }
    
    public static List<ContextValueTranslation> ContextValueTranslation.findContextValueTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ContextValueTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
