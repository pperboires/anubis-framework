package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ContextDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContextIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ContextIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ContextIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ContextDataOnDemand ContextIntegrationTest.dod;
    
    @Test
    public void ContextIntegrationTest.testCountContexts() {
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to initialize correctly", dod.getRandomContext());
        long count = net.sourceforge.anubis.domain.Context.countContexts();
        org.junit.Assert.assertTrue("Counter for 'Context' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ContextIntegrationTest.testFindContext() {
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to initialize correctly", dod.getRandomContext());
        java.lang.Long id = dod.getRandomContext().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Context obj = net.sourceforge.anubis.domain.Context.findContext(id);
        org.junit.Assert.assertNotNull("Find method for 'Context' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Context' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ContextIntegrationTest.testFindAllContexts() {
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to initialize correctly", dod.getRandomContext());
        long count = net.sourceforge.anubis.domain.Context.countContexts();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Context', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.Context> result = net.sourceforge.anubis.domain.Context.findAllContexts();
        org.junit.Assert.assertNotNull("Find all method for 'Context' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Context' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ContextIntegrationTest.testFindContextEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to initialize correctly", dod.getRandomContext());
        long count = net.sourceforge.anubis.domain.Context.countContexts();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.Context> result = net.sourceforge.anubis.domain.Context.findContextEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Context' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Context' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ContextIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to initialize correctly", dod.getRandomContext());
        java.lang.Long id = dod.getRandomContext().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Context obj = net.sourceforge.anubis.domain.Context.findContext(id);
        org.junit.Assert.assertNotNull("Find method for 'Context' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyContext(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Context' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ContextIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to initialize correctly", dod.getRandomContext());
        java.lang.Long id = dod.getRandomContext().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Context obj = net.sourceforge.anubis.domain.Context.findContext(id);
        org.junit.Assert.assertNotNull("Find method for 'Context' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyContext(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Context' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ContextIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to initialize correctly", dod.getRandomContext());
        net.sourceforge.anubis.domain.Context obj = dod.getNewTransientContext(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Context' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Context' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ContextIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to initialize correctly", dod.getRandomContext());
        java.lang.Long id = dod.getRandomContext().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Context' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Context obj = net.sourceforge.anubis.domain.Context.findContext(id);
        org.junit.Assert.assertNotNull("Find method for 'Context' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Context' with identifier '" + id + "'", net.sourceforge.anubis.domain.Context.findContext(id));
    }
    
}
