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
import net.sourceforge.anubis.domain.ManualGroup;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroup_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ManualGroup.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long ManualGroup.uid;
    
    @Version
    @Column(name = "version")
    private Integer ManualGroup.version;
    
    public Long ManualGroup.getUid() {
        return this.uid;
    }
    
    public void ManualGroup.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer ManualGroup.getVersion() {
        return this.version;
    }
    
    public void ManualGroup.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ManualGroup.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ManualGroup.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ManualGroup attached = this.entityManager.find(ManualGroup.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ManualGroup.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ManualGroup.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ManualGroup merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager ManualGroup.entityManager() {
        EntityManager em = new ManualGroup().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ManualGroup.countManualGroups() {
        return (Long) entityManager().createQuery("select count(o) from ManualGroup o").getSingleResult();
    }
    
    public static List<ManualGroup> ManualGroup.findAllManualGroups() {
        return entityManager().createQuery("select o from ManualGroup o").getResultList();
    }
    
    public static ManualGroup ManualGroup.findManualGroup(Long id) {
        if (id == null) return null;
        return entityManager().find(ManualGroup.class, id);
    }
    
    public static List<ManualGroup> ManualGroup.findManualGroupEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ManualGroup o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
