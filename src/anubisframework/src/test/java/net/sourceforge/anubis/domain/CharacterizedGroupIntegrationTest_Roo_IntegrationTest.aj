package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacterizedGroupDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CharacterizedGroupIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CharacterizedGroupIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CharacterizedGroupDataOnDemand CharacterizedGroupIntegrationTest.dod;
    
    @Test
    public void CharacterizedGroupIntegrationTest.testCountCharacterizedGroups() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to initialize correctly", dod.getRandomCharacterizedGroup());
        long count = net.sourceforge.anubis.domain.CharacterizedGroup.countCharacterizedGroups();
        org.junit.Assert.assertTrue("Counter for 'CharacterizedGroup' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CharacterizedGroupIntegrationTest.testFindCharacterizedGroup() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to initialize correctly", dod.getRandomCharacterizedGroup());
        java.lang.Long id = dod.getRandomCharacterizedGroup().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroup obj = net.sourceforge.anubis.domain.CharacterizedGroup.findCharacterizedGroup(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroup' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CharacterizedGroup' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void CharacterizedGroupIntegrationTest.testFindAllCharacterizedGroups() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to initialize correctly", dod.getRandomCharacterizedGroup());
        long count = net.sourceforge.anubis.domain.CharacterizedGroup.countCharacterizedGroups();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CharacterizedGroup', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.CharacterizedGroup> result = net.sourceforge.anubis.domain.CharacterizedGroup.findAllCharacterizedGroups();
        org.junit.Assert.assertNotNull("Find all method for 'CharacterizedGroup' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CharacterizedGroup' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CharacterizedGroupIntegrationTest.testFindCharacterizedGroupEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to initialize correctly", dod.getRandomCharacterizedGroup());
        long count = net.sourceforge.anubis.domain.CharacterizedGroup.countCharacterizedGroups();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.CharacterizedGroup> result = net.sourceforge.anubis.domain.CharacterizedGroup.findCharacterizedGroupEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'CharacterizedGroup' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CharacterizedGroup' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to initialize correctly", dod.getRandomCharacterizedGroup());
        java.lang.Long id = dod.getRandomCharacterizedGroup().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroup obj = net.sourceforge.anubis.domain.CharacterizedGroup.findCharacterizedGroup(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroup' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacterizedGroup(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacterizedGroup' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to initialize correctly", dod.getRandomCharacterizedGroup());
        java.lang.Long id = dod.getRandomCharacterizedGroup().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroup obj = net.sourceforge.anubis.domain.CharacterizedGroup.findCharacterizedGroup(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroup' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacterizedGroup(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacterizedGroup' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to initialize correctly", dod.getRandomCharacterizedGroup());
        net.sourceforge.anubis.domain.CharacterizedGroup obj = dod.getNewTransientCharacterizedGroup(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CharacterizedGroup' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CharacterizedGroup' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to initialize correctly", dod.getRandomCharacterizedGroup());
        java.lang.Long id = dod.getRandomCharacterizedGroup().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroup' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroup obj = net.sourceforge.anubis.domain.CharacterizedGroup.findCharacterizedGroup(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroup' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'CharacterizedGroup' with identifier '" + id + "'", net.sourceforge.anubis.domain.CharacterizedGroup.findCharacterizedGroup(id));
    }
    
}
