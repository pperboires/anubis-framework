package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValueDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacterizedGroupCharacteristicValueIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CharacterizedGroupCharacteristicValueIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CharacterizedGroupCharacteristicValueIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CharacterizedGroupCharacteristicValueDataOnDemand CharacterizedGroupCharacteristicValueIntegrationTest.dod;
    
    @Test
    public void CharacterizedGroupCharacteristicValueIntegrationTest.testCountCharacterizedGroupCharacteristicValues() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to initialize correctly", dod.getRandomCharacterizedGroupCharacteristicValue());
        long count = net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue.countCharacterizedGroupCharacteristicValues();
        org.junit.Assert.assertTrue("Counter for 'CharacterizedGroupCharacteristicValue' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CharacterizedGroupCharacteristicValueIntegrationTest.testFindCharacterizedGroupCharacteristicValue() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to initialize correctly", dod.getRandomCharacterizedGroupCharacteristicValue());
        java.lang.Long id = dod.getRandomCharacterizedGroupCharacteristicValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue obj = net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValue(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupCharacteristicValue' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CharacterizedGroupCharacteristicValue' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void CharacterizedGroupCharacteristicValueIntegrationTest.testFindAllCharacterizedGroupCharacteristicValues() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to initialize correctly", dod.getRandomCharacterizedGroupCharacteristicValue());
        long count = net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue.countCharacterizedGroupCharacteristicValues();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CharacterizedGroupCharacteristicValue', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue> result = net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue.findAllCharacterizedGroupCharacteristicValues();
        org.junit.Assert.assertNotNull("Find all method for 'CharacterizedGroupCharacteristicValue' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CharacterizedGroupCharacteristicValue' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CharacterizedGroupCharacteristicValueIntegrationTest.testFindCharacterizedGroupCharacteristicValueEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to initialize correctly", dod.getRandomCharacterizedGroupCharacteristicValue());
        long count = net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue.countCharacterizedGroupCharacteristicValues();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue> result = net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValueEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'CharacterizedGroupCharacteristicValue' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CharacterizedGroupCharacteristicValue' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupCharacteristicValueIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to initialize correctly", dod.getRandomCharacterizedGroupCharacteristicValue());
        java.lang.Long id = dod.getRandomCharacterizedGroupCharacteristicValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue obj = net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValue(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupCharacteristicValue' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacterizedGroupCharacteristicValue(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacterizedGroupCharacteristicValue' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupCharacteristicValueIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to initialize correctly", dod.getRandomCharacterizedGroupCharacteristicValue());
        java.lang.Long id = dod.getRandomCharacterizedGroupCharacteristicValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue obj = net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValue(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupCharacteristicValue' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacterizedGroupCharacteristicValue(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacterizedGroupCharacteristicValue' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupCharacteristicValueIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to initialize correctly", dod.getRandomCharacterizedGroupCharacteristicValue());
        net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue obj = dod.getNewTransientCharacterizedGroupCharacteristicValue(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CharacterizedGroupCharacteristicValue' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CharacterizedGroupCharacteristicValue' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void CharacterizedGroupCharacteristicValueIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to initialize correctly", dod.getRandomCharacterizedGroupCharacteristicValue());
        java.lang.Long id = dod.getRandomCharacterizedGroupCharacteristicValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacterizedGroupCharacteristicValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue obj = net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValue(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacterizedGroupCharacteristicValue' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'CharacterizedGroupCharacteristicValue' with identifier '" + id + "'", net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValue(id));
    }
    
}
