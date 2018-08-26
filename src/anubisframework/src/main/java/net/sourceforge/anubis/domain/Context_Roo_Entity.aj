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
import net.sourceforge.anubis.domain.Context;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Context_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Context.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long Context.uid;
    
    @Version
    @Column(name = "version")
    private Integer Context.version;
    
    public Long Context.getUid() {
        return this.uid;
    }
    
    public void Context.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer Context.getVersion() {
        return this.version;
    }
    
    public void Context.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Context.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Context.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Context attached = this.entityManager.find(Context.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Context.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Context.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Context merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager Context.entityManager() {
        EntityManager em = new Context().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Context.countContexts() {
        return (Long) entityManager().createQuery("select count(o) from Context o").getSingleResult();
    }
    
    public static List<Context> Context.findAllContexts() {
        return entityManager().createQuery("select o from Context o").getResultList();
    }
    
    public static Context Context.findContext(Long id) {
        if (id == null) return null;
        return entityManager().find(Context.class, id);
    }
    
    public static List<Context> Context.findContextEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Context o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
