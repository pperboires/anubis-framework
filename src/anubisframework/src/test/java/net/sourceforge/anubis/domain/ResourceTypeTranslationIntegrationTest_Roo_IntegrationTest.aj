package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ResourceTypeTranslationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ResourceTypeTranslationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ResourceTypeTranslationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ResourceTypeTranslationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ResourceTypeTranslationDataOnDemand ResourceTypeTranslationIntegrationTest.dod;
    
    @Test
    public void ResourceTypeTranslationIntegrationTest.testCountResourceTypeTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to initialize correctly", dod.getRandomResourceTypeTranslation());
        long count = net.sourceforge.anubis.domain.ResourceTypeTranslation.countResourceTypeTranslations();
        org.junit.Assert.assertTrue("Counter for 'ResourceTypeTranslation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ResourceTypeTranslationIntegrationTest.testFindResourceTypeTranslation() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to initialize correctly", dod.getRandomResourceTypeTranslation());
        java.lang.Long id = dod.getRandomResourceTypeTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ResourceTypeTranslation obj = net.sourceforge.anubis.domain.ResourceTypeTranslation.findResourceTypeTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ResourceTypeTranslation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ResourceTypeTranslation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ResourceTypeTranslationIntegrationTest.testFindAllResourceTypeTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to initialize correctly", dod.getRandomResourceTypeTranslation());
        long count = net.sourceforge.anubis.domain.ResourceTypeTranslation.countResourceTypeTranslations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ResourceTypeTranslation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.ResourceTypeTranslation> result = net.sourceforge.anubis.domain.ResourceTypeTranslation.findAllResourceTypeTranslations();
        org.junit.Assert.assertNotNull("Find all method for 'ResourceTypeTranslation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ResourceTypeTranslation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ResourceTypeTranslationIntegrationTest.testFindResourceTypeTranslationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to initialize correctly", dod.getRandomResourceTypeTranslation());
        long count = net.sourceforge.anubis.domain.ResourceTypeTranslation.countResourceTypeTranslations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.ResourceTypeTranslation> result = net.sourceforge.anubis.domain.ResourceTypeTranslation.findResourceTypeTranslationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ResourceTypeTranslation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ResourceTypeTranslation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ResourceTypeTranslationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to initialize correctly", dod.getRandomResourceTypeTranslation());
        java.lang.Long id = dod.getRandomResourceTypeTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ResourceTypeTranslation obj = net.sourceforge.anubis.domain.ResourceTypeTranslation.findResourceTypeTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ResourceTypeTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyResourceTypeTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ResourceTypeTranslation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ResourceTypeTranslationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to initialize correctly", dod.getRandomResourceTypeTranslation());
        java.lang.Long id = dod.getRandomResourceTypeTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ResourceTypeTranslation obj = net.sourceforge.anubis.domain.ResourceTypeTranslation.findResourceTypeTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ResourceTypeTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyResourceTypeTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ResourceTypeTranslation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ResourceTypeTranslationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to initialize correctly", dod.getRandomResourceTypeTranslation());
        net.sourceforge.anubis.domain.ResourceTypeTranslation obj = dod.getNewTransientResourceTypeTranslation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ResourceTypeTranslation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ResourceTypeTranslation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ResourceTypeTranslationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to initialize correctly", dod.getRandomResourceTypeTranslation());
        java.lang.Long id = dod.getRandomResourceTypeTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTypeTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ResourceTypeTranslation obj = net.sourceforge.anubis.domain.ResourceTypeTranslation.findResourceTypeTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ResourceTypeTranslation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'ResourceTypeTranslation' with identifier '" + id + "'", net.sourceforge.anubis.domain.ResourceTypeTranslation.findResourceTypeTranslation(id));
    }
    
}
