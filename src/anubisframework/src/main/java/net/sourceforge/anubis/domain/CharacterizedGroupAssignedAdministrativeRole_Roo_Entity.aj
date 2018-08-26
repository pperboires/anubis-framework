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
import net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupAssignedAdministrativeRole_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager CharacterizedGroupAssignedAdministrativeRole.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "uid")
    private Long CharacterizedGroupAssignedAdministrativeRole.uid;
    
    @Version
    @Column(name = "version")
    private Integer CharacterizedGroupAssignedAdministrativeRole.version;
    
    public Long CharacterizedGroupAssignedAdministrativeRole.getUid() {
        return this.uid;
    }
    
    public void CharacterizedGroupAssignedAdministrativeRole.setUid(Long id) {
        this.uid = id;
    }
    
    public Integer CharacterizedGroupAssignedAdministrativeRole.getVersion() {
        return this.version;
    }
    
    public void CharacterizedGroupAssignedAdministrativeRole.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CharacterizedGroupAssignedAdministrativeRole.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CharacterizedGroupAssignedAdministrativeRole.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CharacterizedGroupAssignedAdministrativeRole attached = this.entityManager.find(CharacterizedGroupAssignedAdministrativeRole.class, this.uid);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CharacterizedGroupAssignedAdministrativeRole.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CharacterizedGroupAssignedAdministrativeRole.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CharacterizedGroupAssignedAdministrativeRole merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.uid = merged.getUid();
    }
    
    public static final EntityManager CharacterizedGroupAssignedAdministrativeRole.entityManager() {
        EntityManager em = new CharacterizedGroupAssignedAdministrativeRole().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CharacterizedGroupAssignedAdministrativeRole.countCharacterizedGroupAssignedAdministrativeRoles() {
        return (Long) entityManager().createQuery("select count(o) from CharacterizedGroupAssignedAdministrativeRole o").getSingleResult();
    }
    
    public static List<CharacterizedGroupAssignedAdministrativeRole> CharacterizedGroupAssignedAdministrativeRole.findAllCharacterizedGroupAssignedAdministrativeRoles() {
        return entityManager().createQuery("select o from CharacterizedGroupAssignedAdministrativeRole o").getResultList();
    }
    
    public static CharacterizedGroupAssignedAdministrativeRole CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRole(Long id) {
        if (id == null) return null;
        return entityManager().find(CharacterizedGroupAssignedAdministrativeRole.class, id);
    }
    
    public static List<CharacterizedGroupAssignedAdministrativeRole> CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRoleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CharacterizedGroupAssignedAdministrativeRole o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
