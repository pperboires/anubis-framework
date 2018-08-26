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
import net.sourceforge.anubis.domain.CharacterizedGroupInactivation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupInactivation_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CharacterizedGroupInactivation.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long CharacterizedGroupInactivation.uid;
    
    @Version
    @Column(name = "version")
    private Integer CharacterizedGroupInactivation.version;
    
    public Long CharacterizedGroupInactivation.getUid() {
        return this.uid;
    }
    
    public void CharacterizedGroupInactivation.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer CharacterizedGroupInactivation.getVersion() {
        return this.version;
    }
    
    public void CharacterizedGroupInactivation.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CharacterizedGroupInactivation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CharacterizedGroupInactivation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CharacterizedGroupInactivation attached = this.entityManager.find(CharacterizedGroupInactivation.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CharacterizedGroupInactivation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CharacterizedGroupInactivation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CharacterizedGroupInactivation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager CharacterizedGroupInactivation.entityManager() {
        EntityManager em = new CharacterizedGroupInactivation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CharacterizedGroupInactivation.countCharacterizedGroupInactivations() {
        return (Long) entityManager().createQuery("select count(o) from CharacterizedGroupInactivation o").getSingleResult();
    }
    
    public static List<CharacterizedGroupInactivation> CharacterizedGroupInactivation.findAllCharacterizedGroupInactivations() {
        return entityManager().createQuery("select o from CharacterizedGroupInactivation o").getResultList();
    }
    
    public static CharacterizedGroupInactivation CharacterizedGroupInactivation.findCharacterizedGroupInactivation(Long id) {
        if (id == null) return null;
        return entityManager().find(CharacterizedGroupInactivation.class, id);
    }
    
    public static List<CharacterizedGroupInactivation> CharacterizedGroupInactivation.findCharacterizedGroupInactivationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CharacterizedGroupInactivation o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
