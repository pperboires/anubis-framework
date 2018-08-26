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
import net.sourceforge.anubis.domain.ResourceTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ResourceTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ResourceTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long ResourceTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer ResourceTranslation.version;
    
    public Long ResourceTranslation.getUid() {
        return this.uid;
    }
    
    public void ResourceTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer ResourceTranslation.getVersion() {
        return this.version;
    }
    
    public void ResourceTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ResourceTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ResourceTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ResourceTranslation attached = this.entityManager.find(ResourceTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ResourceTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ResourceTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ResourceTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager ResourceTranslation.entityManager() {
        EntityManager em = new ResourceTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ResourceTranslation.countResourceTranslations() {
        return (Long) entityManager().createQuery("select count(o) from ResourceTranslation o").getSingleResult();
    }
    
    public static List<ResourceTranslation> ResourceTranslation.findAllResourceTranslations() {
        return entityManager().createQuery("select o from ResourceTranslation o").getResultList();
    }
    
    public static ResourceTranslation ResourceTranslation.findResourceTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(ResourceTranslation.class, id);
    }
    
    public static List<ResourceTranslation> ResourceTranslation.findResourceTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ResourceTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
