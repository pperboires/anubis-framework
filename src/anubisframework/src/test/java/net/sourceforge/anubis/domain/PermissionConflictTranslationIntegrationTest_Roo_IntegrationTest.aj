package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.PermissionConflictTranslationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionConflictTranslationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PermissionConflictTranslationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PermissionConflictTranslationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private PermissionConflictTranslationDataOnDemand PermissionConflictTranslationIntegrationTest.dod;
    
    @Test
    public void PermissionConflictTranslationIntegrationTest.testCountPermissionConflictTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to initialize correctly", dod.getRandomPermissionConflictTranslation());
        long count = net.sourceforge.anubis.domain.PermissionConflictTranslation.countPermissionConflictTranslations();
        org.junit.Assert.assertTrue("Counter for 'PermissionConflictTranslation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PermissionConflictTranslationIntegrationTest.testFindPermissionConflictTranslation() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to initialize correctly", dod.getRandomPermissionConflictTranslation());
        java.lang.Long id = dod.getRandomPermissionConflictTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.PermissionConflictTranslation obj = net.sourceforge.anubis.domain.PermissionConflictTranslation.findPermissionConflictTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'PermissionConflictTranslation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'PermissionConflictTranslation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void PermissionConflictTranslationIntegrationTest.testFindAllPermissionConflictTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to initialize correctly", dod.getRandomPermissionConflictTranslation());
        long count = net.sourceforge.anubis.domain.PermissionConflictTranslation.countPermissionConflictTranslations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'PermissionConflictTranslation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.PermissionConflictTranslation> result = net.sourceforge.anubis.domain.PermissionConflictTranslation.findAllPermissionConflictTranslations();
        org.junit.Assert.assertNotNull("Find all method for 'PermissionConflictTranslation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'PermissionConflictTranslation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PermissionConflictTranslationIntegrationTest.testFindPermissionConflictTranslationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to initialize correctly", dod.getRandomPermissionConflictTranslation());
        long count = net.sourceforge.anubis.domain.PermissionConflictTranslation.countPermissionConflictTranslations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.PermissionConflictTranslation> result = net.sourceforge.anubis.domain.PermissionConflictTranslation.findPermissionConflictTranslationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'PermissionConflictTranslation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'PermissionConflictTranslation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void PermissionConflictTranslationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to initialize correctly", dod.getRandomPermissionConflictTranslation());
        java.lang.Long id = dod.getRandomPermissionConflictTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.PermissionConflictTranslation obj = net.sourceforge.anubis.domain.PermissionConflictTranslation.findPermissionConflictTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'PermissionConflictTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPermissionConflictTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'PermissionConflictTranslation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void PermissionConflictTranslationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to initialize correctly", dod.getRandomPermissionConflictTranslation());
        java.lang.Long id = dod.getRandomPermissionConflictTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.PermissionConflictTranslation obj = net.sourceforge.anubis.domain.PermissionConflictTranslation.findPermissionConflictTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'PermissionConflictTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPermissionConflictTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'PermissionConflictTranslation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void PermissionConflictTranslationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to initialize correctly", dod.getRandomPermissionConflictTranslation());
        net.sourceforge.anubis.domain.PermissionConflictTranslation obj = dod.getNewTransientPermissionConflictTranslation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'PermissionConflictTranslation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'PermissionConflictTranslation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void PermissionConflictTranslationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to initialize correctly", dod.getRandomPermissionConflictTranslation());
        java.lang.Long id = dod.getRandomPermissionConflictTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflictTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.PermissionConflictTranslation obj = net.sourceforge.anubis.domain.PermissionConflictTranslation.findPermissionConflictTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'PermissionConflictTranslation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'PermissionConflictTranslation' with identifier '" + id + "'", net.sourceforge.anubis.domain.PermissionConflictTranslation.findPermissionConflictTranslation(id));
    }
    
}
