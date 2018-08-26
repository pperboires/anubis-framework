package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.InactivationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect InactivationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: InactivationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: InactivationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private InactivationDataOnDemand InactivationIntegrationTest.dod;
    
    @Test
    public void InactivationIntegrationTest.testCountInactivations() {
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to initialize correctly", dod.getRandomInactivation());
        long count = net.sourceforge.anubis.domain.Inactivation.countInactivations();
        org.junit.Assert.assertTrue("Counter for 'Inactivation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void InactivationIntegrationTest.testFindInactivation() {
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to initialize correctly", dod.getRandomInactivation());
        java.lang.Long id = dod.getRandomInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Inactivation obj = net.sourceforge.anubis.domain.Inactivation.findInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'Inactivation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Inactivation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void InactivationIntegrationTest.testFindAllInactivations() {
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to initialize correctly", dod.getRandomInactivation());
        long count = net.sourceforge.anubis.domain.Inactivation.countInactivations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Inactivation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.Inactivation> result = net.sourceforge.anubis.domain.Inactivation.findAllInactivations();
        org.junit.Assert.assertNotNull("Find all method for 'Inactivation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Inactivation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void InactivationIntegrationTest.testFindInactivationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to initialize correctly", dod.getRandomInactivation());
        long count = net.sourceforge.anubis.domain.Inactivation.countInactivations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.Inactivation> result = net.sourceforge.anubis.domain.Inactivation.findInactivationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Inactivation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Inactivation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void InactivationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to initialize correctly", dod.getRandomInactivation());
        java.lang.Long id = dod.getRandomInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Inactivation obj = net.sourceforge.anubis.domain.Inactivation.findInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'Inactivation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyInactivation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Inactivation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void InactivationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to initialize correctly", dod.getRandomInactivation());
        java.lang.Long id = dod.getRandomInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Inactivation obj = net.sourceforge.anubis.domain.Inactivation.findInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'Inactivation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyInactivation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Inactivation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void InactivationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to initialize correctly", dod.getRandomInactivation());
        net.sourceforge.anubis.domain.Inactivation obj = dod.getNewTransientInactivation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Inactivation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Inactivation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void InactivationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to initialize correctly", dod.getRandomInactivation());
        java.lang.Long id = dod.getRandomInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Inactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Inactivation obj = net.sourceforge.anubis.domain.Inactivation.findInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'Inactivation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Inactivation' with identifier '" + id + "'", net.sourceforge.anubis.domain.Inactivation.findInactivation(id));
    }
    
}
