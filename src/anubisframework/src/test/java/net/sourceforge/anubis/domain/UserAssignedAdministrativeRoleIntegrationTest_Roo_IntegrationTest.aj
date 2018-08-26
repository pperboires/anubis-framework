package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.UserAssignedAdministrativeRoleDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAssignedAdministrativeRoleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserAssignedAdministrativeRoleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserAssignedAdministrativeRoleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private UserAssignedAdministrativeRoleDataOnDemand UserAssignedAdministrativeRoleIntegrationTest.dod;
    
    @Test
    public void UserAssignedAdministrativeRoleIntegrationTest.testCountUserAssignedAdministrativeRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedAdministrativeRole());
        long count = net.sourceforge.anubis.domain.UserAssignedAdministrativeRole.countUserAssignedAdministrativeRoles();
        org.junit.Assert.assertTrue("Counter for 'UserAssignedAdministrativeRole' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserAssignedAdministrativeRoleIntegrationTest.testFindUserAssignedAdministrativeRole() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedAdministrativeRole());
        java.lang.Long id = dod.getRandomUserAssignedAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedAdministrativeRole obj = net.sourceforge.anubis.domain.UserAssignedAdministrativeRole.findUserAssignedAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'UserAssignedAdministrativeRole' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void UserAssignedAdministrativeRoleIntegrationTest.testFindAllUserAssignedAdministrativeRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedAdministrativeRole());
        long count = net.sourceforge.anubis.domain.UserAssignedAdministrativeRole.countUserAssignedAdministrativeRoles();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'UserAssignedAdministrativeRole', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.UserAssignedAdministrativeRole> result = net.sourceforge.anubis.domain.UserAssignedAdministrativeRole.findAllUserAssignedAdministrativeRoles();
        org.junit.Assert.assertNotNull("Find all method for 'UserAssignedAdministrativeRole' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'UserAssignedAdministrativeRole' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserAssignedAdministrativeRoleIntegrationTest.testFindUserAssignedAdministrativeRoleEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedAdministrativeRole());
        long count = net.sourceforge.anubis.domain.UserAssignedAdministrativeRole.countUserAssignedAdministrativeRoles();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.UserAssignedAdministrativeRole> result = net.sourceforge.anubis.domain.UserAssignedAdministrativeRole.findUserAssignedAdministrativeRoleEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'UserAssignedAdministrativeRole' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'UserAssignedAdministrativeRole' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void UserAssignedAdministrativeRoleIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedAdministrativeRole());
        java.lang.Long id = dod.getRandomUserAssignedAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedAdministrativeRole obj = net.sourceforge.anubis.domain.UserAssignedAdministrativeRole.findUserAssignedAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserAssignedAdministrativeRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserAssignedAdministrativeRole' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserAssignedAdministrativeRoleIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedAdministrativeRole());
        java.lang.Long id = dod.getRandomUserAssignedAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedAdministrativeRole obj = net.sourceforge.anubis.domain.UserAssignedAdministrativeRole.findUserAssignedAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserAssignedAdministrativeRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserAssignedAdministrativeRole' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserAssignedAdministrativeRoleIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedAdministrativeRole());
        net.sourceforge.anubis.domain.UserAssignedAdministrativeRole obj = dod.getNewTransientUserAssignedAdministrativeRole(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'UserAssignedAdministrativeRole' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'UserAssignedAdministrativeRole' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void UserAssignedAdministrativeRoleIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedAdministrativeRole());
        java.lang.Long id = dod.getRandomUserAssignedAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedAdministrativeRole obj = net.sourceforge.anubis.domain.UserAssignedAdministrativeRole.findUserAssignedAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'UserAssignedAdministrativeRole' with identifier '" + id + "'", net.sourceforge.anubis.domain.UserAssignedAdministrativeRole.findUserAssignedAdministrativeRole(id));
    }
    
}
