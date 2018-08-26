package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ManualGroupTranslationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupTranslationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ManualGroupTranslationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ManualGroupTranslationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ManualGroupTranslationDataOnDemand ManualGroupTranslationIntegrationTest.dod;
    
    @Test
    public void ManualGroupTranslationIntegrationTest.testCountManualGroupTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to initialize correctly", dod.getRandomManualGroupTranslation());
        long count = net.sourceforge.anubis.domain.ManualGroupTranslation.countManualGroupTranslations();
        org.junit.Assert.assertTrue("Counter for 'ManualGroupTranslation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ManualGroupTranslationIntegrationTest.testFindManualGroupTranslation() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to initialize correctly", dod.getRandomManualGroupTranslation());
        java.lang.Long id = dod.getRandomManualGroupTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupTranslation obj = net.sourceforge.anubis.domain.ManualGroupTranslation.findManualGroupTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupTranslation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ManualGroupTranslation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ManualGroupTranslationIntegrationTest.testFindAllManualGroupTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to initialize correctly", dod.getRandomManualGroupTranslation());
        long count = net.sourceforge.anubis.domain.ManualGroupTranslation.countManualGroupTranslations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ManualGroupTranslation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.ManualGroupTranslation> result = net.sourceforge.anubis.domain.ManualGroupTranslation.findAllManualGroupTranslations();
        org.junit.Assert.assertNotNull("Find all method for 'ManualGroupTranslation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ManualGroupTranslation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ManualGroupTranslationIntegrationTest.testFindManualGroupTranslationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to initialize correctly", dod.getRandomManualGroupTranslation());
        long count = net.sourceforge.anubis.domain.ManualGroupTranslation.countManualGroupTranslations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.ManualGroupTranslation> result = net.sourceforge.anubis.domain.ManualGroupTranslation.findManualGroupTranslationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ManualGroupTranslation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ManualGroupTranslation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ManualGroupTranslationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to initialize correctly", dod.getRandomManualGroupTranslation());
        java.lang.Long id = dod.getRandomManualGroupTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupTranslation obj = net.sourceforge.anubis.domain.ManualGroupTranslation.findManualGroupTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyManualGroupTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ManualGroupTranslation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ManualGroupTranslationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to initialize correctly", dod.getRandomManualGroupTranslation());
        java.lang.Long id = dod.getRandomManualGroupTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupTranslation obj = net.sourceforge.anubis.domain.ManualGroupTranslation.findManualGroupTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyManualGroupTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ManualGroupTranslation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ManualGroupTranslationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to initialize correctly", dod.getRandomManualGroupTranslation());
        net.sourceforge.anubis.domain.ManualGroupTranslation obj = dod.getNewTransientManualGroupTranslation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ManualGroupTranslation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ManualGroupTranslation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ManualGroupTranslationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to initialize correctly", dod.getRandomManualGroupTranslation());
        java.lang.Long id = dod.getRandomManualGroupTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupTranslation obj = net.sourceforge.anubis.domain.ManualGroupTranslation.findManualGroupTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupTranslation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'ManualGroupTranslation' with identifier '" + id + "'", net.sourceforge.anubis.domain.ManualGroupTranslation.findManualGroupTranslation(id));
    }
    
}
