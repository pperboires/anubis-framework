package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRoleDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupAssignedCommonRoleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CharacterizedGroupAssignedCommonRoleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CharacterizedGroupAssignedCommonRoleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CharacterizedGroupAssignedCommonRoleDataOnDemand CharacterizedGroupAssignedCommonRoleIntegrationTest.dod;
    
    @Test
    public void CharacterizedGroupAssignedCommonRoleIntegrationTest.testCountCharacterizedGroupAssignedCommonRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedCommonRole());
        long count = net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole.countCharacterizedGroupAssignedCommonRoles();
        org.junit.Assert.assertTrue("Counter for 'CharacterizedGroupAssignedCommonRole' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CharacterizedGroupAssignedCommonRoleIntegrationTest.testFindCharacterizedGroupAssignedCommonRole() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedCommonRole());
        java.lang.Long id = dod.getRandomCharacterizedGroupAssignedCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole obj = net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupAssignedCommonRole' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CharacterizedGroupAssignedCommonRole' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void CharacterizedGroupAssignedCommonRoleIntegrationTest.testFindAllCharacterizedGroupAssignedCommonRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedCommonRole());
        long count = net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole.countCharacterizedGroupAssignedCommonRoles();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CharacterizedGroupAssignedCommonRole', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole> result = net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole.findAllCharacterizedGroupAssignedCommonRoles();
        org.junit.Assert.assertNotNull("Find all method for 'CharacterizedGroupAssignedCommonRole' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CharacterizedGroupAssignedCommonRole' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CharacterizedGroupAssignedCommonRoleIntegrationTest.testFindCharacterizedGroupAssignedCommonRoleEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedCommonRole());
        long count = net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole.countCharacterizedGroupAssignedCommonRoles();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole> result = net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRoleEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'CharacterizedGroupAssignedCommonRole' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CharacterizedGroupAssignedCommonRole' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupAssignedCommonRoleIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedCommonRole());
        java.lang.Long id = dod.getRandomCharacterizedGroupAssignedCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole obj = net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupAssignedCommonRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacterizedGroupAssignedCommonRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacterizedGroupAssignedCommonRole' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupAssignedCommonRoleIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedCommonRole());
        java.lang.Long id = dod.getRandomCharacterizedGroupAssignedCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole obj = net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupAssignedCommonRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacterizedGroupAssignedCommonRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacterizedGroupAssignedCommonRole' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupAssignedCommonRoleIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedCommonRole());
        net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole obj = dod.getNewTransientCharacterizedGroupAssignedCommonRole(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CharacterizedGroupAssignedCommonRole' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CharacterizedGroupAssignedCommonRole' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupAssignedCommonRoleIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomCharacterizedGroupAssignedCommonRole());
        java.lang.Long id = dod.getRandomCharacterizedGroupAssignedCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupAssignedCommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole obj = net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupAssignedCommonRole' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'CharacterizedGroupAssignedCommonRole' with identifier '" + id + "'", net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRole(id));
    }
    
}
