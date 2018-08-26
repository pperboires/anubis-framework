package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.UserCharacteristicValueDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserCharacteristicValueIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserCharacteristicValueIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserCharacteristicValueIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private UserCharacteristicValueDataOnDemand UserCharacteristicValueIntegrationTest.dod;
    
    @Test
    public void UserCharacteristicValueIntegrationTest.testCountUserCharacteristicValues() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to initialize correctly", dod.getRandomUserCharacteristicValue());
        long count = net.sourceforge.anubis.domain.UserCharacteristicValue.countUserCharacteristicValues();
        org.junit.Assert.assertTrue("Counter for 'UserCharacteristicValue' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserCharacteristicValueIntegrationTest.testFindUserCharacteristicValue() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to initialize correctly", dod.getRandomUserCharacteristicValue());
        java.lang.Long id = dod.getRandomUserCharacteristicValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserCharacteristicValue obj = net.sourceforge.anubis.domain.UserCharacteristicValue.findUserCharacteristicValue(id);
        org.junit.Assert.assertNotNull("Find method for 'UserCharacteristicValue' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'UserCharacteristicValue' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void UserCharacteristicValueIntegrationTest.testFindAllUserCharacteristicValues() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to initialize correctly", dod.getRandomUserCharacteristicValue());
        long count = net.sourceforge.anubis.domain.UserCharacteristicValue.countUserCharacteristicValues();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'UserCharacteristicValue', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.UserCharacteristicValue> result = net.sourceforge.anubis.domain.UserCharacteristicValue.findAllUserCharacteristicValues();
        org.junit.Assert.assertNotNull("Find all method for 'UserCharacteristicValue' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'UserCharacteristicValue' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserCharacteristicValueIntegrationTest.testFindUserCharacteristicValueEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to initialize correctly", dod.getRandomUserCharacteristicValue());
        long count = net.sourceforge.anubis.domain.UserCharacteristicValue.countUserCharacteristicValues();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.UserCharacteristicValue> result = net.sourceforge.anubis.domain.UserCharacteristicValue.findUserCharacteristicValueEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'UserCharacteristicValue' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'UserCharacteristicValue' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void UserCharacteristicValueIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to initialize correctly", dod.getRandomUserCharacteristicValue());
        java.lang.Long id = dod.getRandomUserCharacteristicValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserCharacteristicValue obj = net.sourceforge.anubis.domain.UserCharacteristicValue.findUserCharacteristicValue(id);
        org.junit.Assert.assertNotNull("Find method for 'UserCharacteristicValue' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserCharacteristicValue(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserCharacteristicValue' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserCharacteristicValueIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to initialize correctly", dod.getRandomUserCharacteristicValue());
        java.lang.Long id = dod.getRandomUserCharacteristicValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserCharacteristicValue obj = net.sourceforge.anubis.domain.UserCharacteristicValue.findUserCharacteristicValue(id);
        org.junit.Assert.assertNotNull("Find method for 'UserCharacteristicValue' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserCharacteristicValue(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserCharacteristicValue' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserCharacteristicValueIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to initialize correctly", dod.getRandomUserCharacteristicValue());
        net.sourceforge.anubis.domain.UserCharacteristicValue obj = dod.getNewTransientUserCharacteristicValue(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'UserCharacteristicValue' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'UserCharacteristicValue' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void UserCharacteristicValueIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to initialize correctly", dod.getRandomUserCharacteristicValue());
        java.lang.Long id = dod.getRandomUserCharacteristicValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserCharacteristicValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserCharacteristicValue obj = net.sourceforge.anubis.domain.UserCharacteristicValue.findUserCharacteristicValue(id);
        org.junit.Assert.assertNotNull("Find method for 'UserCharacteristicValue' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'UserCharacteristicValue' with identifier '" + id + "'", net.sourceforge.anubis.domain.UserCharacteristicValue.findUserCharacteristicValue(id));
    }
    
}
