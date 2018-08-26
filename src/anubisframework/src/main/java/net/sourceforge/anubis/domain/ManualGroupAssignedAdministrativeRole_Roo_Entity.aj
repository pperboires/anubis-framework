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
import net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupAssignedAdministrativeRole_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ManualGroupAssignedAdministrativeRole.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long ManualGroupAssignedAdministrativeRole.uid;
    
    @Version
    @Column(name = "version")
    private Integer ManualGroupAssignedAdministrativeRole.version;
    
    public Long ManualGroupAssignedAdministrativeRole.getUid() {
        return this.uid;
    }
    
    public void ManualGroupAssignedAdministrativeRole.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer ManualGroupAssignedAdministrativeRole.getVersion() {
        return this.version;
    }
    
    public void ManualGroupAssignedAdministrativeRole.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ManualGroupAssignedAdministrativeRole.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ManualGroupAssignedAdministrativeRole.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ManualGroupAssignedAdministrativeRole attached = this.entityManager.find(ManualGroupAssignedAdministrativeRole.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ManualGroupAssignedAdministrativeRole.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ManualGroupAssignedAdministrativeRole.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ManualGroupAssignedAdministrativeRole merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager ManualGroupAssignedAdministrativeRole.entityManager() {
        EntityManager em = new ManualGroupAssignedAdministrativeRole().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ManualGroupAssignedAdministrativeRole.countManualGroupAssignedAdministrativeRoles() {
        return (Long) entityManager().createQuery("select count(o) from ManualGroupAssignedAdministrativeRole o").getSingleResult();
    }
    
    public static List<ManualGroupAssignedAdministrativeRole> ManualGroupAssignedAdministrativeRole.findAllManualGroupAssignedAdministrativeRoles() {
        return entityManager().createQuery("select o from ManualGroupAssignedAdministrativeRole o").getResultList();
    }
    
    public static ManualGroupAssignedAdministrativeRole ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRole(Long id) {
        if (id == null) return null;
        return entityManager().find(ManualGroupAssignedAdministrativeRole.class, id);
    }
    
    public static List<ManualGroupAssignedAdministrativeRole> ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRoleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ManualGroupAssignedAdministrativeRole o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
