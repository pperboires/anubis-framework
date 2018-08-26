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
import net.sourceforge.anubis.domain.CharacteristicTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacteristicTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CharacteristicTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long CharacteristicTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer CharacteristicTranslation.version;
    
    public Long CharacteristicTranslation.getUid() {
        return this.uid;
    }
    
    public void CharacteristicTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer CharacteristicTranslation.getVersion() {
        return this.version;
    }
    
    public void CharacteristicTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CharacteristicTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CharacteristicTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CharacteristicTranslation attached = this.entityManager.find(CharacteristicTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CharacteristicTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CharacteristicTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CharacteristicTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager CharacteristicTranslation.entityManager() {
        EntityManager em = new CharacteristicTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CharacteristicTranslation.countCharacteristicTranslations() {
        return (Long) entityManager().createQuery("select count(o) from CharacteristicTranslation o").getSingleResult();
    }
    
    public static List<CharacteristicTranslation> CharacteristicTranslation.findAllCharacteristicTranslations() {
        return entityManager().createQuery("select o from CharacteristicTranslation o").getResultList();
    }
    
    public static CharacteristicTranslation CharacteristicTranslation.findCharacteristicTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(CharacteristicTranslation.class, id);
    }
    
    public static List<CharacteristicTranslation> CharacteristicTranslation.findCharacteristicTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CharacteristicTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
