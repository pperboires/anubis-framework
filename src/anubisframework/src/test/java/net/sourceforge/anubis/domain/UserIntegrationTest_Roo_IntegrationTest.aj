package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.UserDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private UserDataOnDemand UserIntegrationTest.dod;
    
    @Test
    public void UserIntegrationTest.testCountUsers() {
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", dod.getRandomUser());
        long count = net.sourceforge.anubis.domain.User.countUsers();
        org.junit.Assert.assertTrue("Counter for 'User' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserIntegrationTest.testFindUser() {
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", dod.getRandomUser());
        java.lang.Long id = dod.getRandomUser().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.User obj = net.sourceforge.anubis.domain.User.findUser(id);
        org.junit.Assert.assertNotNull("Find method for 'User' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'User' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void UserIntegrationTest.testFindAllUsers() {
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", dod.getRandomUser());
        long count = net.sourceforge.anubis.domain.User.countUsers();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'User', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.User> result = net.sourceforge.anubis.domain.User.findAllUsers();
        org.junit.Assert.assertNotNull("Find all method for 'User' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'User' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserIntegrationTest.testFindUserEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", dod.getRandomUser());
        long count = net.sourceforge.anubis.domain.User.countUsers();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.User> result = net.sourceforge.anubis.domain.User.findUserEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'User' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'User' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void UserIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", dod.getRandomUser());
        java.lang.Long id = dod.getRandomUser().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.User obj = net.sourceforge.anubis.domain.User.findUser(id);
        org.junit.Assert.assertNotNull("Find method for 'User' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUser(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'User' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", dod.getRandomUser());
        java.lang.Long id = dod.getRandomUser().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.User obj = net.sourceforge.anubis.domain.User.findUser(id);
        org.junit.Assert.assertNotNull("Find method for 'User' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUser(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'User' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", dod.getRandomUser());
        net.sourceforge.anubis.domain.User obj = dod.getNewTransientUser(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'User' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'User' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void UserIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", dod.getRandomUser());
        java.lang.Long id = dod.getRandomUser().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'User' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.User obj = net.sourceforge.anubis.domain.User.findUser(id);
        org.junit.Assert.assertNotNull("Find method for 'User' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'User' with identifier '" + id + "'", net.sourceforge.anubis.domain.User.findUser(id));
    }
    
}
