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
import net.sourceforge.anubis.domain.CharacteristicValue;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacteristicValue_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CharacteristicValue.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long CharacteristicValue.uid;
    
    @Version
    @Column(name = "version")
    private Integer CharacteristicValue.version;
    
    public Long CharacteristicValue.getUid() {
        return this.uid;
    }
    
    public void CharacteristicValue.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer CharacteristicValue.getVersion() {
        return this.version;
    }
    
    public void CharacteristicValue.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CharacteristicValue.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CharacteristicValue.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CharacteristicValue attached = this.entityManager.find(CharacteristicValue.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CharacteristicValue.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CharacteristicValue.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CharacteristicValue merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager CharacteristicValue.entityManager() {
        EntityManager em = new CharacteristicValue().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CharacteristicValue.countCharacteristicValues() {
        return (Long) entityManager().createQuery("select count(o) from CharacteristicValue o").getSingleResult();
    }
    
    public static List<CharacteristicValue> CharacteristicValue.findAllCharacteristicValues() {
        return entityManager().createQuery("select o from CharacteristicValue o").getResultList();
    }
    
    public static CharacteristicValue CharacteristicValue.findCharacteristicValue(Long id) {
        if (id == null) return null;
        return entityManager().find(CharacteristicValue.class, id);
    }
    
    public static List<CharacteristicValue> CharacteristicValue.findCharacteristicValueEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CharacteristicValue o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
