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
import net.sourceforge.anubis.domain.SupportedLocale;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SupportedLocale_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager SupportedLocale.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long SupportedLocale.uid;
    
    @Version
    @Column(name = "version")
    private Integer SupportedLocale.version;
    
    public Long SupportedLocale.getUid() {
        return this.uid;
    }
    
    public void SupportedLocale.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer SupportedLocale.getVersion() {
        return this.version;
    }
    
    public void SupportedLocale.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void SupportedLocale.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SupportedLocale.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SupportedLocale attached = this.entityManager.find(SupportedLocale.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SupportedLocale.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SupportedLocale.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SupportedLocale merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager SupportedLocale.entityManager() {
        EntityManager em = new SupportedLocale().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SupportedLocale.countSupportedLocales() {
        return (Long) entityManager().createQuery("select count(o) from SupportedLocale o").getSingleResult();
    }
    
    public static List<SupportedLocale> SupportedLocale.findAllSupportedLocales() {
        return entityManager().createQuery("select o from SupportedLocale o").getResultList();
    }
    
    public static SupportedLocale SupportedLocale.findSupportedLocale(Long id) {
        if (id == null) return null;
        return entityManager().find(SupportedLocale.class, id);
    }
    
    public static List<SupportedLocale> SupportedLocale.findSupportedLocaleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from SupportedLocale o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
