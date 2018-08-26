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
import net.sourceforge.anubis.domain.Locale;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Locale_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Locale.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long Locale.uid;
    
    @Version
    @Column(name = "version")
    private Integer Locale.version;
    
    public Long Locale.getUid() {
        return this.uid;
    }
    
    public void Locale.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer Locale.getVersion() {
        return this.version;
    }
    
    public void Locale.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Locale.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Locale.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Locale attached = this.entityManager.find(Locale.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Locale.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Locale.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Locale merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager Locale.entityManager() {
        EntityManager em = new Locale().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Locale.countLocales() {
        return (Long) entityManager().createQuery("select count(o) from Locale o").getSingleResult();
    }
    
    public static List<Locale> Locale.findAllLocales() {
        return entityManager().createQuery("select o from Locale o").getResultList();
    }
    
    public static Locale Locale.findLocale(Long id) {
        if (id == null) return null;
        return entityManager().find(Locale.class, id);
    }
    
    public static List<Locale> Locale.findLocaleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Locale o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
