package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.UserAssignedCommonRoleDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAssignedCommonRoleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserAssignedCommonRoleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserAssignedCommonRoleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private UserAssignedCommonRoleDataOnDemand UserAssignedCommonRoleIntegrationTest.dod;
    
    @Test
    public void UserAssignedCommonRoleIntegrationTest.testCountUserAssignedCommonRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to initialize correctly", dod.getRandomUserAssignedCommonRole());
        long count = net.sourceforge.anubis.domain.UserAssignedCommonRole.countUserAssignedCommonRoles();
        org.junit.Assert.assertTrue("Counter for 'UserAssignedCommonRole' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserAssignedCommonRoleIntegrationTest.testFindUserAssignedCommonRole() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to initialize correctly", dod.getRandomUserAssignedCommonRole());
        java.lang.Long id = dod.getRandomUserAssignedCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedCommonRole obj = net.sourceforge.anubis.domain.UserAssignedCommonRole.findUserAssignedCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedCommonRole' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'UserAssignedCommonRole' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void UserAssignedCommonRoleIntegrationTest.testFindAllUserAssignedCommonRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to initialize correctly", dod.getRandomUserAssignedCommonRole());
        long count = net.sourceforge.anubis.domain.UserAssignedCommonRole.countUserAssignedCommonRoles();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'UserAssignedCommonRole', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.UserAssignedCommonRole> result = net.sourceforge.anubis.domain.UserAssignedCommonRole.findAllUserAssignedCommonRoles();
        org.junit.Assert.assertNotNull("Find all method for 'UserAssignedCommonRole' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'UserAssignedCommonRole' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserAssignedCommonRoleIntegrationTest.testFindUserAssignedCommonRoleEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to initialize correctly", dod.getRandomUserAssignedCommonRole());
        long count = net.sourceforge.anubis.domain.UserAssignedCommonRole.countUserAssignedCommonRoles();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.UserAssignedCommonRole> result = net.sourceforge.anubis.domain.UserAssignedCommonRole.findUserAssignedCommonRoleEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'UserAssignedCommonRole' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'UserAssignedCommonRole' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void UserAssignedCommonRoleIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to initialize correctly", dod.getRandomUserAssignedCommonRole());
        java.lang.Long id = dod.getRandomUserAssignedCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedCommonRole obj = net.sourceforge.anubis.domain.UserAssignedCommonRole.findUserAssignedCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedCommonRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserAssignedCommonRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserAssignedCommonRole' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserAssignedCommonRoleIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to initialize correctly", dod.getRandomUserAssignedCommonRole());
        java.lang.Long id = dod.getRandomUserAssignedCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedCommonRole obj = net.sourceforge.anubis.domain.UserAssignedCommonRole.findUserAssignedCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedCommonRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserAssignedCommonRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserAssignedCommonRole' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserAssignedCommonRoleIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to initialize correctly", dod.getRandomUserAssignedCommonRole());
        net.sourceforge.anubis.domain.UserAssignedCommonRole obj = dod.getNewTransientUserAssignedCommonRole(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'UserAssignedCommonRole' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'UserAssignedCommonRole' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void UserAssignedCommonRoleIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to initialize correctly", dod.getRandomUserAssignedCommonRole());
        java.lang.Long id = dod.getRandomUserAssignedCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedCommonRole obj = net.sourceforge.anubis.domain.UserAssignedCommonRole.findUserAssignedCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedCommonRole' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'UserAssignedCommonRole' with identifier '" + id + "'", net.sourceforge.anubis.domain.UserAssignedCommonRole.findUserAssignedCommonRole(id));
    }
    
}
