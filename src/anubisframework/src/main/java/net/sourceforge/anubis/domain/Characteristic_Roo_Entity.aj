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
import net.sourceforge.anubis.domain.Characteristic;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Characteristic_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Characteristic.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long Characteristic.uid;
    
    @Version
    @Column(name = "version")
    private Integer Characteristic.version;
    
    public Long Characteristic.getUid() {
        return this.uid;
    }
    
    public void Characteristic.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer Characteristic.getVersion() {
        return this.version;
    }
    
    public void Characteristic.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Characteristic.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Characteristic.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Characteristic attached = this.entityManager.find(Characteristic.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Characteristic.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Characteristic.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Characteristic merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager Characteristic.entityManager() {
        EntityManager em = new Characteristic().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Characteristic.countCharacteristics() {
        return (Long) entityManager().createQuery("select count(o) from Characteristic o").getSingleResult();
    }
    
    public static List<Characteristic> Characteristic.findAllCharacteristics() {
        return entityManager().createQuery("select o from Characteristic o").getResultList();
    }
    
    public static Characteristic Characteristic.findCharacteristic(Long id) {
        if (id == null) return null;
        return entityManager().find(Characteristic.class, id);
    }
    
    public static List<Characteristic> Characteristic.findCharacteristicEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Characteristic o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
