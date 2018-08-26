package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.PermissionContextDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionContextIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PermissionContextIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PermissionContextIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private PermissionContextDataOnDemand PermissionContextIntegrationTest.dod;
    
    @Test
    public void PermissionContextIntegrationTest.testCountPermissionContexts() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to initialize correctly", dod.getRandomPermissionContext());
        long count = net.sourceforge.anubis.domain.PermissionContext.countPermissionContexts();
        org.junit.Assert.assertTrue("Counter for 'PermissionContext' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PermissionContextIntegrationTest.testFindPermissionContext() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to initialize correctly", dod.getRandomPermissionContext());
        java.lang.Long id = dod.getRandomPermissionContext().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.PermissionContext obj = net.sourceforge.anubis.domain.PermissionContext.findPermissionContext(id);
        org.junit.Assert.assertNotNull("Find method for 'PermissionContext' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'PermissionContext' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void PermissionContextIntegrationTest.testFindAllPermissionContexts() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to initialize correctly", dod.getRandomPermissionContext());
        long count = net.sourceforge.anubis.domain.PermissionContext.countPermissionContexts();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'PermissionContext', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.PermissionContext> result = net.sourceforge.anubis.domain.PermissionContext.findAllPermissionContexts();
        org.junit.Assert.assertNotNull("Find all method for 'PermissionContext' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'PermissionContext' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PermissionContextIntegrationTest.testFindPermissionContextEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to initialize correctly", dod.getRandomPermissionContext());
        long count = net.sourceforge.anubis.domain.PermissionContext.countPermissionContexts();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.PermissionContext> result = net.sourceforge.anubis.domain.PermissionContext.findPermissionContextEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'PermissionContext' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'PermissionContext' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void PermissionContextIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to initialize correctly", dod.getRandomPermissionContext());
        java.lang.Long id = dod.getRandomPermissionContext().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.PermissionContext obj = net.sourceforge.anubis.domain.PermissionContext.findPermissionContext(id);
        org.junit.Assert.assertNotNull("Find method for 'PermissionContext' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPermissionContext(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'PermissionContext' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void PermissionContextIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to initialize correctly", dod.getRandomPermissionContext());
        java.lang.Long id = dod.getRandomPermissionContext().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.PermissionContext obj = net.sourceforge.anubis.domain.PermissionContext.findPermissionContext(id);
        org.junit.Assert.assertNotNull("Find method for 'PermissionContext' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPermissionContext(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'PermissionContext' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void PermissionContextIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to initialize correctly", dod.getRandomPermissionContext());
        net.sourceforge.anubis.domain.PermissionContext obj = dod.getNewTransientPermissionContext(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'PermissionContext' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'PermissionContext' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void PermissionContextIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to initialize correctly", dod.getRandomPermissionContext());
        java.lang.Long id = dod.getRandomPermissionContext().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionContext' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.PermissionContext obj = net.sourceforge.anubis.domain.PermissionContext.findPermissionContext(id);
        org.junit.Assert.assertNotNull("Find method for 'PermissionContext' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'PermissionContext' with identifier '" + id + "'", net.sourceforge.anubis.domain.PermissionContext.findPermissionContext(id));
    }
    
}
