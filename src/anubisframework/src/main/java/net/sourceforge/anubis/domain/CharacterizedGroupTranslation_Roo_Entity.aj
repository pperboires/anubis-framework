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
import net.sourceforge.anubis.domain.CharacterizedGroupTranslation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupTranslation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CharacterizedGroupTranslation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long CharacterizedGroupTranslation.uid;
    
    @Version
    @Column(name = "version")
    private Integer CharacterizedGroupTranslation.version;
    
    public Long CharacterizedGroupTranslation.getUid() {
        return this.uid;
    }
    
    public void CharacterizedGroupTranslation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer CharacterizedGroupTranslation.getVersion() {
        return this.version;
    }
    
    public void CharacterizedGroupTranslation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CharacterizedGroupTranslation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CharacterizedGroupTranslation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CharacterizedGroupTranslation attached = this.entityManager.find(CharacterizedGroupTranslation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CharacterizedGroupTranslation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CharacterizedGroupTranslation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CharacterizedGroupTranslation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager CharacterizedGroupTranslation.entityManager() {
        EntityManager em = new CharacterizedGroupTranslation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CharacterizedGroupTranslation.countCharacterizedGroupTranslations() {
        return (Long) entityManager().createQuery("select count(o) from CharacterizedGroupTranslation o").getSingleResult();
    }
    
    public static List<CharacterizedGroupTranslation> CharacterizedGroupTranslation.findAllCharacterizedGroupTranslations() {
        return entityManager().createQuery("select o from CharacterizedGroupTranslation o").getResultList();
    }
    
    public static CharacterizedGroupTranslation CharacterizedGroupTranslation.findCharacterizedGroupTranslation(Long id) {
        if (id == null) return null;
        return entityManager().find(CharacterizedGroupTranslation.class, id);
    }
    
    public static List<CharacterizedGroupTranslation> CharacterizedGroupTranslation.findCharacterizedGroupTranslationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CharacterizedGroupTranslation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
