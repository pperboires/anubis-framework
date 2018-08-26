package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.SupportedLocaleDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SupportedLocaleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SupportedLocaleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SupportedLocaleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private SupportedLocaleDataOnDemand SupportedLocaleIntegrationTest.dod;
    
    @Test
    public void SupportedLocaleIntegrationTest.testCountSupportedLocales() {
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to initialize correctly", dod.getRandomSupportedLocale());
        long count = net.sourceforge.anubis.domain.SupportedLocale.countSupportedLocales();
        org.junit.Assert.assertTrue("Counter for 'SupportedLocale' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SupportedLocaleIntegrationTest.testFindSupportedLocale() {
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to initialize correctly", dod.getRandomSupportedLocale());
        java.lang.Long id = dod.getRandomSupportedLocale().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.SupportedLocale obj = net.sourceforge.anubis.domain.SupportedLocale.findSupportedLocale(id);
        org.junit.Assert.assertNotNull("Find method for 'SupportedLocale' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'SupportedLocale' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void SupportedLocaleIntegrationTest.testFindAllSupportedLocales() {
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to initialize correctly", dod.getRandomSupportedLocale());
        long count = net.sourceforge.anubis.domain.SupportedLocale.countSupportedLocales();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'SupportedLocale', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.SupportedLocale> result = net.sourceforge.anubis.domain.SupportedLocale.findAllSupportedLocales();
        org.junit.Assert.assertNotNull("Find all method for 'SupportedLocale' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'SupportedLocale' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SupportedLocaleIntegrationTest.testFindSupportedLocaleEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to initialize correctly", dod.getRandomSupportedLocale());
        long count = net.sourceforge.anubis.domain.SupportedLocale.countSupportedLocales();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.SupportedLocale> result = net.sourceforge.anubis.domain.SupportedLocale.findSupportedLocaleEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'SupportedLocale' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'SupportedLocale' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void SupportedLocaleIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to initialize correctly", dod.getRandomSupportedLocale());
        java.lang.Long id = dod.getRandomSupportedLocale().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.SupportedLocale obj = net.sourceforge.anubis.domain.SupportedLocale.findSupportedLocale(id);
        org.junit.Assert.assertNotNull("Find method for 'SupportedLocale' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifySupportedLocale(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'SupportedLocale' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void SupportedLocaleIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to initialize correctly", dod.getRandomSupportedLocale());
        java.lang.Long id = dod.getRandomSupportedLocale().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.SupportedLocale obj = net.sourceforge.anubis.domain.SupportedLocale.findSupportedLocale(id);
        org.junit.Assert.assertNotNull("Find method for 'SupportedLocale' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifySupportedLocale(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'SupportedLocale' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void SupportedLocaleIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to initialize correctly", dod.getRandomSupportedLocale());
        net.sourceforge.anubis.domain.SupportedLocale obj = dod.getNewTransientSupportedLocale(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'SupportedLocale' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'SupportedLocale' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void SupportedLocaleIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to initialize correctly", dod.getRandomSupportedLocale());
        java.lang.Long id = dod.getRandomSupportedLocale().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'SupportedLocale' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.SupportedLocale obj = net.sourceforge.anubis.domain.SupportedLocale.findSupportedLocale(id);
        org.junit.Assert.assertNotNull("Find method for 'SupportedLocale' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'SupportedLocale' with identifier '" + id + "'", net.sourceforge.anubis.domain.SupportedLocale.findSupportedLocale(id));
    }
    
}
