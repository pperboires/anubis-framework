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
import net.sourceforge.anubis.domain.PermissionConflict;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionConflict_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager PermissionConflict.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long PermissionConflict.uid;
    
    @Version
    @Column(name = "version")
    private Integer PermissionConflict.version;
    
    public Long PermissionConflict.getUid() {
        return this.uid;
    }
    
    public void PermissionConflict.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer PermissionConflict.getVersion() {
        return this.version;
    }
    
    public void PermissionConflict.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void PermissionConflict.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PermissionConflict.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PermissionConflict attached = this.entityManager.find(PermissionConflict.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PermissionConflict.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PermissionConflict.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PermissionConflict merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager PermissionConflict.entityManager() {
        EntityManager em = new PermissionConflict().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PermissionConflict.countPermissionConflicts() {
        return (Long) entityManager().createQuery("select count(o) from PermissionConflict o").getSingleResult();
    }
    
    public static List<PermissionConflict> PermissionConflict.findAllPermissionConflicts() {
        return entityManager().createQuery("select o from PermissionConflict o").getResultList();
    }
    
    public static PermissionConflict PermissionConflict.findPermissionConflict(Long id) {
        if (id == null) return null;
        return entityManager().find(PermissionConflict.class, id);
    }
    
    public static List<PermissionConflict> PermissionConflict.findPermissionConflictEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from PermissionConflict o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
