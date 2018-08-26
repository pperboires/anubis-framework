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
import net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAssignedCommonRoleContextualization_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager UserAssignedCommonRoleContextualization.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long UserAssignedCommonRoleContextualization.uid;
    
    @Version
    @Column(name = "version")
    private Integer UserAssignedCommonRoleContextualization.version;
    
    public Long UserAssignedCommonRoleContextualization.getUid() {
        return this.uid;
    }
    
    public void UserAssignedCommonRoleContextualization.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer UserAssignedCommonRoleContextualization.getVersion() {
        return this.version;
    }
    
    public void UserAssignedCommonRoleContextualization.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void UserAssignedCommonRoleContextualization.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserAssignedCommonRoleContextualization.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserAssignedCommonRoleContextualization attached = this.entityManager.find(UserAssignedCommonRoleContextualization.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserAssignedCommonRoleContextualization.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UserAssignedCommonRoleContextualization.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserAssignedCommonRoleContextualization merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager UserAssignedCommonRoleContextualization.entityManager() {
        EntityManager em = new UserAssignedCommonRoleContextualization().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserAssignedCommonRoleContextualization.countUserAssignedCommonRoleContextualizations() {
        return (Long) entityManager().createQuery("select count(o) from UserAssignedCommonRoleContextualization o").getSingleResult();
    }
    
    public static List<UserAssignedCommonRoleContextualization> UserAssignedCommonRoleContextualization.findAllUserAssignedCommonRoleContextualizations() {
        return entityManager().createQuery("select o from UserAssignedCommonRoleContextualization o").getResultList();
    }
    
    public static UserAssignedCommonRoleContextualization UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualization(Long id) {
        if (id == null) return null;
        return entityManager().find(UserAssignedCommonRoleContextualization.class, id);
    }
    
    public static List<UserAssignedCommonRoleContextualization> UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualizationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from UserAssignedCommonRoleContextualization o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
