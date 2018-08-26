package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CommonRoleAssignedPermissionDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CommonRoleAssignedPermissionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CommonRoleAssignedPermissionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CommonRoleAssignedPermissionIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CommonRoleAssignedPermissionDataOnDemand CommonRoleAssignedPermissionIntegrationTest.dod;
    
    @Test
    public void CommonRoleAssignedPermissionIntegrationTest.testCountCommonRoleAssignedPermissions() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to initialize correctly", dod.getRandomCommonRoleAssignedPermission());
        long count = net.sourceforge.anubis.domain.CommonRoleAssignedPermission.countCommonRoleAssignedPermissions();
        org.junit.Assert.assertTrue("Counter for 'CommonRoleAssignedPermission' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CommonRoleAssignedPermissionIntegrationTest.testFindCommonRoleAssignedPermission() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to initialize correctly", dod.getRandomCommonRoleAssignedPermission());
        java.lang.Long id = dod.getRandomCommonRoleAssignedPermission().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CommonRoleAssignedPermission obj = net.sourceforge.anubis.domain.CommonRoleAssignedPermission.findCommonRoleAssignedPermission(id);
        org.junit.Assert.assertNotNull("Find method for 'CommonRoleAssignedPermission' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CommonRoleAssignedPermission' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void CommonRoleAssignedPermissionIntegrationTest.testFindAllCommonRoleAssignedPermissions() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to initialize correctly", dod.getRandomCommonRoleAssignedPermission());
        long count = net.sourceforge.anubis.domain.CommonRoleAssignedPermission.countCommonRoleAssignedPermissions();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CommonRoleAssignedPermission', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.CommonRoleAssignedPermission> result = net.sourceforge.anubis.domain.CommonRoleAssignedPermission.findAllCommonRoleAssignedPermissions();
        org.junit.Assert.assertNotNull("Find all method for 'CommonRoleAssignedPermission' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CommonRoleAssignedPermission' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CommonRoleAssignedPermissionIntegrationTest.testFindCommonRoleAssignedPermissionEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to initialize correctly", dod.getRandomCommonRoleAssignedPermission());
        long count = net.sourceforge.anubis.domain.CommonRoleAssignedPermission.countCommonRoleAssignedPermissions();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.CommonRoleAssignedPermission> result = net.sourceforge.anubis.domain.CommonRoleAssignedPermission.findCommonRoleAssignedPermissionEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'CommonRoleAssignedPermission' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CommonRoleAssignedPermission' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CommonRoleAssignedPermissionIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to initialize correctly", dod.getRandomCommonRoleAssignedPermission());
        java.lang.Long id = dod.getRandomCommonRoleAssignedPermission().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CommonRoleAssignedPermission obj = net.sourceforge.anubis.domain.CommonRoleAssignedPermission.findCommonRoleAssignedPermission(id);
        org.junit.Assert.assertNotNull("Find method for 'CommonRoleAssignedPermission' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCommonRoleAssignedPermission(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CommonRoleAssignedPermission' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CommonRoleAssignedPermissionIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to initialize correctly", dod.getRandomCommonRoleAssignedPermission());
        java.lang.Long id = dod.getRandomCommonRoleAssignedPermission().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CommonRoleAssignedPermission obj = net.sourceforge.anubis.domain.CommonRoleAssignedPermission.findCommonRoleAssignedPermission(id);
        org.junit.Assert.assertNotNull("Find method for 'CommonRoleAssignedPermission' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCommonRoleAssignedPermission(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CommonRoleAssignedPermission' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CommonRoleAssignedPermissionIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to initialize correctly", dod.getRandomCommonRoleAssignedPermission());
        net.sourceforge.anubis.domain.CommonRoleAssignedPermission obj = dod.getNewTransientCommonRoleAssignedPermission(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CommonRoleAssignedPermission' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CommonRoleAssignedPermission' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void CommonRoleAssignedPermissionIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to initialize correctly", dod.getRandomCommonRoleAssignedPermission());
        java.lang.Long id = dod.getRandomCommonRoleAssignedPermission().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRoleAssignedPermission' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CommonRoleAssignedPermission obj = net.sourceforge.anubis.domain.CommonRoleAssignedPermission.findCommonRoleAssignedPermission(id);
        org.junit.Assert.assertNotNull("Find method for 'CommonRoleAssignedPermission' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'CommonRoleAssignedPermission' with identifier '" + id + "'", net.sourceforge.anubis.domain.CommonRoleAssignedPermission.findCommonRoleAssignedPermission(id));
    }
    
}
