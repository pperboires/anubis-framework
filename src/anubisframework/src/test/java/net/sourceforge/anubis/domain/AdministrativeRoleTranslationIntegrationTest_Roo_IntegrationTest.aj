package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.AdministrativeRoleTranslationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AdministrativeRoleTranslationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AdministrativeRoleTranslationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AdministrativeRoleTranslationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private AdministrativeRoleTranslationDataOnDemand AdministrativeRoleTranslationIntegrationTest.dod;
    
    @Test
    public void AdministrativeRoleTranslationIntegrationTest.testCountAdministrativeRoleTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to initialize correctly", dod.getRandomAdministrativeRoleTranslation());
        long count = net.sourceforge.anubis.domain.AdministrativeRoleTranslation.countAdministrativeRoleTranslations();
        org.junit.Assert.assertTrue("Counter for 'AdministrativeRoleTranslation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AdministrativeRoleTranslationIntegrationTest.testFindAdministrativeRoleTranslation() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to initialize correctly", dod.getRandomAdministrativeRoleTranslation());
        java.lang.Long id = dod.getRandomAdministrativeRoleTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.AdministrativeRoleTranslation obj = net.sourceforge.anubis.domain.AdministrativeRoleTranslation.findAdministrativeRoleTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'AdministrativeRoleTranslation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'AdministrativeRoleTranslation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void AdministrativeRoleTranslationIntegrationTest.testFindAllAdministrativeRoleTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to initialize correctly", dod.getRandomAdministrativeRoleTranslation());
        long count = net.sourceforge.anubis.domain.AdministrativeRoleTranslation.countAdministrativeRoleTranslations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'AdministrativeRoleTranslation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.AdministrativeRoleTranslation> result = net.sourceforge.anubis.domain.AdministrativeRoleTranslation.findAllAdministrativeRoleTranslations();
        org.junit.Assert.assertNotNull("Find all method for 'AdministrativeRoleTranslation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'AdministrativeRoleTranslation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AdministrativeRoleTranslationIntegrationTest.testFindAdministrativeRoleTranslationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to initialize correctly", dod.getRandomAdministrativeRoleTranslation());
        long count = net.sourceforge.anubis.domain.AdministrativeRoleTranslation.countAdministrativeRoleTranslations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.AdministrativeRoleTranslation> result = net.sourceforge.anubis.domain.AdministrativeRoleTranslation.findAdministrativeRoleTranslationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'AdministrativeRoleTranslation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'AdministrativeRoleTranslation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void AdministrativeRoleTranslationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to initialize correctly", dod.getRandomAdministrativeRoleTranslation());
        java.lang.Long id = dod.getRandomAdministrativeRoleTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.AdministrativeRoleTranslation obj = net.sourceforge.anubis.domain.AdministrativeRoleTranslation.findAdministrativeRoleTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'AdministrativeRoleTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAdministrativeRoleTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'AdministrativeRoleTranslation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void AdministrativeRoleTranslationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to initialize correctly", dod.getRandomAdministrativeRoleTranslation());
        java.lang.Long id = dod.getRandomAdministrativeRoleTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.AdministrativeRoleTranslation obj = net.sourceforge.anubis.domain.AdministrativeRoleTranslation.findAdministrativeRoleTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'AdministrativeRoleTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAdministrativeRoleTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'AdministrativeRoleTranslation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void AdministrativeRoleTranslationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to initialize correctly", dod.getRandomAdministrativeRoleTranslation());
        net.sourceforge.anubis.domain.AdministrativeRoleTranslation obj = dod.getNewTransientAdministrativeRoleTranslation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'AdministrativeRoleTranslation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'AdministrativeRoleTranslation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void AdministrativeRoleTranslationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to initialize correctly", dod.getRandomAdministrativeRoleTranslation());
        java.lang.Long id = dod.getRandomAdministrativeRoleTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRoleTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.AdministrativeRoleTranslation obj = net.sourceforge.anubis.domain.AdministrativeRoleTranslation.findAdministrativeRoleTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'AdministrativeRoleTranslation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'AdministrativeRoleTranslation' with identifier '" + id + "'", net.sourceforge.anubis.domain.AdministrativeRoleTranslation.findAdministrativeRoleTranslation(id));
    }
    
}
