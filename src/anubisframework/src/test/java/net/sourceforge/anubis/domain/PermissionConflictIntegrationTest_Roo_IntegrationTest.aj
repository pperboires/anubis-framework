package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.PermissionConflictDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionConflictIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PermissionConflictIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PermissionConflictIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private PermissionConflictDataOnDemand PermissionConflictIntegrationTest.dod;
    
    @Test
    public void PermissionConflictIntegrationTest.testCountPermissionConflicts() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to initialize correctly", dod.getRandomPermissionConflict());
        long count = net.sourceforge.anubis.domain.PermissionConflict.countPermissionConflicts();
        org.junit.Assert.assertTrue("Counter for 'PermissionConflict' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PermissionConflictIntegrationTest.testFindPermissionConflict() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to initialize correctly", dod.getRandomPermissionConflict());
        java.lang.Long id = dod.getRandomPermissionConflict().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.PermissionConflict obj = net.sourceforge.anubis.domain.PermissionConflict.findPermissionConflict(id);
        org.junit.Assert.assertNotNull("Find method for 'PermissionConflict' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'PermissionConflict' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void PermissionConflictIntegrationTest.testFindAllPermissionConflicts() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to initialize correctly", dod.getRandomPermissionConflict());
        long count = net.sourceforge.anubis.domain.PermissionConflict.countPermissionConflicts();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'PermissionConflict', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.PermissionConflict> result = net.sourceforge.anubis.domain.PermissionConflict.findAllPermissionConflicts();
        org.junit.Assert.assertNotNull("Find all method for 'PermissionConflict' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'PermissionConflict' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PermissionConflictIntegrationTest.testFindPermissionConflictEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to initialize correctly", dod.getRandomPermissionConflict());
        long count = net.sourceforge.anubis.domain.PermissionConflict.countPermissionConflicts();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.PermissionConflict> result = net.sourceforge.anubis.domain.PermissionConflict.findPermissionConflictEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'PermissionConflict' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'PermissionConflict' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void PermissionConflictIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to initialize correctly", dod.getRandomPermissionConflict());
        java.lang.Long id = dod.getRandomPermissionConflict().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.PermissionConflict obj = net.sourceforge.anubis.domain.PermissionConflict.findPermissionConflict(id);
        org.junit.Assert.assertNotNull("Find method for 'PermissionConflict' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPermissionConflict(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'PermissionConflict' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void PermissionConflictIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to initialize correctly", dod.getRandomPermissionConflict());
        java.lang.Long id = dod.getRandomPermissionConflict().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.PermissionConflict obj = net.sourceforge.anubis.domain.PermissionConflict.findPermissionConflict(id);
        org.junit.Assert.assertNotNull("Find method for 'PermissionConflict' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPermissionConflict(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'PermissionConflict' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void PermissionConflictIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to initialize correctly", dod.getRandomPermissionConflict());
        net.sourceforge.anubis.domain.PermissionConflict obj = dod.getNewTransientPermissionConflict(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'PermissionConflict' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'PermissionConflict' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void PermissionConflictIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to initialize correctly", dod.getRandomPermissionConflict());
        java.lang.Long id = dod.getRandomPermissionConflict().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'PermissionConflict' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.PermissionConflict obj = net.sourceforge.anubis.domain.PermissionConflict.findPermissionConflict(id);
        org.junit.Assert.assertNotNull("Find method for 'PermissionConflict' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'PermissionConflict' with identifier '" + id + "'", net.sourceforge.anubis.domain.PermissionConflict.findPermissionConflict(id));
    }
    
}
