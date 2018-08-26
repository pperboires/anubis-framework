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
import net.sourceforge.anubis.domain.Resource;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Resource_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Resource.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long Resource.uid;
    
    @Version
    @Column(name = "version")
    private Integer Resource.version;
    
    public Long Resource.getUid() {
        return this.uid;
    }
    
    public void Resource.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer Resource.getVersion() {
        return this.version;
    }
    
    public void Resource.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Resource.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Resource.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Resource attached = this.entityManager.find(Resource.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Resource.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Resource.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Resource merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager Resource.entityManager() {
        EntityManager em = new Resource().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Resource.countResources() {
        return (Long) entityManager().createQuery("select count(o) from Resource o").getSingleResult();
    }
    
    public static List<Resource> Resource.findAllResources() {
        return entityManager().createQuery("select o from Resource o").getResultList();
    }
    
    public static Resource Resource.findResource(Long id) {
        if (id == null) return null;
        return entityManager().find(Resource.class, id);
    }
    
    public static List<Resource> Resource.findResourceEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Resource o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
