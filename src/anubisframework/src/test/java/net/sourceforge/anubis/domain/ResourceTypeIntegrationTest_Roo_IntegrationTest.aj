package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ResourceTypeDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ResourceTypeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ResourceTypeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ResourceTypeIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ResourceTypeDataOnDemand ResourceTypeIntegrationTest.dod;
    
    @Test
    public void ResourceTypeIntegrationTest.testCountResourceTypes() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to initialize correctly", dod.getRandomResourceType());
        long count = net.sourceforge.anubis.domain.ResourceType.countResourceTypes();
        org.junit.Assert.assertTrue("Counter for 'ResourceType' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ResourceTypeIntegrationTest.testFindResourceType() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to initialize correctly", dod.getRandomResourceType());
        java.lang.Long id = dod.getRandomResourceType().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ResourceType obj = net.sourceforge.anubis.domain.ResourceType.findResourceType(id);
        org.junit.Assert.assertNotNull("Find method for 'ResourceType' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ResourceType' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ResourceTypeIntegrationTest.testFindAllResourceTypes() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to initialize correctly", dod.getRandomResourceType());
        long count = net.sourceforge.anubis.domain.ResourceType.countResourceTypes();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ResourceType', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.ResourceType> result = net.sourceforge.anubis.domain.ResourceType.findAllResourceTypes();
        org.junit.Assert.assertNotNull("Find all method for 'ResourceType' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ResourceType' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ResourceTypeIntegrationTest.testFindResourceTypeEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to initialize correctly", dod.getRandomResourceType());
        long count = net.sourceforge.anubis.domain.ResourceType.countResourceTypes();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.ResourceType> result = net.sourceforge.anubis.domain.ResourceType.findResourceTypeEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ResourceType' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ResourceType' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ResourceTypeIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to initialize correctly", dod.getRandomResourceType());
        java.lang.Long id = dod.getRandomResourceType().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ResourceType obj = net.sourceforge.anubis.domain.ResourceType.findResourceType(id);
        org.junit.Assert.assertNotNull("Find method for 'ResourceType' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyResourceType(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ResourceType' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ResourceTypeIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to initialize correctly", dod.getRandomResourceType());
        java.lang.Long id = dod.getRandomResourceType().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ResourceType obj = net.sourceforge.anubis.domain.ResourceType.findResourceType(id);
        org.junit.Assert.assertNotNull("Find method for 'ResourceType' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyResourceType(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ResourceType' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ResourceTypeIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to initialize correctly", dod.getRandomResourceType());
        net.sourceforge.anubis.domain.ResourceType obj = dod.getNewTransientResourceType(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ResourceType' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ResourceType' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ResourceTypeIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to initialize correctly", dod.getRandomResourceType());
        java.lang.Long id = dod.getRandomResourceType().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceType' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ResourceType obj = net.sourceforge.anubis.domain.ResourceType.findResourceType(id);
        org.junit.Assert.assertNotNull("Find method for 'ResourceType' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'ResourceType' with identifier '" + id + "'", net.sourceforge.anubis.domain.ResourceType.findResourceType(id));
    }
    
}
