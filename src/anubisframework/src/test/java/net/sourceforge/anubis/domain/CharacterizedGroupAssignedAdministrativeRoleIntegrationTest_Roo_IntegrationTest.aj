package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRoleDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupAssignedAdministrativeRoleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CharacterizedGroupAssignedAdministrativeRoleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CharacterizedGroupAssignedAdministrativeRoleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CharacterizedGroupAssignedAdministrativeRoleDataOnDemand CharacterizedGroupAssignedAdministrativeRoleIntegrationTest.dod;
    
    @Test
    public void CharacterizedGroupAssignedAdministrativeRoleIntegrationTest.testCountCharacterizedGroupAssignedAdministrativeRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedAdministrativeRole());
        long count = net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole.countCharacterizedGroupAssignedAdministrativeRoles();
        org.junit.Assert.assertTrue("Counter for 'CharacterizedGroupAssignedAdministrativeRole' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CharacterizedGroupAssignedAdministrativeRoleIntegrationTest.testFindCharacterizedGroupAssignedAdministrativeRole() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedAdministrativeRole());
        java.lang.Long id = dod.getRandomCharacterizedGroupAssignedAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole obj = net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupAssignedAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CharacterizedGroupAssignedAdministrativeRole' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void CharacterizedGroupAssignedAdministrativeRoleIntegrationTest.testFindAllCharacterizedGroupAssignedAdministrativeRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedAdministrativeRole());
        long count = net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole.countCharacterizedGroupAssignedAdministrativeRoles();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CharacterizedGroupAssignedAdministrativeRole', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole> result = net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole.findAllCharacterizedGroupAssignedAdministrativeRoles();
        org.junit.Assert.assertNotNull("Find all method for 'CharacterizedGroupAssignedAdministrativeRole' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CharacterizedGroupAssignedAdministrativeRole' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CharacterizedGroupAssignedAdministrativeRoleIntegrationTest.testFindCharacterizedGroupAssignedAdministrativeRoleEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedAdministrativeRole());
        long count = net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole.countCharacterizedGroupAssignedAdministrativeRoles();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole> result = net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRoleEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'CharacterizedGroupAssignedAdministrativeRole' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CharacterizedGroupAssignedAdministrativeRole' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupAssignedAdministrativeRoleIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedAdministrativeRole());
        java.lang.Long id = dod.getRandomCharacterizedGroupAssignedAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole obj = net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupAssignedAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacterizedGroupAssignedAdministrativeRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacterizedGroupAssignedAdministrativeRole' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupAssignedAdministrativeRoleIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedAdministrativeRole());
        java.lang.Long id = dod.getRandomCharacterizedGroupAssignedAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole obj = net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupAssignedAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacterizedGroupAssignedAdministrativeRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacterizedGroupAssignedAdministrativeRole' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupAssignedAdministrativeRoleIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedAdministrativeRole());
        net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole obj = dod.getNewTransientCharacterizedGroupAssignedAdministrativeRole(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CharacterizedGroupAssignedAdministrativeRole' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CharacterizedGroupAssignedAdministrativeRole' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupAssignedAdministrativeRoleIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedAdministrativeRole());
        java.lang.Long id = dod.getRandomCharacterizedGroupAssignedAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole obj = net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupAssignedAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'CharacterizedGroupAssignedAdministrativeRole' with identifier '" + id + "'", net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRole(id));
    }
    
}
