package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.UserAccountDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAccountIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserAccountIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserAccountIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private UserAccountDataOnDemand UserAccountIntegrationTest.dod;
    
    @Test
    public void UserAccountIntegrationTest.testCountUserAccounts() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to initialize correctly", dod.getRandomUserAccount());
        long count = net.sourceforge.anubis.domain.UserAccount.countUserAccounts();
        org.junit.Assert.assertTrue("Counter for 'UserAccount' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserAccountIntegrationTest.testFindUserAccount() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to initialize correctly", dod.getRandomUserAccount());
        java.lang.Long id = dod.getRandomUserAccount().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAccount obj = net.sourceforge.anubis.domain.UserAccount.findUserAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAccount' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'UserAccount' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void UserAccountIntegrationTest.testFindAllUserAccounts() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to initialize correctly", dod.getRandomUserAccount());
        long count = net.sourceforge.anubis.domain.UserAccount.countUserAccounts();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'UserAccount', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.UserAccount> result = net.sourceforge.anubis.domain.UserAccount.findAllUserAccounts();
        org.junit.Assert.assertNotNull("Find all method for 'UserAccount' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'UserAccount' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserAccountIntegrationTest.testFindUserAccountEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to initialize correctly", dod.getRandomUserAccount());
        long count = net.sourceforge.anubis.domain.UserAccount.countUserAccounts();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.UserAccount> result = net.sourceforge.anubis.domain.UserAccount.findUserAccountEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'UserAccount' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'UserAccount' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void UserAccountIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to initialize correctly", dod.getRandomUserAccount());
        java.lang.Long id = dod.getRandomUserAccount().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAccount obj = net.sourceforge.anubis.domain.UserAccount.findUserAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAccount' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserAccount(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserAccount' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserAccountIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to initialize correctly", dod.getRandomUserAccount());
        java.lang.Long id = dod.getRandomUserAccount().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAccount obj = net.sourceforge.anubis.domain.UserAccount.findUserAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAccount' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserAccount(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserAccount' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserAccountIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to initialize correctly", dod.getRandomUserAccount());
        net.sourceforge.anubis.domain.UserAccount obj = dod.getNewTransientUserAccount(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'UserAccount' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'UserAccount' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void UserAccountIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to initialize correctly", dod.getRandomUserAccount());
        java.lang.Long id = dod.getRandomUserAccount().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAccount' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAccount obj = net.sourceforge.anubis.domain.UserAccount.findUserAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAccount' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'UserAccount' with identifier '" + id + "'", net.sourceforge.anubis.domain.UserAccount.findUserAccount(id));
    }
    
}
