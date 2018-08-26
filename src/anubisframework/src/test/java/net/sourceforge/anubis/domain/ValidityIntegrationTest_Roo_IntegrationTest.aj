package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ValidityDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ValidityIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ValidityIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ValidityIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ValidityDataOnDemand ValidityIntegrationTest.dod;
    
    @Test
    public void ValidityIntegrationTest.testCountValiditys() {
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to initialize correctly", dod.getRandomValidity());
        long count = net.sourceforge.anubis.domain.Validity.countValiditys();
        org.junit.Assert.assertTrue("Counter for 'Validity' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ValidityIntegrationTest.testFindValidity() {
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to initialize correctly", dod.getRandomValidity());
        java.lang.Long id = dod.getRandomValidity().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Validity obj = net.sourceforge.anubis.domain.Validity.findValidity(id);
        org.junit.Assert.assertNotNull("Find method for 'Validity' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Validity' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ValidityIntegrationTest.testFindAllValiditys() {
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to initialize correctly", dod.getRandomValidity());
        long count = net.sourceforge.anubis.domain.Validity.countValiditys();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Validity', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.Validity> result = net.sourceforge.anubis.domain.Validity.findAllValiditys();
        org.junit.Assert.assertNotNull("Find all method for 'Validity' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Validity' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ValidityIntegrationTest.testFindValidityEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to initialize correctly", dod.getRandomValidity());
        long count = net.sourceforge.anubis.domain.Validity.countValiditys();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.Validity> result = net.sourceforge.anubis.domain.Validity.findValidityEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Validity' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Validity' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ValidityIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to initialize correctly", dod.getRandomValidity());
        java.lang.Long id = dod.getRandomValidity().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Validity obj = net.sourceforge.anubis.domain.Validity.findValidity(id);
        org.junit.Assert.assertNotNull("Find method for 'Validity' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyValidity(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Validity' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ValidityIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to initialize correctly", dod.getRandomValidity());
        java.lang.Long id = dod.getRandomValidity().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Validity obj = net.sourceforge.anubis.domain.Validity.findValidity(id);
        org.junit.Assert.assertNotNull("Find method for 'Validity' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyValidity(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Validity' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ValidityIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to initialize correctly", dod.getRandomValidity());
        net.sourceforge.anubis.domain.Validity obj = dod.getNewTransientValidity(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Validity' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Validity' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ValidityIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to initialize correctly", dod.getRandomValidity());
        java.lang.Long id = dod.getRandomValidity().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Validity' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Validity obj = net.sourceforge.anubis.domain.Validity.findValidity(id);
        org.junit.Assert.assertNotNull("Find method for 'Validity' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Validity' with identifier '" + id + "'", net.sourceforge.anubis.domain.Validity.findValidity(id));
    }
    
}
