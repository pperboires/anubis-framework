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
import net.sourceforge.anubis.domain.ResourceTypeTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ResourceTypeTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ResourceTypeTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long ResourceTypeTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer ResourceTypeTranslation.version;
    
    public Long ResourceTypeTranslation.getUid() {
        return this.uid;
    }
    
    public void ResourceTypeTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer ResourceTypeTranslation.getVersion() {
        return this.version;
    }
    
    public void ResourceTypeTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ResourceTypeTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ResourceTypeTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ResourceTypeTranslation attached = this.entityManager.find(ResourceTypeTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ResourceTypeTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ResourceTypeTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ResourceTypeTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager ResourceTypeTranslation.entityManager() {
        EntityManager em = new ResourceTypeTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ResourceTypeTranslation.countResourceTypeTranslations() {
        return (Long) entityManager().createQuery("select count(o) from ResourceTypeTranslation o").getSingleResult();
    }
    
    public static List<ResourceTypeTranslation> ResourceTypeTranslation.findAllResourceTypeTranslations() {
        return entityManager().createQuery("select o from ResourceTypeTranslation o").getResultList();
    }
    
    public static ResourceTypeTranslation ResourceTypeTranslation.findResourceTypeTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(ResourceTypeTranslation.class, id);
    }
    
    public static List<ResourceTypeTranslation> ResourceTypeTranslation.findResourceTypeTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ResourceTypeTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
