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
import net.sourceforge.anubis.domain.Inactivation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Inactivation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Inactivation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long Inactivation.uid;
    
    @Version
    @Column(name = "version")
    private Integer Inactivation.version;
    
    public Long Inactivation.getUid() {
        return this.uid;
    }
    
    public void Inactivation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer Inactivation.getVersion() {
        return this.version;
    }
    
    public void Inactivation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Inactivation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Inactivation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Inactivation attached = this.entityManager.find(Inactivation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Inactivation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Inactivation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Inactivation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager Inactivation.entityManager() {
        EntityManager em = new Inactivation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Inactivation.countInactivations() {
        return (Long) entityManager().createQuery("select count(o) from Inactivation o").getSingleResult();
    }
    
    public static List<Inactivation> Inactivation.findAllInactivations() {
        return entityManager().createQuery("select o from Inactivation o").getResultList();
    }
    
    public static Inactivation Inactivation.findInactivation(Long id) {
        if (id == null) return null;
        return entityManager().find(Inactivation.class, id);
    }
    
    public static List<Inactivation> Inactivation.findInactivationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Inactivation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
