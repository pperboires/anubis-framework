package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacterizedGroupInactivationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupInactivationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CharacterizedGroupInactivationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CharacterizedGroupInactivationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CharacterizedGroupInactivationDataOnDemand CharacterizedGroupInactivationIntegrationTest.dod;
    
    @Test
    public void CharacterizedGroupInactivationIntegrationTest.testCountCharacterizedGroupInactivations() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to initialize correctly", dod.getRandomCharacterizedGroupInactivation());
        long count = net.sourceforge.anubis.domain.CharacterizedGroupInactivation.countCharacterizedGroupInactivations();
        org.junit.Assert.assertTrue("Counter for 'CharacterizedGroupInactivation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CharacterizedGroupInactivationIntegrationTest.testFindCharacterizedGroupInactivation() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to initialize correctly", dod.getRandomCharacterizedGroupInactivation());
        java.lang.Long id = dod.getRandomCharacterizedGroupInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupInactivation obj = net.sourceforge.anubis.domain.CharacterizedGroupInactivation.findCharacterizedGroupInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupInactivation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CharacterizedGroupInactivation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void CharacterizedGroupInactivationIntegrationTest.testFindAllCharacterizedGroupInactivations() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to initialize correctly", dod.getRandomCharacterizedGroupInactivation());
        long count = net.sourceforge.anubis.domain.CharacterizedGroupInactivation.countCharacterizedGroupInactivations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CharacterizedGroupInactivation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.CharacterizedGroupInactivation> result = net.sourceforge.anubis.domain.CharacterizedGroupInactivation.findAllCharacterizedGroupInactivations();
        org.junit.Assert.assertNotNull("Find all method for 'CharacterizedGroupInactivation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CharacterizedGroupInactivation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CharacterizedGroupInactivationIntegrationTest.testFindCharacterizedGroupInactivationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to initialize correctly", dod.getRandomCharacterizedGroupInactivation());
        long count = net.sourceforge.anubis.domain.CharacterizedGroupInactivation.countCharacterizedGroupInactivations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.CharacterizedGroupInactivation> result = net.sourceforge.anubis.domain.CharacterizedGroupInactivation.findCharacterizedGroupInactivationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'CharacterizedGroupInactivation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CharacterizedGroupInactivation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupInactivationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to initialize correctly", dod.getRandomCharacterizedGroupInactivation());
        java.lang.Long id = dod.getRandomCharacterizedGroupInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupInactivation obj = net.sourceforge.anubis.domain.CharacterizedGroupInactivation.findCharacterizedGroupInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupInactivation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacterizedGroupInactivation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacterizedGroupInactivation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupInactivationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to initialize correctly", dod.getRandomCharacterizedGroupInactivation());
        java.lang.Long id = dod.getRandomCharacterizedGroupInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupInactivation obj = net.sourceforge.anubis.domain.CharacterizedGroupInactivation.findCharacterizedGroupInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupInactivation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacterizedGroupInactivation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacterizedGroupInactivation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupInactivationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to initialize correctly", dod.getRandomCharacterizedGroupInactivation());
        net.sourceforge.anubis.domain.CharacterizedGroupInactivation obj = dod.getNewTransientCharacterizedGroupInactivation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CharacterizedGroupInactivation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CharacterizedGroupInactivation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupInactivationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to initialize correctly", dod.getRandomCharacterizedGroupInactivation());
        java.lang.Long id = dod.getRandomCharacterizedGroupInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupInactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupInactivation obj = net.sourceforge.anubis.domain.CharacterizedGroupInactivation.findCharacterizedGroupInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupInactivation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'CharacterizedGroupInactivation' with identifier '" + id + "'", net.sourceforge.anubis.domain.CharacterizedGroupInactivation.findCharacterizedGroupInactivation(id));
    }
    
}
