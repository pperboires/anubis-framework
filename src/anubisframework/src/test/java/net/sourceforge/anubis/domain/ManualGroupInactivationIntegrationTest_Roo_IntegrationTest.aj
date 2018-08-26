package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ManualGroupInactivationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupInactivationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ManualGroupInactivationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ManualGroupInactivationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ManualGroupInactivationDataOnDemand ManualGroupInactivationIntegrationTest.dod;
    
    @Test
    public void ManualGroupInactivationIntegrationTest.testCountManualGroupInactivations() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to initialize correctly", dod.getRandomManualGroupInactivation());
        long count = net.sourceforge.anubis.domain.ManualGroupInactivation.countManualGroupInactivations();
        org.junit.Assert.assertTrue("Counter for 'ManualGroupInactivation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ManualGroupInactivationIntegrationTest.testFindManualGroupInactivation() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to initialize correctly", dod.getRandomManualGroupInactivation());
        java.lang.Long id = dod.getRandomManualGroupInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupInactivation obj = net.sourceforge.anubis.domain.ManualGroupInactivation.findManualGroupInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupInactivation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ManualGroupInactivation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ManualGroupInactivationIntegrationTest.testFindAllManualGroupInactivations() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to initialize correctly", dod.getRandomManualGroupInactivation());
        long count = net.sourceforge.anubis.domain.ManualGroupInactivation.countManualGroupInactivations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ManualGroupInactivation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.ManualGroupInactivation> result = net.sourceforge.anubis.domain.ManualGroupInactivation.findAllManualGroupInactivations();
        org.junit.Assert.assertNotNull("Find all method for 'ManualGroupInactivation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ManualGroupInactivation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ManualGroupInactivationIntegrationTest.testFindManualGroupInactivationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to initialize correctly", dod.getRandomManualGroupInactivation());
        long count = net.sourceforge.anubis.domain.ManualGroupInactivation.countManualGroupInactivations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.ManualGroupInactivation> result = net.sourceforge.anubis.domain.ManualGroupInactivation.findManualGroupInactivationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ManualGroupInactivation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ManualGroupInactivation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ManualGroupInactivationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to initialize correctly", dod.getRandomManualGroupInactivation());
        java.lang.Long id = dod.getRandomManualGroupInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupInactivation obj = net.sourceforge.anubis.domain.ManualGroupInactivation.findManualGroupInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupInactivation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyManualGroupInactivation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ManualGroupInactivation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ManualGroupInactivationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to initialize correctly", dod.getRandomManualGroupInactivation());
        java.lang.Long id = dod.getRandomManualGroupInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupInactivation obj = net.sourceforge.anubis.domain.ManualGroupInactivation.findManualGroupInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupInactivation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyManualGroupInactivation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ManualGroupInactivation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ManualGroupInactivationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to initialize correctly", dod.getRandomManualGroupInactivation());
        net.sourceforge.anubis.domain.ManualGroupInactivation obj = dod.getNewTransientManualGroupInactivation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ManualGroupInactivation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ManualGroupInactivation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ManualGroupInactivationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to initialize correctly", dod.getRandomManualGroupInactivation());
        java.lang.Long id = dod.getRandomManualGroupInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupInactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupInactivation obj = net.sourceforge.anubis.domain.ManualGroupInactivation.findManualGroupInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupInactivation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'ManualGroupInactivation' with identifier '" + id + "'", net.sourceforge.anubis.domain.ManualGroupInactivation.findManualGroupInactivation(id));
    }
    
}
