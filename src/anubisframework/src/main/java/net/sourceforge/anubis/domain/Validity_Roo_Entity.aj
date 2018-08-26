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
import net.sourceforge.anubis.domain.Validity;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Validity_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Validity.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long Validity.uid;
    
    @Version
    @Column(name = "version")
    private Integer Validity.version;
    
    public Long Validity.getUid() {
        return this.uid;
    }
    
    public void Validity.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer Validity.getVersion() {
        return this.version;
    }
    
    public void Validity.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Validity.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Validity.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Validity attached = this.entityManager.find(Validity.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Validity.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Validity.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Validity merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager Validity.entityManager() {
        EntityManager em = new Validity().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Validity.countValiditys() {
        return (Long) entityManager().createQuery("select count(o) from Validity o").getSingleResult();
    }
    
    public static List<Validity> Validity.findAllValiditys() {
        return entityManager().createQuery("select o from Validity o").getResultList();
    }
    
    public static Validity Validity.findValidity(Long id) {
        if (id == null) return null;
        return entityManager().find(Validity.class, id);
    }
    
    public static List<Validity> Validity.findValidityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Validity o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
