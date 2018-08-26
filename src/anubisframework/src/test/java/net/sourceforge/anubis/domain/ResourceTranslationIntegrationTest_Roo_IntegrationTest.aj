package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ResourceTranslationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ResourceTranslationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ResourceTranslationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ResourceTranslationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ResourceTranslationDataOnDemand ResourceTranslationIntegrationTest.dod;
    
    @Test
    public void ResourceTranslationIntegrationTest.testCountResourceTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to initialize correctly", dod.getRandomResourceTranslation());
        long count = net.sourceforge.anubis.domain.ResourceTranslation.countResourceTranslations();
        org.junit.Assert.assertTrue("Counter for 'ResourceTranslation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ResourceTranslationIntegrationTest.testFindResourceTranslation() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to initialize correctly", dod.getRandomResourceTranslation());
        java.lang.Long id = dod.getRandomResourceTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ResourceTranslation obj = net.sourceforge.anubis.domain.ResourceTranslation.findResourceTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ResourceTranslation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ResourceTranslation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ResourceTranslationIntegrationTest.testFindAllResourceTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to initialize correctly", dod.getRandomResourceTranslation());
        long count = net.sourceforge.anubis.domain.ResourceTranslation.countResourceTranslations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ResourceTranslation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.ResourceTranslation> result = net.sourceforge.anubis.domain.ResourceTranslation.findAllResourceTranslations();
        org.junit.Assert.assertNotNull("Find all method for 'ResourceTranslation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ResourceTranslation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ResourceTranslationIntegrationTest.testFindResourceTranslationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to initialize correctly", dod.getRandomResourceTranslation());
        long count = net.sourceforge.anubis.domain.ResourceTranslation.countResourceTranslations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.ResourceTranslation> result = net.sourceforge.anubis.domain.ResourceTranslation.findResourceTranslationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ResourceTranslation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ResourceTranslation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ResourceTranslationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to initialize correctly", dod.getRandomResourceTranslation());
        java.lang.Long id = dod.getRandomResourceTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ResourceTranslation obj = net.sourceforge.anubis.domain.ResourceTranslation.findResourceTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ResourceTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyResourceTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ResourceTranslation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ResourceTranslationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to initialize correctly", dod.getRandomResourceTranslation());
        java.lang.Long id = dod.getRandomResourceTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ResourceTranslation obj = net.sourceforge.anubis.domain.ResourceTranslation.findResourceTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ResourceTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyResourceTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ResourceTranslation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ResourceTranslationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to initialize correctly", dod.getRandomResourceTranslation());
        net.sourceforge.anubis.domain.ResourceTranslation obj = dod.getNewTransientResourceTranslation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ResourceTranslation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ResourceTranslation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ResourceTranslationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to initialize correctly", dod.getRandomResourceTranslation());
        java.lang.Long id = dod.getRandomResourceTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ResourceTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ResourceTranslation obj = net.sourceforge.anubis.domain.ResourceTranslation.findResourceTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ResourceTranslation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'ResourceTranslation' with identifier '" + id + "'", net.sourceforge.anubis.domain.ResourceTranslation.findResourceTranslation(id));
    }
    
}
