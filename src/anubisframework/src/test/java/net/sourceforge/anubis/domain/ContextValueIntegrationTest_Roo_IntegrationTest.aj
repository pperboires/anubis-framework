package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ContextValueDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContextValueIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ContextValueIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ContextValueIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ContextValueDataOnDemand ContextValueIntegrationTest.dod;
    
    @Test
    public void ContextValueIntegrationTest.testCountContextValues() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to initialize correctly", dod.getRandomContextValue());
        long count = net.sourceforge.anubis.domain.ContextValue.countContextValues();
        org.junit.Assert.assertTrue("Counter for 'ContextValue' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ContextValueIntegrationTest.testFindContextValue() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to initialize correctly", dod.getRandomContextValue());
        java.lang.Long id = dod.getRandomContextValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ContextValue obj = net.sourceforge.anubis.domain.ContextValue.findContextValue(id);
        org.junit.Assert.assertNotNull("Find method for 'ContextValue' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ContextValue' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ContextValueIntegrationTest.testFindAllContextValues() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to initialize correctly", dod.getRandomContextValue());
        long count = net.sourceforge.anubis.domain.ContextValue.countContextValues();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ContextValue', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.ContextValue> result = net.sourceforge.anubis.domain.ContextValue.findAllContextValues();
        org.junit.Assert.assertNotNull("Find all method for 'ContextValue' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ContextValue' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ContextValueIntegrationTest.testFindContextValueEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to initialize correctly", dod.getRandomContextValue());
        long count = net.sourceforge.anubis.domain.ContextValue.countContextValues();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.ContextValue> result = net.sourceforge.anubis.domain.ContextValue.findContextValueEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ContextValue' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ContextValue' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ContextValueIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to initialize correctly", dod.getRandomContextValue());
        java.lang.Long id = dod.getRandomContextValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ContextValue obj = net.sourceforge.anubis.domain.ContextValue.findContextValue(id);
        org.junit.Assert.assertNotNull("Find method for 'ContextValue' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyContextValue(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ContextValue' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ContextValueIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to initialize correctly", dod.getRandomContextValue());
        java.lang.Long id = dod.getRandomContextValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ContextValue obj = net.sourceforge.anubis.domain.ContextValue.findContextValue(id);
        org.junit.Assert.assertNotNull("Find method for 'ContextValue' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyContextValue(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ContextValue' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ContextValueIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to initialize correctly", dod.getRandomContextValue());
        net.sourceforge.anubis.domain.ContextValue obj = dod.getNewTransientContextValue(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ContextValue' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ContextValue' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ContextValueIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to initialize correctly", dod.getRandomContextValue());
        java.lang.Long id = dod.getRandomContextValue().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValue' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ContextValue obj = net.sourceforge.anubis.domain.ContextValue.findContextValue(id);
        org.junit.Assert.assertNotNull("Find method for 'ContextValue' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'ContextValue' with identifier '" + id + "'", net.sourceforge.anubis.domain.ContextValue.findContextValue(id));
    }
    
}
