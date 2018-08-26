package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ContextValueTranslationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContextValueTranslationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ContextValueTranslationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ContextValueTranslationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ContextValueTranslationDataOnDemand ContextValueTranslationIntegrationTest.dod;
    
    @Test
    public void ContextValueTranslationIntegrationTest.testCountContextValueTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to initialize correctly", dod.getRandomContextValueTranslation());
        long count = net.sourceforge.anubis.domain.ContextValueTranslation.countContextValueTranslations();
        org.junit.Assert.assertTrue("Counter for 'ContextValueTranslation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ContextValueTranslationIntegrationTest.testFindContextValueTranslation() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to initialize correctly", dod.getRandomContextValueTranslation());
        java.lang.Long id = dod.getRandomContextValueTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ContextValueTranslation obj = net.sourceforge.anubis.domain.ContextValueTranslation.findContextValueTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ContextValueTranslation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ContextValueTranslation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ContextValueTranslationIntegrationTest.testFindAllContextValueTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to initialize correctly", dod.getRandomContextValueTranslation());
        long count = net.sourceforge.anubis.domain.ContextValueTranslation.countContextValueTranslations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ContextValueTranslation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.ContextValueTranslation> result = net.sourceforge.anubis.domain.ContextValueTranslation.findAllContextValueTranslations();
        org.junit.Assert.assertNotNull("Find all method for 'ContextValueTranslation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ContextValueTranslation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ContextValueTranslationIntegrationTest.testFindContextValueTranslationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to initialize correctly", dod.getRandomContextValueTranslation());
        long count = net.sourceforge.anubis.domain.ContextValueTranslation.countContextValueTranslations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.ContextValueTranslation> result = net.sourceforge.anubis.domain.ContextValueTranslation.findContextValueTranslationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ContextValueTranslation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ContextValueTranslation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ContextValueTranslationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to initialize correctly", dod.getRandomContextValueTranslation());
        java.lang.Long id = dod.getRandomContextValueTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ContextValueTranslation obj = net.sourceforge.anubis.domain.ContextValueTranslation.findContextValueTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ContextValueTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyContextValueTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ContextValueTranslation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ContextValueTranslationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to initialize correctly", dod.getRandomContextValueTranslation());
        java.lang.Long id = dod.getRandomContextValueTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ContextValueTranslation obj = net.sourceforge.anubis.domain.ContextValueTranslation.findContextValueTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ContextValueTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyContextValueTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ContextValueTranslation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ContextValueTranslationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to initialize correctly", dod.getRandomContextValueTranslation());
        net.sourceforge.anubis.domain.ContextValueTranslation obj = dod.getNewTransientContextValueTranslation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ContextValueTranslation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ContextValueTranslation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ContextValueTranslationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to initialize correctly", dod.getRandomContextValueTranslation());
        java.lang.Long id = dod.getRandomContextValueTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ContextValueTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ContextValueTranslation obj = net.sourceforge.anubis.domain.ContextValueTranslation.findContextValueTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ContextValueTranslation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'ContextValueTranslation' with identifier '" + id + "'", net.sourceforge.anubis.domain.ContextValueTranslation.findContextValueTranslation(id));
    }
    
}
