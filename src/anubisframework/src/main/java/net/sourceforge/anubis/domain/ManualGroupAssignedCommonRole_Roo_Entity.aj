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
import net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupAssignedCommonRole_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ManualGroupAssignedCommonRole.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long ManualGroupAssignedCommonRole.uid;
    
    @Version
    @Column(name = "version")
    private Integer ManualGroupAssignedCommonRole.version;
    
    public Long ManualGroupAssignedCommonRole.getUid() {
        return this.uid;
    }
    
    public void ManualGroupAssignedCommonRole.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer ManualGroupAssignedCommonRole.getVersion() {
        return this.version;
    }
    
    public void ManualGroupAssignedCommonRole.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ManualGroupAssignedCommonRole.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ManualGroupAssignedCommonRole.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ManualGroupAssignedCommonRole attached = this.entityManager.find(ManualGroupAssignedCommonRole.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ManualGroupAssignedCommonRole.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ManualGroupAssignedCommonRole.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ManualGroupAssignedCommonRole merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager ManualGroupAssignedCommonRole.entityManager() {
        EntityManager em = new ManualGroupAssignedCommonRole().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ManualGroupAssignedCommonRole.countManualGroupAssignedCommonRoles() {
        return (Long) entityManager().createQuery("select count(o) from ManualGroupAssignedCommonRole o").getSingleResult();
    }
    
    public static List<ManualGroupAssignedCommonRole> ManualGroupAssignedCommonRole.findAllManualGroupAssignedCommonRoles() {
        return entityManager().createQuery("select o from ManualGroupAssignedCommonRole o").getResultList();
    }
    
    public static ManualGroupAssignedCommonRole ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRole(Long id) {
        if (id == null) return null;
        return entityManager().find(ManualGroupAssignedCommonRole.class, id);
    }
    
    public static List<ManualGroupAssignedCommonRole> ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRoleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ManualGroupAssignedCommonRole o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
