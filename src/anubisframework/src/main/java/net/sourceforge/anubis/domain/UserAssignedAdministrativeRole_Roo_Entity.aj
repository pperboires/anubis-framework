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
import net.sourceforge.anubis.domain.UserAssignedAdministrativeRole;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAssignedAdministrativeRole_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager UserAssignedAdministrativeRole.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long UserAssignedAdministrativeRole.uid;
    
    @Version
    @Column(name = "version")
    private Integer UserAssignedAdministrativeRole.version;
    
    public Long UserAssignedAdministrativeRole.getUid() {
        return this.uid;
    }
    
    public void UserAssignedAdministrativeRole.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer UserAssignedAdministrativeRole.getVersion() {
        return this.version;
    }
    
    public void UserAssignedAdministrativeRole.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void UserAssignedAdministrativeRole.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserAssignedAdministrativeRole.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserAssignedAdministrativeRole attached = this.entityManager.find(UserAssignedAdministrativeRole.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserAssignedAdministrativeRole.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UserAssignedAdministrativeRole.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserAssignedAdministrativeRole merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager UserAssignedAdministrativeRole.entityManager() {
        EntityManager em = new UserAssignedAdministrativeRole().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserAssignedAdministrativeRole.countUserAssignedAdministrativeRoles() {
        return (Long) entityManager().createQuery("select count(o) from UserAssignedAdministrativeRole o").getSingleResult();
    }
    
    public static List<UserAssignedAdministrativeRole> UserAssignedAdministrativeRole.findAllUserAssignedAdministrativeRoles() {
        return entityManager().createQuery("select o from UserAssignedAdministrativeRole o").getResultList();
    }
    
    public static UserAssignedAdministrativeRole UserAssignedAdministrativeRole.findUserAssignedAdministrativeRole(Long id) {
        if (id == null) return null;
        return entityManager().find(UserAssignedAdministrativeRole.class, id);
    }
    
    public static List<UserAssignedAdministrativeRole> UserAssignedAdministrativeRole.findUserAssignedAdministrativeRoleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from UserAssignedAdministrativeRole o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
