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
import net.sourceforge.anubis.domain.OperationTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OperationTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager OperationTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long OperationTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer OperationTranslation.version;
    
    public Long OperationTranslation.getUid() {
        return this.uid;
    }
    
    public void OperationTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer OperationTranslation.getVersion() {
        return this.version;
    }
    
    public void OperationTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void OperationTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void OperationTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            OperationTranslation attached = this.entityManager.find(OperationTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void OperationTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void OperationTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        OperationTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager OperationTranslation.entityManager() {
        EntityManager em = new OperationTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long OperationTranslation.countOperationTranslations() {
        return (Long) entityManager().createQuery("select count(o) from OperationTranslation o").getSingleResult();
    }
    
    public static List<OperationTranslation> OperationTranslation.findAllOperationTranslations() {
        return entityManager().createQuery("select o from OperationTranslation o").getResultList();
    }
    
    public static OperationTranslation OperationTranslation.findOperationTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(OperationTranslation.class, id);
    }
    
    public static List<OperationTranslation> OperationTranslation.findOperationTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from OperationTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
