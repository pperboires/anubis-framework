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
import net.sourceforge.anubis.domain.CharacterizedGroup;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroup_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CharacterizedGroup.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long CharacterizedGroup.uid;
    
    @Version
    @Column(name = "version")
    private Integer CharacterizedGroup.version;
    
    public Long CharacterizedGroup.getUid() {
        return this.uid;
    }
    
    public void CharacterizedGroup.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer CharacterizedGroup.getVersion() {
        return this.version;
    }
    
    public void CharacterizedGroup.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CharacterizedGroup.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CharacterizedGroup.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CharacterizedGroup attached = this.entityManager.find(CharacterizedGroup.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CharacterizedGroup.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CharacterizedGroup.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CharacterizedGroup merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager CharacterizedGroup.entityManager() {
        EntityManager em = new CharacterizedGroup().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CharacterizedGroup.countCharacterizedGroups() {
        return (Long) entityManager().createQuery("select count(o) from CharacterizedGroup o").getSingleResult();
    }
    
    public static List<CharacterizedGroup> CharacterizedGroup.findAllCharacterizedGroups() {
        return entityManager().createQuery("select o from CharacterizedGroup o").getResultList();
    }
    
    public static CharacterizedGroup CharacterizedGroup.findCharacterizedGroup(Long id) {
        if (id == null) return null;
        return entityManager().find(CharacterizedGroup.class, id);
    }
    
    public static List<CharacterizedGroup> CharacterizedGroup.findCharacterizedGroupEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CharacterizedGroup o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
