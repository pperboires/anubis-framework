package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CommonRoleTranslationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CommonRoleTranslationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CommonRoleTranslationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CommonRoleTranslationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CommonRoleTranslationDataOnDemand CommonRoleTranslationIntegrationTest.dod;
    
    @Test
    public void CommonRoleTranslationIntegrationTest.testCountCommonRoleTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to initialize correctly", dod.getRandomCommonRoleTranslation());
        long count = net.sourceforge.anubis.domain.CommonRoleTranslation.countCommonRoleTranslations();
        org.junit.Assert.assertTrue("Counter for 'CommonRoleTranslation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CommonRoleTranslationIntegrationTest.testFindCommonRoleTranslation() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to initialize correctly", dod.getRandomCommonRoleTranslation());
        java.lang.Long id = dod.getRandomCommonRoleTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CommonRoleTranslation obj = net.sourceforge.anubis.domain.CommonRoleTranslation.findCommonRoleTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'CommonRoleTranslation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CommonRoleTranslation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void CommonRoleTranslationIntegrationTest.testFindAllCommonRoleTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to initialize correctly", dod.getRandomCommonRoleTranslation());
        long count = net.sourceforge.anubis.domain.CommonRoleTranslation.countCommonRoleTranslations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CommonRoleTranslation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.CommonRoleTranslation> result = net.sourceforge.anubis.domain.CommonRoleTranslation.findAllCommonRoleTranslations();
        org.junit.Assert.assertNotNull("Find all method for 'CommonRoleTranslation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CommonRoleTranslation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CommonRoleTranslationIntegrationTest.testFindCommonRoleTranslationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to initialize correctly", dod.getRandomCommonRoleTranslation());
        long count = net.sourceforge.anubis.domain.CommonRoleTranslation.countCommonRoleTranslations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.CommonRoleTranslation> result = net.sourceforge.anubis.domain.CommonRoleTranslation.findCommonRoleTranslationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'CommonRoleTranslation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CommonRoleTranslation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CommonRoleTranslationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to initialize correctly", dod.getRandomCommonRoleTranslation());
        java.lang.Long id = dod.getRandomCommonRoleTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CommonRoleTranslation obj = net.sourceforge.anubis.domain.CommonRoleTranslation.findCommonRoleTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'CommonRoleTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCommonRoleTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CommonRoleTranslation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CommonRoleTranslationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to initialize correctly", dod.getRandomCommonRoleTranslation());
        java.lang.Long id = dod.getRandomCommonRoleTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CommonRoleTranslation obj = net.sourceforge.anubis.domain.CommonRoleTranslation.findCommonRoleTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'CommonRoleTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCommonRoleTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CommonRoleTranslation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CommonRoleTranslationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to initialize correctly", dod.getRandomCommonRoleTranslation());
        net.sourceforge.anubis.domain.CommonRoleTranslation obj = dod.getNewTransientCommonRoleTranslation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CommonRoleTranslation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CommonRoleTranslation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void CommonRoleTranslationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to initialize correctly", dod.getRandomCommonRoleTranslation());
        java.lang.Long id = dod.getRandomCommonRoleTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CommonRoleTranslation obj = net.sourceforge.anubis.domain.CommonRoleTranslation.findCommonRoleTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'CommonRoleTranslation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'CommonRoleTranslation' with identifier '" + id + "'", net.sourceforge.anubis.domain.CommonRoleTranslation.findCommonRoleTranslation(id));
    }
    
}
