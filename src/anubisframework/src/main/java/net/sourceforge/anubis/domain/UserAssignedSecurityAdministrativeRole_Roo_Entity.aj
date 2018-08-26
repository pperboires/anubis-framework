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
import net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAssignedSecurityAdministrativeRole_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager UserAssignedSecurityAdministrativeRole.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long UserAssignedSecurityAdministrativeRole.uid;
    
    @Version
    @Column(name = "version")
    private Integer UserAssignedSecurityAdministrativeRole.version;
    
    public Long UserAssignedSecurityAdministrativeRole.getUid() {
        return this.uid;
    }
    
    public void UserAssignedSecurityAdministrativeRole.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer UserAssignedSecurityAdministrativeRole.getVersion() {
        return this.version;
    }
    
    public void UserAssignedSecurityAdministrativeRole.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void UserAssignedSecurityAdministrativeRole.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserAssignedSecurityAdministrativeRole.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserAssignedSecurityAdministrativeRole attached = this.entityManager.find(UserAssignedSecurityAdministrativeRole.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserAssignedSecurityAdministrativeRole.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UserAssignedSecurityAdministrativeRole.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserAssignedSecurityAdministrativeRole merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager UserAssignedSecurityAdministrativeRole.entityManager() {
        EntityManager em = new UserAssignedSecurityAdministrativeRole().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserAssignedSecurityAdministrativeRole.countUserAssignedSecurityAdministrativeRoles() {
        return (Long) entityManager().createQuery("select count(o) from UserAssignedSecurityAdministrativeRole o").getSingleResult();
    }
    
    public static List<UserAssignedSecurityAdministrativeRole> UserAssignedSecurityAdministrativeRole.findAllUserAssignedSecurityAdministrativeRoles() {
        return entityManager().createQuery("select o from UserAssignedSecurityAdministrativeRole o").getResultList();
    }
    
    public static UserAssignedSecurityAdministrativeRole UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRole(Long id) {
        if (id == null) return null;
        return entityManager().find(UserAssignedSecurityAdministrativeRole.class, id);
    }
    
    public static List<UserAssignedSecurityAdministrativeRole> UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRoleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from UserAssignedSecurityAdministrativeRole o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
