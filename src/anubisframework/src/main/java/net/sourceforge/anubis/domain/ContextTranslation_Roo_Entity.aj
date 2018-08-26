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
import net.sourceforge.anubis.domain.ContextTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContextTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ContextTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long ContextTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer ContextTranslation.version;
    
    public Long ContextTranslation.getUid() {
        return this.uid;
    }
    
    public void ContextTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer ContextTranslation.getVersion() {
        return this.version;
    }
    
    public void ContextTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ContextTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ContextTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ContextTranslation attached = this.entityManager.find(ContextTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ContextTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ContextTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ContextTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager ContextTranslation.entityManager() {
        EntityManager em = new ContextTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ContextTranslation.countContextTranslations() {
        return (Long) entityManager().createQuery("select count(o) from ContextTranslation o").getSingleResult();
    }
    
    public static List<ContextTranslation> ContextTranslation.findAllContextTranslations() {
        return entityManager().createQuery("select o from ContextTranslation o").getResultList();
    }
    
    public static ContextTranslation ContextTranslation.findContextTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(ContextTranslation.class, id);
    }
    
    public static List<ContextTranslation> ContextTranslation.findContextTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ContextTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
