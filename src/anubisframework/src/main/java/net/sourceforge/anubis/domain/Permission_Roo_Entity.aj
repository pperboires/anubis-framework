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
import net.sourceforge.anubis.domain.Permission;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Permission_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Permission.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long Permission.uid;
    
    @Version
    @Column(name = "version")
    private Integer Permission.version;
    
    public Long Permission.getUid() {
        return this.uid;
    }
    
    public void Permission.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer Permission.getVersion() {
        return this.version;
    }
    
    public void Permission.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Permission.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Permission.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Permission attached = this.entityManager.find(Permission.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Permission.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Permission.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Permission merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager Permission.entityManager() {
        EntityManager em = new Permission().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Permission.countPermissions() {
        return (Long) entityManager().createQuery("select count(o) from Permission o").getSingleResult();
    }
    
    public static List<Permission> Permission.findAllPermissions() {
        return entityManager().createQuery("select o from Permission o").getResultList();
    }
    
    public static Permission Permission.findPermission(Long id) {
        if (id == null) return null;
        return entityManager().find(Permission.class, id);
    }
    
    public static List<Permission> Permission.findPermissionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Permission o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
