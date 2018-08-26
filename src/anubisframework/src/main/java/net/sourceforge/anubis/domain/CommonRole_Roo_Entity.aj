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
import net.sourceforge.anubis.domain.CommonRole;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CommonRole_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CommonRole.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long CommonRole.uid;
    
    @Version
    @Column(name = "version")
    private Integer CommonRole.version;
    
    public Long CommonRole.getUid() {
        return this.uid;
    }
    
    public void CommonRole.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer CommonRole.getVersion() {
        return this.version;
    }
    
    public void CommonRole.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CommonRole.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CommonRole.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CommonRole attached = this.entityManager.find(CommonRole.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CommonRole.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CommonRole.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CommonRole merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager CommonRole.entityManager() {
        EntityManager em = new CommonRole().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CommonRole.countCommonRoles() {
        return (Long) entityManager().createQuery("select count(o) from CommonRole o").getSingleResult();
    }
    
    public static List<CommonRole> CommonRole.findAllCommonRoles() {
        return entityManager().createQuery("select o from CommonRole o").getResultList();
    }
    
    public static CommonRole CommonRole.findCommonRole(Long id) {
        if (id == null) return null;
        return entityManager().find(CommonRole.class, id);
    }
    
    public static List<CommonRole> CommonRole.findCommonRoleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CommonRole o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
