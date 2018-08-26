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
import net.sourceforge.anubis.domain.CommonRoleTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CommonRoleTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CommonRoleTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long CommonRoleTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer CommonRoleTranslation.version;
    
    public Long CommonRoleTranslation.getUid() {
        return this.uid;
    }
    
    public void CommonRoleTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer CommonRoleTranslation.getVersion() {
        return this.version;
    }
    
    public void CommonRoleTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CommonRoleTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CommonRoleTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CommonRoleTranslation attached = this.entityManager.find(CommonRoleTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CommonRoleTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CommonRoleTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CommonRoleTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager CommonRoleTranslation.entityManager() {
        EntityManager em = new CommonRoleTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CommonRoleTranslation.countCommonRoleTranslations() {
        return (Long) entityManager().createQuery("select count(o) from CommonRoleTranslation o").getSingleResult();
    }
    
    public static List<CommonRoleTranslation> CommonRoleTranslation.findAllCommonRoleTranslations() {
        return entityManager().createQuery("select o from CommonRoleTranslation o").getResultList();
    }
    
    public static CommonRoleTranslation CommonRoleTranslation.findCommonRoleTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(CommonRoleTranslation.class, id);
    }
    
    public static List<CommonRoleTranslation> CommonRoleTranslation.findCommonRoleTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CommonRoleTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
