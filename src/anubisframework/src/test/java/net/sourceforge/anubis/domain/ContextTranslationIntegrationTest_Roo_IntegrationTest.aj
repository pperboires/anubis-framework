package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ContextTranslationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContextTranslationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ContextTranslationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ContextTranslationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ContextTranslationDataOnDemand ContextTranslationIntegrationTest.dod;
    
    @Test
    public void ContextTranslationIntegrationTest.testCountContextTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to initialize correctly", dod.getRandomContextTranslation());
        long count = net.sourceforge.anubis.domain.ContextTranslation.countContextTranslations();
        org.junit.Assert.assertTrue("Counter for 'ContextTranslation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ContextTranslationIntegrationTest.testFindContextTranslation() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to initialize correctly", dod.getRandomContextTranslation());
        java.lang.Long id = dod.getRandomContextTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ContextTranslation obj = net.sourceforge.anubis.domain.ContextTranslation.findContextTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ContextTranslation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ContextTranslation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ContextTranslationIntegrationTest.testFindAllContextTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to initialize correctly", dod.getRandomContextTranslation());
        long count = net.sourceforge.anubis.domain.ContextTranslation.countContextTranslations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ContextTranslation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.ContextTranslation> result = net.sourceforge.anubis.domain.ContextTranslation.findAllContextTranslations();
        org.junit.Assert.assertNotNull("Find all method for 'ContextTranslation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ContextTranslation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ContextTranslationIntegrationTest.testFindContextTranslationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to initialize correctly", dod.getRandomContextTranslation());
        long count = net.sourceforge.anubis.domain.ContextTranslation.countContextTranslations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.ContextTranslation> result = net.sourceforge.anubis.domain.ContextTranslation.findContextTranslationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ContextTranslation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ContextTranslation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ContextTranslationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to initialize correctly", dod.getRandomContextTranslation());
        java.lang.Long id = dod.getRandomContextTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ContextTranslation obj = net.sourceforge.anubis.domain.ContextTranslation.findContextTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ContextTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyContextTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ContextTranslation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ContextTranslationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to initialize correctly", dod.getRandomContextTranslation());
        java.lang.Long id = dod.getRandomContextTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ContextTranslation obj = net.sourceforge.anubis.domain.ContextTranslation.findContextTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ContextTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyContextTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ContextTranslation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ContextTranslationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to initialize correctly", dod.getRandomContextTranslation());
        net.sourceforge.anubis.domain.ContextTranslation obj = dod.getNewTransientContextTranslation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ContextTranslation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ContextTranslation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ContextTranslationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to initialize correctly", dod.getRandomContextTranslation());
        java.lang.Long id = dod.getRandomContextTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ContextTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ContextTranslation obj = net.sourceforge.anubis.domain.ContextTranslation.findContextTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ContextTranslation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'ContextTranslation' with identifier '" + id + "'", net.sourceforge.anubis.domain.ContextTranslation.findContextTranslation(id));
    }
    
}
