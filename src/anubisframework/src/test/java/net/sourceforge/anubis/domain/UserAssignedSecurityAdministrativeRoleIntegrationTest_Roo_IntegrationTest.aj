package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRoleDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAssignedSecurityAdministrativeRoleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserAssignedSecurityAdministrativeRoleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserAssignedSecurityAdministrativeRoleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private UserAssignedSecurityAdministrativeRoleDataOnDemand UserAssignedSecurityAdministrativeRoleIntegrationTest.dod;
    
    @Test
    public void UserAssignedSecurityAdministrativeRoleIntegrationTest.testCountUserAssignedSecurityAdministrativeRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedSecurityAdministrativeRole());
        long count = net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole.countUserAssignedSecurityAdministrativeRoles();
        org.junit.Assert.assertTrue("Counter for 'UserAssignedSecurityAdministrativeRole' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserAssignedSecurityAdministrativeRoleIntegrationTest.testFindUserAssignedSecurityAdministrativeRole() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedSecurityAdministrativeRole());
        java.lang.Long id = dod.getRandomUserAssignedSecurityAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole obj = net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedSecurityAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'UserAssignedSecurityAdministrativeRole' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void UserAssignedSecurityAdministrativeRoleIntegrationTest.testFindAllUserAssignedSecurityAdministrativeRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedSecurityAdministrativeRole());
        long count = net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole.countUserAssignedSecurityAdministrativeRoles();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'UserAssignedSecurityAdministrativeRole', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole> result = net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole.findAllUserAssignedSecurityAdministrativeRoles();
        org.junit.Assert.assertNotNull("Find all method for 'UserAssignedSecurityAdministrativeRole' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'UserAssignedSecurityAdministrativeRole' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserAssignedSecurityAdministrativeRoleIntegrationTest.testFindUserAssignedSecurityAdministrativeRoleEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedSecurityAdministrativeRole());
        long count = net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole.countUserAssignedSecurityAdministrativeRoles();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole> result = net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRoleEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'UserAssignedSecurityAdministrativeRole' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'UserAssignedSecurityAdministrativeRole' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void UserAssignedSecurityAdministrativeRoleIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedSecurityAdministrativeRole());
        java.lang.Long id = dod.getRandomUserAssignedSecurityAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole obj = net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedSecurityAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserAssignedSecurityAdministrativeRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserAssignedSecurityAdministrativeRole' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserAssignedSecurityAdministrativeRoleIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedSecurityAdministrativeRole());
        java.lang.Long id = dod.getRandomUserAssignedSecurityAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole obj = net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedSecurityAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserAssignedSecurityAdministrativeRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserAssignedSecurityAdministrativeRole' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserAssignedSecurityAdministrativeRoleIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedSecurityAdministrativeRole());
        net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole obj = dod.getNewTransientUserAssignedSecurityAdministrativeRole(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'UserAssignedSecurityAdministrativeRole' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'UserAssignedSecurityAdministrativeRole' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void UserAssignedSecurityAdministrativeRoleIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to initialize correctly", dod.getRandomUserAssignedSecurityAdministrativeRole());
        java.lang.Long id = dod.getRandomUserAssignedSecurityAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedSecurityAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole obj = net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedSecurityAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'UserAssignedSecurityAdministrativeRole' with identifier '" + id + "'", net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRole(id));
    }
    
}
