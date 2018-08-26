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
import net.sourceforge.anubis.domain.UserManualGroupMembership;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserManualGroupMembership_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager UserManualGroupMembership.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long UserManualGroupMembership.uid;
    
    @Version
    @Column(name = "version")
    private Integer UserManualGroupMembership.version;
    
    public Long UserManualGroupMembership.getUid() {
        return this.uid;
    }
    
    public void UserManualGroupMembership.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer UserManualGroupMembership.getVersion() {
        return this.version;
    }
    
    public void UserManualGroupMembership.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void UserManualGroupMembership.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserManualGroupMembership.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserManualGroupMembership attached = this.entityManager.find(UserManualGroupMembership.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserManualGroupMembership.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UserManualGroupMembership.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserManualGroupMembership merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager UserManualGroupMembership.entityManager() {
        EntityManager em = new UserManualGroupMembership().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserManualGroupMembership.countUserManualGroupMemberships() {
        return (Long) entityManager().createQuery("select count(o) from UserManualGroupMembership o").getSingleResult();
    }
    
    public static List<UserManualGroupMembership> UserManualGroupMembership.findAllUserManualGroupMemberships() {
        return entityManager().createQuery("select o from UserManualGroupMembership o").getResultList();
    }
    
    public static UserManualGroupMembership UserManualGroupMembership.findUserManualGroupMembership(Long id) {
        if (id == null) return null;
        return entityManager().find(UserManualGroupMembership.class, id);
    }
    
    public static List<UserManualGroupMembership> UserManualGroupMembership.findUserManualGroupMembershipEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from UserManualGroupMembership o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
