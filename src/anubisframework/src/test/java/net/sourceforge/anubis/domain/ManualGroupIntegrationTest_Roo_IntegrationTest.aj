package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ManualGroupDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ManualGroupIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ManualGroupIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ManualGroupDataOnDemand ManualGroupIntegrationTest.dod;
    
    @Test
    public void ManualGroupIntegrationTest.testCountManualGroups() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to initialize correctly", dod.getRandomManualGroup());
        long count = net.sourceforge.anubis.domain.ManualGroup.countManualGroups();
        org.junit.Assert.assertTrue("Counter for 'ManualGroup' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ManualGroupIntegrationTest.testFindManualGroup() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to initialize correctly", dod.getRandomManualGroup());
        java.lang.Long id = dod.getRandomManualGroup().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroup obj = net.sourceforge.anubis.domain.ManualGroup.findManualGroup(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroup' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ManualGroup' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ManualGroupIntegrationTest.testFindAllManualGroups() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to initialize correctly", dod.getRandomManualGroup());
        long count = net.sourceforge.anubis.domain.ManualGroup.countManualGroups();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ManualGroup', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.ManualGroup> result = net.sourceforge.anubis.domain.ManualGroup.findAllManualGroups();
        org.junit.Assert.assertNotNull("Find all method for 'ManualGroup' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ManualGroup' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ManualGroupIntegrationTest.testFindManualGroupEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to initialize correctly", dod.getRandomManualGroup());
        long count = net.sourceforge.anubis.domain.ManualGroup.countManualGroups();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.ManualGroup> result = net.sourceforge.anubis.domain.ManualGroup.findManualGroupEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ManualGroup' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ManualGroup' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ManualGroupIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to initialize correctly", dod.getRandomManualGroup());
        java.lang.Long id = dod.getRandomManualGroup().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroup obj = net.sourceforge.anubis.domain.ManualGroup.findManualGroup(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroup' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyManualGroup(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ManualGroup' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ManualGroupIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to initialize correctly", dod.getRandomManualGroup());
        java.lang.Long id = dod.getRandomManualGroup().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroup obj = net.sourceforge.anubis.domain.ManualGroup.findManualGroup(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroup' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyManualGroup(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ManualGroup' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ManualGroupIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to initialize correctly", dod.getRandomManualGroup());
        net.sourceforge.anubis.domain.ManualGroup obj = dod.getNewTransientManualGroup(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ManualGroup' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ManualGroup' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ManualGroupIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to initialize correctly", dod.getRandomManualGroup());
        java.lang.Long id = dod.getRandomManualGroup().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroup' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroup obj = net.sourceforge.anubis.domain.ManualGroup.findManualGroup(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroup' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'ManualGroup' with identifier '" + id + "'", net.sourceforge.anubis.domain.ManualGroup.findManualGroup(id));
    }
    
}
