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
import net.sourceforge.anubis.domain.CommonRoleAssignedPermission;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CommonRoleAssignedPermission_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CommonRoleAssignedPermission.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long CommonRoleAssignedPermission.uid;
    
    @Version
    @Column(name = "version")
    private Integer CommonRoleAssignedPermission.version;
    
    public Long CommonRoleAssignedPermission.getUid() {
        return this.uid;
    }
    
    public void CommonRoleAssignedPermission.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer CommonRoleAssignedPermission.getVersion() {
        return this.version;
    }
    
    public void CommonRoleAssignedPermission.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CommonRoleAssignedPermission.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CommonRoleAssignedPermission.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CommonRoleAssignedPermission attached = this.entityManager.find(CommonRoleAssignedPermission.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CommonRoleAssignedPermission.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CommonRoleAssignedPermission.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CommonRoleAssignedPermission merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager CommonRoleAssignedPermission.entityManager() {
        EntityManager em = new CommonRoleAssignedPermission().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CommonRoleAssignedPermission.countCommonRoleAssignedPermissions() {
        return (Long) entityManager().createQuery("select count(o) from CommonRoleAssignedPermission o").getSingleResult();
    }
    
    public static List<CommonRoleAssignedPermission> CommonRoleAssignedPermission.findAllCommonRoleAssignedPermissions() {
        return entityManager().createQuery("select o from CommonRoleAssignedPermission o").getResultList();
    }
    
    public static CommonRoleAssignedPermission CommonRoleAssignedPermission.findCommonRoleAssignedPermission(Long id) {
        if (id == null) return null;
        return entityManager().find(CommonRoleAssignedPermission.class, id);
    }
    
    public static List<CommonRoleAssignedPermission> CommonRoleAssignedPermission.findCommonRoleAssignedPermissionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CommonRoleAssignedPermission o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
