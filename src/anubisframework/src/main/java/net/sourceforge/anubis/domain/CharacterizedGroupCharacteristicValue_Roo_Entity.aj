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
import net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupCharacteristicValue_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CharacterizedGroupCharacteristicValue.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long CharacterizedGroupCharacteristicValue.uid;
    
    @Version
    @Column(name = "version")
    private Integer CharacterizedGroupCharacteristicValue.version;
    
    public Long CharacterizedGroupCharacteristicValue.getUid() {
        return this.uid;
    }
    
    public void CharacterizedGroupCharacteristicValue.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer CharacterizedGroupCharacteristicValue.getVersion() {
        return this.version;
    }
    
    public void CharacterizedGroupCharacteristicValue.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CharacterizedGroupCharacteristicValue.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CharacterizedGroupCharacteristicValue.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CharacterizedGroupCharacteristicValue attached = this.entityManager.find(CharacterizedGroupCharacteristicValue.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CharacterizedGroupCharacteristicValue.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CharacterizedGroupCharacteristicValue.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CharacterizedGroupCharacteristicValue merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager CharacterizedGroupCharacteristicValue.entityManager() {
        EntityManager em = new CharacterizedGroupCharacteristicValue().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CharacterizedGroupCharacteristicValue.countCharacterizedGroupCharacteristicValues() {
        return (Long) entityManager().createQuery("select count(o) from CharacterizedGroupCharacteristicValue o").getSingleResult();
    }
    
    public static List<CharacterizedGroupCharacteristicValue> CharacterizedGroupCharacteristicValue.findAllCharacterizedGroupCharacteristicValues() {
        return entityManager().createQuery("select o from CharacterizedGroupCharacteristicValue o").getResultList();
    }
    
    public static CharacterizedGroupCharacteristicValue CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValue(Long id) {
        if (id == null) return null;
        return entityManager().find(CharacterizedGroupCharacteristicValue.class, id);
    }
    
    public static List<CharacterizedGroupCharacteristicValue> CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValueEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CharacterizedGroupCharacteristicValue o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
