package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ResourceDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ResourceIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ResourceIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ResourceIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ResourceDataOnDemand ResourceIntegrationTest.dod;
    
    @Test
    public void ResourceIntegrationTest.testCountResources() {
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to initialize correctly", dod.getRandomResource());
        long count = net.sourceforge.anubis.domain.Resource.countResources();
        org.junit.Assert.assertTrue("Counter for 'Resource' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ResourceIntegrationTest.testFindResource() {
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to initialize correctly", dod.getRandomResource());
        java.lang.Long id = dod.getRandomResource().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Resource obj = net.sourceforge.anubis.domain.Resource.findResource(id);
        org.junit.Assert.assertNotNull("Find method for 'Resource' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Resource' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ResourceIntegrationTest.testFindAllResources() {
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to initialize correctly", dod.getRandomResource());
        long count = net.sourceforge.anubis.domain.Resource.countResources();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Resource', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.Resource> result = net.sourceforge.anubis.domain.Resource.findAllResources();
        org.junit.Assert.assertNotNull("Find all method for 'Resource' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Resource' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ResourceIntegrationTest.testFindResourceEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to initialize correctly", dod.getRandomResource());
        long count = net.sourceforge.anubis.domain.Resource.countResources();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.Resource> result = net.sourceforge.anubis.domain.Resource.findResourceEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Resource' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Resource' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ResourceIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to initialize correctly", dod.getRandomResource());
        java.lang.Long id = dod.getRandomResource().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Resource obj = net.sourceforge.anubis.domain.Resource.findResource(id);
        org.junit.Assert.assertNotNull("Find method for 'Resource' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyResource(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Resource' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ResourceIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to initialize correctly", dod.getRandomResource());
        java.lang.Long id = dod.getRandomResource().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Resource obj = net.sourceforge.anubis.domain.Resource.findResource(id);
        org.junit.Assert.assertNotNull("Find method for 'Resource' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyResource(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Resource' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ResourceIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to initialize correctly", dod.getRandomResource());
        net.sourceforge.anubis.domain.Resource obj = dod.getNewTransientResource(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Resource' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Resource' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ResourceIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to initialize correctly", dod.getRandomResource());
        java.lang.Long id = dod.getRandomResource().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Resource' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Resource obj = net.sourceforge.anubis.domain.Resource.findResource(id);
        org.junit.Assert.assertNotNull("Find method for 'Resource' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Resource' with identifier '" + id + "'", net.sourceforge.anubis.domain.Resource.findResource(id));
    }
    
}
