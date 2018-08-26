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
import net.sourceforge.anubis.domain.AdministrativeRoleTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AdministrativeRoleTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager AdministrativeRoleTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long AdministrativeRoleTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer AdministrativeRoleTranslation.version;
    
    public Long AdministrativeRoleTranslation.getUid() {
        return this.uid;
    }
    
    public void AdministrativeRoleTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer AdministrativeRoleTranslation.getVersion() {
        return this.version;
    }
    
    public void AdministrativeRoleTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void AdministrativeRoleTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void AdministrativeRoleTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            AdministrativeRoleTranslation attached = this.entityManager.find(AdministrativeRoleTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void AdministrativeRoleTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void AdministrativeRoleTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        AdministrativeRoleTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager AdministrativeRoleTranslation.entityManager() {
        EntityManager em = new AdministrativeRoleTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long AdministrativeRoleTranslation.countAdministrativeRoleTranslations() {
        return (Long) entityManager().createQuery("select count(o) from AdministrativeRoleTranslation o").getSingleResult();
    }
    
    public static List<AdministrativeRoleTranslation> AdministrativeRoleTranslation.findAllAdministrativeRoleTranslations() {
        return entityManager().createQuery("select o from AdministrativeRoleTranslation o").getResultList();
    }
    
    public static AdministrativeRoleTranslation AdministrativeRoleTranslation.findAdministrativeRoleTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(AdministrativeRoleTranslation.class, id);
    }
    
    public static List<AdministrativeRoleTranslation> AdministrativeRoleTranslation.findAdministrativeRoleTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from AdministrativeRoleTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
