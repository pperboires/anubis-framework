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
import net.sourceforge.anubis.domain.AdministrativeRole;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AdministrativeRole_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager AdministrativeRole.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long AdministrativeRole.uid;
    
    @Version
    @Column(name = "version")
    private Integer AdministrativeRole.version;
    
    public Long AdministrativeRole.getUid() {
        return this.uid;
    }
    
    public void AdministrativeRole.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer AdministrativeRole.getVersion() {
        return this.version;
    }
    
    public void AdministrativeRole.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void AdministrativeRole.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void AdministrativeRole.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            AdministrativeRole attached = this.entityManager.find(AdministrativeRole.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void AdministrativeRole.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void AdministrativeRole.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        AdministrativeRole merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager AdministrativeRole.entityManager() {
        EntityManager em = new AdministrativeRole().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long AdministrativeRole.countAdministrativeRoles() {
        return (Long) entityManager().createQuery("select count(o) from AdministrativeRole o").getSingleResult();
    }
    
    public static List<AdministrativeRole> AdministrativeRole.findAllAdministrativeRoles() {
        return entityManager().createQuery("select o from AdministrativeRole o").getResultList();
    }
    
    public static AdministrativeRole AdministrativeRole.findAdministrativeRole(Long id) {
        if (id == null) return null;
        return entityManager().find(AdministrativeRole.class, id);
    }
    
    public static List<AdministrativeRole> AdministrativeRole.findAdministrativeRoleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from AdministrativeRole o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
