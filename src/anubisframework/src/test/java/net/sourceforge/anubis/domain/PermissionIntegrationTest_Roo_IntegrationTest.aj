package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.PermissionDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PermissionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PermissionIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private PermissionDataOnDemand PermissionIntegrationTest.dod;
    
    @Test
    public void PermissionIntegrationTest.testCountPermissions() {
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", dod.getRandomPermission());
        long count = net.sourceforge.anubis.domain.Permission.countPermissions();
        org.junit.Assert.assertTrue("Counter for 'Permission' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PermissionIntegrationTest.testFindPermission() {
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", dod.getRandomPermission());
        java.lang.Long id = dod.getRandomPermission().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Permission obj = net.sourceforge.anubis.domain.Permission.findPermission(id);
        org.junit.Assert.assertNotNull("Find method for 'Permission' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Permission' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void PermissionIntegrationTest.testFindAllPermissions() {
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", dod.getRandomPermission());
        long count = net.sourceforge.anubis.domain.Permission.countPermissions();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Permission', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.Permission> result = net.sourceforge.anubis.domain.Permission.findAllPermissions();
        org.junit.Assert.assertNotNull("Find all method for 'Permission' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Permission' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PermissionIntegrationTest.testFindPermissionEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", dod.getRandomPermission());
        long count = net.sourceforge.anubis.domain.Permission.countPermissions();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.Permission> result = net.sourceforge.anubis.domain.Permission.findPermissionEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Permission' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Permission' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void PermissionIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", dod.getRandomPermission());
        java.lang.Long id = dod.getRandomPermission().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Permission obj = net.sourceforge.anubis.domain.Permission.findPermission(id);
        org.junit.Assert.assertNotNull("Find method for 'Permission' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPermission(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Permission' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void PermissionIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", dod.getRandomPermission());
        java.lang.Long id = dod.getRandomPermission().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Permission obj = net.sourceforge.anubis.domain.Permission.findPermission(id);
        org.junit.Assert.assertNotNull("Find method for 'Permission' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPermission(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Permission' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void PermissionIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", dod.getRandomPermission());
        net.sourceforge.anubis.domain.Permission obj = dod.getNewTransientPermission(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Permission' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Permission' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void PermissionIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", dod.getRandomPermission());
        java.lang.Long id = dod.getRandomPermission().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Permission' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Permission obj = net.sourceforge.anubis.domain.Permission.findPermission(id);
        org.junit.Assert.assertNotNull("Find method for 'Permission' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Permission' with identifier '" + id + "'", net.sourceforge.anubis.domain.Permission.findPermission(id));
    }
    
}
