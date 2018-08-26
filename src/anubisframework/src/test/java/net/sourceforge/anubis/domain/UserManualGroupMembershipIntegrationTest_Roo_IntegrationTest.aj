package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.UserManualGroupMembershipDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserManualGroupMembershipIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserManualGroupMembershipIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserManualGroupMembershipIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private UserManualGroupMembershipDataOnDemand UserManualGroupMembershipIntegrationTest.dod;
    
    @Test
    public void UserManualGroupMembershipIntegrationTest.testCountUserManualGroupMemberships() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to initialize correctly", dod.getRandomUserManualGroupMembership());
        long count = net.sourceforge.anubis.domain.UserManualGroupMembership.countUserManualGroupMemberships();
        org.junit.Assert.assertTrue("Counter for 'UserManualGroupMembership' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserManualGroupMembershipIntegrationTest.testFindUserManualGroupMembership() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to initialize correctly", dod.getRandomUserManualGroupMembership());
        java.lang.Long id = dod.getRandomUserManualGroupMembership().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserManualGroupMembership obj = net.sourceforge.anubis.domain.UserManualGroupMembership.findUserManualGroupMembership(id);
        org.junit.Assert.assertNotNull("Find method for 'UserManualGroupMembership' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'UserManualGroupMembership' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void UserManualGroupMembershipIntegrationTest.testFindAllUserManualGroupMemberships() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to initialize correctly", dod.getRandomUserManualGroupMembership());
        long count = net.sourceforge.anubis.domain.UserManualGroupMembership.countUserManualGroupMemberships();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'UserManualGroupMembership', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.UserManualGroupMembership> result = net.sourceforge.anubis.domain.UserManualGroupMembership.findAllUserManualGroupMemberships();
        org.junit.Assert.assertNotNull("Find all method for 'UserManualGroupMembership' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'UserManualGroupMembership' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserManualGroupMembershipIntegrationTest.testFindUserManualGroupMembershipEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to initialize correctly", dod.getRandomUserManualGroupMembership());
        long count = net.sourceforge.anubis.domain.UserManualGroupMembership.countUserManualGroupMemberships();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.UserManualGroupMembership> result = net.sourceforge.anubis.domain.UserManualGroupMembership.findUserManualGroupMembershipEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'UserManualGroupMembership' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'UserManualGroupMembership' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void UserManualGroupMembershipIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to initialize correctly", dod.getRandomUserManualGroupMembership());
        java.lang.Long id = dod.getRandomUserManualGroupMembership().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserManualGroupMembership obj = net.sourceforge.anubis.domain.UserManualGroupMembership.findUserManualGroupMembership(id);
        org.junit.Assert.assertNotNull("Find method for 'UserManualGroupMembership' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserManualGroupMembership(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserManualGroupMembership' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserManualGroupMembershipIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to initialize correctly", dod.getRandomUserManualGroupMembership());
        java.lang.Long id = dod.getRandomUserManualGroupMembership().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserManualGroupMembership obj = net.sourceforge.anubis.domain.UserManualGroupMembership.findUserManualGroupMembership(id);
        org.junit.Assert.assertNotNull("Find method for 'UserManualGroupMembership' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserManualGroupMembership(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserManualGroupMembership' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserManualGroupMembershipIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to initialize correctly", dod.getRandomUserManualGroupMembership());
        net.sourceforge.anubis.domain.UserManualGroupMembership obj = dod.getNewTransientUserManualGroupMembership(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'UserManualGroupMembership' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'UserManualGroupMembership' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void UserManualGroupMembershipIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to initialize correctly", dod.getRandomUserManualGroupMembership());
        java.lang.Long id = dod.getRandomUserManualGroupMembership().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserManualGroupMembership' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserManualGroupMembership obj = net.sourceforge.anubis.domain.UserManualGroupMembership.findUserManualGroupMembership(id);
        org.junit.Assert.assertNotNull("Find method for 'UserManualGroupMembership' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'UserManualGroupMembership' with identifier '" + id + "'", net.sourceforge.anubis.domain.UserManualGroupMembership.findUserManualGroupMembership(id));
    }
    
}
