package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacteristicDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacteristicIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CharacteristicIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CharacteristicIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CharacteristicDataOnDemand CharacteristicIntegrationTest.dod;
    
    @Test
    public void CharacteristicIntegrationTest.testCountCharacteristics() {
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to initialize correctly", dod.getRandomCharacteristic());
        long count = net.sourceforge.anubis.domain.Characteristic.countCharacteristics();
        org.junit.Assert.assertTrue("Counter for 'Characteristic' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CharacteristicIntegrationTest.testFindCharacteristic() {
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to initialize correctly", dod.getRandomCharacteristic());
        java.lang.Long id = dod.getRandomCharacteristic().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Characteristic obj = net.sourceforge.anubis.domain.Characteristic.findCharacteristic(id);
        org.junit.Assert.assertNotNull("Find method for 'Characteristic' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Characteristic' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void CharacteristicIntegrationTest.testFindAllCharacteristics() {
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to initialize correctly", dod.getRandomCharacteristic());
        long count = net.sourceforge.anubis.domain.Characteristic.countCharacteristics();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Characteristic', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.Characteristic> result = net.sourceforge.anubis.domain.Characteristic.findAllCharacteristics();
        org.junit.Assert.assertNotNull("Find all method for 'Characteristic' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Characteristic' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CharacteristicIntegrationTest.testFindCharacteristicEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to initialize correctly", dod.getRandomCharacteristic());
        long count = net.sourceforge.anubis.domain.Characteristic.countCharacteristics();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.Characteristic> result = net.sourceforge.anubis.domain.Characteristic.findCharacteristicEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Characteristic' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Characteristic' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CharacteristicIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to initialize correctly", dod.getRandomCharacteristic());
        java.lang.Long id = dod.getRandomCharacteristic().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Characteristic obj = net.sourceforge.anubis.domain.Characteristic.findCharacteristic(id);
        org.junit.Assert.assertNotNull("Find method for 'Characteristic' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacteristic(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Characteristic' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacteristicIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to initialize correctly", dod.getRandomCharacteristic());
        java.lang.Long id = dod.getRandomCharacteristic().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Characteristic obj = net.sourceforge.anubis.domain.Characteristic.findCharacteristic(id);
        org.junit.Assert.assertNotNull("Find method for 'Characteristic' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacteristic(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Characteristic' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacteristicIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to initialize correctly", dod.getRandomCharacteristic());
        net.sourceforge.anubis.domain.Characteristic obj = dod.getNewTransientCharacteristic(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Characteristic' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Characteristic' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void CharacteristicIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to initialize correctly", dod.getRandomCharacteristic());
        java.lang.Long id = dod.getRandomCharacteristic().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Characteristic' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Characteristic obj = net.sourceforge.anubis.domain.Characteristic.findCharacteristic(id);
        org.junit.Assert.assertNotNull("Find method for 'Characteristic' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Characteristic' with identifier '" + id + "'", net.sourceforge.anubis.domain.Characteristic.findCharacteristic(id));
    }
    
}
