package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.UserInactivationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserInactivationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserInactivationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserInactivationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private UserInactivationDataOnDemand UserInactivationIntegrationTest.dod;
    
    @Test
    public void UserInactivationIntegrationTest.testCountUserInactivations() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to initialize correctly", dod.getRandomUserInactivation());
        long count = net.sourceforge.anubis.domain.UserInactivation.countUserInactivations();
        org.junit.Assert.assertTrue("Counter for 'UserInactivation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserInactivationIntegrationTest.testFindUserInactivation() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to initialize correctly", dod.getRandomUserInactivation());
        java.lang.Long id = dod.getRandomUserInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserInactivation obj = net.sourceforge.anubis.domain.UserInactivation.findUserInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'UserInactivation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'UserInactivation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void UserInactivationIntegrationTest.testFindAllUserInactivations() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to initialize correctly", dod.getRandomUserInactivation());
        long count = net.sourceforge.anubis.domain.UserInactivation.countUserInactivations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'UserInactivation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.UserInactivation> result = net.sourceforge.anubis.domain.UserInactivation.findAllUserInactivations();
        org.junit.Assert.assertNotNull("Find all method for 'UserInactivation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'UserInactivation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserInactivationIntegrationTest.testFindUserInactivationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to initialize correctly", dod.getRandomUserInactivation());
        long count = net.sourceforge.anubis.domain.UserInactivation.countUserInactivations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.UserInactivation> result = net.sourceforge.anubis.domain.UserInactivation.findUserInactivationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'UserInactivation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'UserInactivation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void UserInactivationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to initialize correctly", dod.getRandomUserInactivation());
        java.lang.Long id = dod.getRandomUserInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserInactivation obj = net.sourceforge.anubis.domain.UserInactivation.findUserInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'UserInactivation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserInactivation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserInactivation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserInactivationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to initialize correctly", dod.getRandomUserInactivation());
        java.lang.Long id = dod.getRandomUserInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserInactivation obj = net.sourceforge.anubis.domain.UserInactivation.findUserInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'UserInactivation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserInactivation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserInactivation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserInactivationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to initialize correctly", dod.getRandomUserInactivation());
        net.sourceforge.anubis.domain.UserInactivation obj = dod.getNewTransientUserInactivation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'UserInactivation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'UserInactivation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void UserInactivationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to initialize correctly", dod.getRandomUserInactivation());
        java.lang.Long id = dod.getRandomUserInactivation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserInactivation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserInactivation obj = net.sourceforge.anubis.domain.UserInactivation.findUserInactivation(id);
        org.junit.Assert.assertNotNull("Find method for 'UserInactivation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'UserInactivation' with identifier '" + id + "'", net.sourceforge.anubis.domain.UserInactivation.findUserInactivation(id));
    }
    
}
