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
import net.sourceforge.anubis.domain.CharacteristicValueTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacteristicValueTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CharacteristicValueTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long CharacteristicValueTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer CharacteristicValueTranslation.version;
    
    public Long CharacteristicValueTranslation.getUid() {
        return this.uid;
    }
    
    public void CharacteristicValueTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer CharacteristicValueTranslation.getVersion() {
        return this.version;
    }
    
    public void CharacteristicValueTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CharacteristicValueTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CharacteristicValueTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CharacteristicValueTranslation attached = this.entityManager.find(CharacteristicValueTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CharacteristicValueTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CharacteristicValueTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CharacteristicValueTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager CharacteristicValueTranslation.entityManager() {
        EntityManager em = new CharacteristicValueTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CharacteristicValueTranslation.countCharacteristicValueTranslations() {
        return (Long) entityManager().createQuery("select count(o) from CharacteristicValueTranslation o").getSingleResult();
    }
    
    public static List<CharacteristicValueTranslation> CharacteristicValueTranslation.findAllCharacteristicValueTranslations() {
        return entityManager().createQuery("select o from CharacteristicValueTranslation o").getResultList();
    }
    
    public static CharacteristicValueTranslation CharacteristicValueTranslation.findCharacteristicValueTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(CharacteristicValueTranslation.class, id);
    }
    
    public static List<CharacteristicValueTranslation> CharacteristicValueTranslation.findCharacteristicValueTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CharacteristicValueTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
