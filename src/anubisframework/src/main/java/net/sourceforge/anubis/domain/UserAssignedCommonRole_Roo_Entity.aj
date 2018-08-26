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
import net.sourceforge.anubis.domain.UserAssignedCommonRole;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAssignedCommonRole_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager UserAssignedCommonRole.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long UserAssignedCommonRole.uid;
    
    @Version
    @Column(name = "version")
    private Integer UserAssignedCommonRole.version;
    
    public Long UserAssignedCommonRole.getUid() {
        return this.uid;
    }
    
    public void UserAssignedCommonRole.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer UserAssignedCommonRole.getVersion() {
        return this.version;
    }
    
    public void UserAssignedCommonRole.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void UserAssignedCommonRole.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserAssignedCommonRole.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserAssignedCommonRole attached = this.entityManager.find(UserAssignedCommonRole.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserAssignedCommonRole.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UserAssignedCommonRole.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserAssignedCommonRole merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager UserAssignedCommonRole.entityManager() {
        EntityManager em = new UserAssignedCommonRole().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserAssignedCommonRole.countUserAssignedCommonRoles() {
        return (Long) entityManager().createQuery("select count(o) from UserAssignedCommonRole o").getSingleResult();
    }
    
    public static List<UserAssignedCommonRole> UserAssignedCommonRole.findAllUserAssignedCommonRoles() {
        return entityManager().createQuery("select o from UserAssignedCommonRole o").getResultList();
    }
    
    public static UserAssignedCommonRole UserAssignedCommonRole.findUserAssignedCommonRole(Long id) {
        if (id == null) return null;
        return entityManager().find(UserAssignedCommonRole.class, id);
    }
    
    public static List<UserAssignedCommonRole> UserAssignedCommonRole.findUserAssignedCommonRoleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from UserAssignedCommonRole o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
