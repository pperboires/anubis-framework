package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.InactivationTranslationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect InactivationTranslationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: InactivationTranslationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: InactivationTranslationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private InactivationTranslationDataOnDemand InactivationTranslationIntegrationTest.dod;
    
    @Test
    public void InactivationTranslationIntegrationTest.testCountInactivationTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to initialize correctly", dod.getRandomInactivationTranslation());
        long count = net.sourceforge.anubis.domain.InactivationTranslation.countInactivationTranslations();
        org.junit.Assert.assertTrue("Counter for 'InactivationTranslation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void InactivationTranslationIntegrationTest.testFindInactivationTranslation() {
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to initialize correctly", dod.getRandomInactivationTranslation());
        java.lang.Long id = dod.getRandomInactivationTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.InactivationTranslation obj = net.sourceforge.anubis.domain.InactivationTranslation.findInactivationTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'InactivationTranslation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'InactivationTranslation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void InactivationTranslationIntegrationTest.testFindAllInactivationTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to initialize correctly", dod.getRandomInactivationTranslation());
        long count = net.sourceforge.anubis.domain.InactivationTranslation.countInactivationTranslations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'InactivationTranslation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.InactivationTranslation> result = net.sourceforge.anubis.domain.InactivationTranslation.findAllInactivationTranslations();
        org.junit.Assert.assertNotNull("Find all method for 'InactivationTranslation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'InactivationTranslation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void InactivationTranslationIntegrationTest.testFindInactivationTranslationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to initialize correctly", dod.getRandomInactivationTranslation());
        long count = net.sourceforge.anubis.domain.InactivationTranslation.countInactivationTranslations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.InactivationTranslation> result = net.sourceforge.anubis.domain.InactivationTranslation.findInactivationTranslationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'InactivationTranslation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'InactivationTranslation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void InactivationTranslationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to initialize correctly", dod.getRandomInactivationTranslation());
        java.lang.Long id = dod.getRandomInactivationTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.InactivationTranslation obj = net.sourceforge.anubis.domain.InactivationTranslation.findInactivationTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'InactivationTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyInactivationTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'InactivationTranslation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void InactivationTranslationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to initialize correctly", dod.getRandomInactivationTranslation());
        java.lang.Long id = dod.getRandomInactivationTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.InactivationTranslation obj = net.sourceforge.anubis.domain.InactivationTranslation.findInactivationTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'InactivationTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyInactivationTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'InactivationTranslation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void InactivationTranslationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to initialize correctly", dod.getRandomInactivationTranslation());
        net.sourceforge.anubis.domain.InactivationTranslation obj = dod.getNewTransientInactivationTranslation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'InactivationTranslation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'InactivationTranslation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void InactivationTranslationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to initialize correctly", dod.getRandomInactivationTranslation());
        java.lang.Long id = dod.getRandomInactivationTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'InactivationTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.InactivationTranslation obj = net.sourceforge.anubis.domain.InactivationTranslation.findInactivationTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'InactivationTranslation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'InactivationTranslation' with identifier '" + id + "'", net.sourceforge.anubis.domain.InactivationTranslation.findInactivationTranslation(id));
    }
    
}
