package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacteristicValueDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacteristicValueIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CharacteristicValueIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CharacteristicValueIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CharacteristicValueDataOnDemand CharacteristicValueIntegrationTest.dod;
    
    @Test
    public void CharacteristicValueIntegrationTest.testCountCharacteristicValues() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to initialize correctly", dod.getRandomCharacteristicValue());
        long count = net.sourceforge.anubis.domain.CharacteristicValue.countCharacteristicValues();
        org.junit.Assert.assertTrue("Counter for 'CharacteristicValue' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CharacteristicValueIntegrationTest.testFindCharacteristicValue() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to initialize correctly", dod.getRandomCharacteristicValue());
        java.lang.Long id = dod.getRandomCharacteristicValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacteristicValue obj = net.sourceforge.anubis.domain.CharacteristicValue.findCharacteristicValue(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacteristicValue' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CharacteristicValue' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void CharacteristicValueIntegrationTest.testFindAllCharacteristicValues() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to initialize correctly", dod.getRandomCharacteristicValue());
        long count = net.sourceforge.anubis.domain.CharacteristicValue.countCharacteristicValues();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CharacteristicValue', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.CharacteristicValue> result = net.sourceforge.anubis.domain.CharacteristicValue.findAllCharacteristicValues();
        org.junit.Assert.assertNotNull("Find all method for 'CharacteristicValue' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CharacteristicValue' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CharacteristicValueIntegrationTest.testFindCharacteristicValueEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to initialize correctly", dod.getRandomCharacteristicValue());
        long count = net.sourceforge.anubis.domain.CharacteristicValue.countCharacteristicValues();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.CharacteristicValue> result = net.sourceforge.anubis.domain.CharacteristicValue.findCharacteristicValueEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'CharacteristicValue' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CharacteristicValue' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CharacteristicValueIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to initialize correctly", dod.getRandomCharacteristicValue());
        java.lang.Long id = dod.getRandomCharacteristicValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacteristicValue obj = net.sourceforge.anubis.domain.CharacteristicValue.findCharacteristicValue(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacteristicValue' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacteristicValue(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacteristicValue' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacteristicValueIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to initialize correctly", dod.getRandomCharacteristicValue());
        java.lang.Long id = dod.getRandomCharacteristicValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacteristicValue obj = net.sourceforge.anubis.domain.CharacteristicValue.findCharacteristicValue(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacteristicValue' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacteristicValue(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacteristicValue' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacteristicValueIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to initialize correctly", dod.getRandomCharacteristicValue());
        net.sourceforge.anubis.domain.CharacteristicValue obj = dod.getNewTransientCharacteristicValue(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CharacteristicValue' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CharacteristicValue' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void CharacteristicValueIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to initialize correctly", dod.getRandomCharacteristicValue());
        java.lang.Long id = dod.getRandomCharacteristicValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacteristicValue obj = net.sourceforge.anubis.domain.CharacteristicValue.findCharacteristicValue(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacteristicValue' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'CharacteristicValue' with identifier '" + id + "'", net.sourceforge.anubis.domain.CharacteristicValue.findCharacteristicValue(id));
    }
    
}
