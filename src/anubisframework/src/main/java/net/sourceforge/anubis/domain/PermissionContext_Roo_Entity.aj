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
import net.sourceforge.anubis.domain.PermissionContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionContext_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager PermissionContext.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long PermissionContext.uid;
    
    @Version
    @Column(name = "version")
    private Integer PermissionContext.version;
    
    public Long PermissionContext.getUid() {
        return this.uid;
    }
    
    public void PermissionContext.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer PermissionContext.getVersion() {
        return this.version;
    }
    
    public void PermissionContext.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void PermissionContext.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PermissionContext.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PermissionContext attached = this.entityManager.find(PermissionContext.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PermissionContext.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PermissionContext.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PermissionContext merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager PermissionContext.entityManager() {
        EntityManager em = new PermissionContext().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PermissionContext.countPermissionContexts() {
        return (Long) entityManager().createQuery("select count(o) from PermissionContext o").getSingleResult();
    }
    
    public static List<PermissionContext> PermissionContext.findAllPermissionContexts() {
        return entityManager().createQuery("select o from PermissionContext o").getResultList();
    }
    
    public static PermissionContext PermissionContext.findPermissionContext(Long id) {
        if (id == null) return null;
        return entityManager().find(PermissionContext.class, id);
    }
    
    public static List<PermissionContext> PermissionContext.findPermissionContextEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from PermissionContext o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
