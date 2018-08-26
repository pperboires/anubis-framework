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
import net.sourceforge.anubis.domain.ResourceType;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ResourceType_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ResourceType.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long ResourceType.uid;
    
    @Version
    @Column(name = "version")
    private Integer ResourceType.version;
    
    public Long ResourceType.getUid() {
        return this.uid;
    }
    
    public void ResourceType.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer ResourceType.getVersion() {
        return this.version;
    }
    
    public void ResourceType.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ResourceType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ResourceType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ResourceType attached = this.entityManager.find(ResourceType.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ResourceType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ResourceType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ResourceType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager ResourceType.entityManager() {
        EntityManager em = new ResourceType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ResourceType.countResourceTypes() {
        return (Long) entityManager().createQuery("select count(o) from ResourceType o").getSingleResult();
    }
    
    public static List<ResourceType> ResourceType.findAllResourceTypes() {
        return entityManager().createQuery("select o from ResourceType o").getResultList();
    }
    
    public static ResourceType ResourceType.findResourceType(Long id) {
        if (id == null) return null;
        return entityManager().find(ResourceType.class, id);
    }
    
    public static List<ResourceType> ResourceType.findResourceTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ResourceType o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
