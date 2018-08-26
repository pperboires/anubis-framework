package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.LocaleDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LocaleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: LocaleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: LocaleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private LocaleDataOnDemand LocaleIntegrationTest.dod;
    
    @Test
    public void LocaleIntegrationTest.testCountLocales() {
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to initialize correctly", dod.getRandomLocale());
        long count = net.sourceforge.anubis.domain.Locale.countLocales();
        org.junit.Assert.assertTrue("Counter for 'Locale' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void LocaleIntegrationTest.testFindLocale() {
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to initialize correctly", dod.getRandomLocale());
        java.lang.Long id = dod.getRandomLocale().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Locale obj = net.sourceforge.anubis.domain.Locale.findLocale(id);
        org.junit.Assert.assertNotNull("Find method for 'Locale' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Locale' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void LocaleIntegrationTest.testFindAllLocales() {
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to initialize correctly", dod.getRandomLocale());
        long count = net.sourceforge.anubis.domain.Locale.countLocales();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Locale', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.Locale> result = net.sourceforge.anubis.domain.Locale.findAllLocales();
        org.junit.Assert.assertNotNull("Find all method for 'Locale' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Locale' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void LocaleIntegrationTest.testFindLocaleEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to initialize correctly", dod.getRandomLocale());
        long count = net.sourceforge.anubis.domain.Locale.countLocales();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.Locale> result = net.sourceforge.anubis.domain.Locale.findLocaleEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Locale' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Locale' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void LocaleIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to initialize correctly", dod.getRandomLocale());
        java.lang.Long id = dod.getRandomLocale().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Locale obj = net.sourceforge.anubis.domain.Locale.findLocale(id);
        org.junit.Assert.assertNotNull("Find method for 'Locale' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyLocale(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Locale' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void LocaleIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to initialize correctly", dod.getRandomLocale());
        java.lang.Long id = dod.getRandomLocale().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Locale obj = net.sourceforge.anubis.domain.Locale.findLocale(id);
        org.junit.Assert.assertNotNull("Find method for 'Locale' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyLocale(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Locale' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void LocaleIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to initialize correctly", dod.getRandomLocale());
        net.sourceforge.anubis.domain.Locale obj = dod.getNewTransientLocale(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Locale' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Locale' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void LocaleIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to initialize correctly", dod.getRandomLocale());
        java.lang.Long id = dod.getRandomLocale().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Locale' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Locale obj = net.sourceforge.anubis.domain.Locale.findLocale(id);
        org.junit.Assert.assertNotNull("Find method for 'Locale' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Locale' with identifier '" + id + "'", net.sourceforge.anubis.domain.Locale.findLocale(id));
    }
    
}
