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
import net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupAssignedCommonRole_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CharacterizedGroupAssignedCommonRole.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long CharacterizedGroupAssignedCommonRole.uid;
    
    @Version
    @Column(name = "version")
    private Integer CharacterizedGroupAssignedCommonRole.version;
    
    public Long CharacterizedGroupAssignedCommonRole.getUid() {
        return this.uid;
    }
    
    public void CharacterizedGroupAssignedCommonRole.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer CharacterizedGroupAssignedCommonRole.getVersion() {
        return this.version;
    }
    
    public void CharacterizedGroupAssignedCommonRole.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CharacterizedGroupAssignedCommonRole.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CharacterizedGroupAssignedCommonRole.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CharacterizedGroupAssignedCommonRole attached = this.entityManager.find(CharacterizedGroupAssignedCommonRole.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CharacterizedGroupAssignedCommonRole.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CharacterizedGroupAssignedCommonRole.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CharacterizedGroupAssignedCommonRole merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager CharacterizedGroupAssignedCommonRole.entityManager() {
        EntityManager em = new CharacterizedGroupAssignedCommonRole().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CharacterizedGroupAssignedCommonRole.countCharacterizedGroupAssignedCommonRoles() {
        return (Long) entityManager().createQuery("select count(o) from CharacterizedGroupAssignedCommonRole o").getSingleResult();
    }
    
    public static List<CharacterizedGroupAssignedCommonRole> CharacterizedGroupAssignedCommonRole.findAllCharacterizedGroupAssignedCommonRoles() {
        return entityManager().createQuery("select o from CharacterizedGroupAssignedCommonRole o").getResultList();
    }
    
    public static CharacterizedGroupAssignedCommonRole CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRole(Long id) {
        if (id == null) return null;
        return entityManager().find(CharacterizedGroupAssignedCommonRole.class, id);
    }
    
    public static List<CharacterizedGroupAssignedCommonRole> CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRoleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CharacterizedGroupAssignedCommonRole o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
