package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ApplicationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ApplicationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ApplicationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ApplicationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ApplicationDataOnDemand ApplicationIntegrationTest.dod;
    
    @Test
    public void ApplicationIntegrationTest.testCountApplications() {
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to initialize correctly", dod.getRandomApplication());
        long count = net.sourceforge.anubis.domain.Application.countApplications();
        org.junit.Assert.assertTrue("Counter for 'Application' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ApplicationIntegrationTest.testFindApplication() {
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to initialize correctly", dod.getRandomApplication());
        java.lang.Long id = dod.getRandomApplication().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Application obj = net.sourceforge.anubis.domain.Application.findApplication(id);
        org.junit.Assert.assertNotNull("Find method for 'Application' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Application' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ApplicationIntegrationTest.testFindAllApplications() {
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to initialize correctly", dod.getRandomApplication());
        long count = net.sourceforge.anubis.domain.Application.countApplications();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Application', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.Application> result = net.sourceforge.anubis.domain.Application.findAllApplications();
        org.junit.Assert.assertNotNull("Find all method for 'Application' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Application' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ApplicationIntegrationTest.testFindApplicationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to initialize correctly", dod.getRandomApplication());
        long count = net.sourceforge.anubis.domain.Application.countApplications();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.Application> result = net.sourceforge.anubis.domain.Application.findApplicationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Application' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Application' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ApplicationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to initialize correctly", dod.getRandomApplication());
        java.lang.Long id = dod.getRandomApplication().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Application obj = net.sourceforge.anubis.domain.Application.findApplication(id);
        org.junit.Assert.assertNotNull("Find method for 'Application' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyApplication(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Application' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ApplicationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to initialize correctly", dod.getRandomApplication());
        java.lang.Long id = dod.getRandomApplication().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Application obj = net.sourceforge.anubis.domain.Application.findApplication(id);
        org.junit.Assert.assertNotNull("Find method for 'Application' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyApplication(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Application' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ApplicationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to initialize correctly", dod.getRandomApplication());
        net.sourceforge.anubis.domain.Application obj = dod.getNewTransientApplication(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Application' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Application' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ApplicationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to initialize correctly", dod.getRandomApplication());
        java.lang.Long id = dod.getRandomApplication().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Application' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Application obj = net.sourceforge.anubis.domain.Application.findApplication(id);
        org.junit.Assert.assertNotNull("Find method for 'Application' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Application' with identifier '" + id + "'", net.sourceforge.anubis.domain.Application.findApplication(id));
    }
    
}
