package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ApplicationAccountDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ApplicationAccountIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ApplicationAccountIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ApplicationAccountIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ApplicationAccountDataOnDemand ApplicationAccountIntegrationTest.dod;
    
    @Test
    public void ApplicationAccountIntegrationTest.testCountApplicationAccounts() {
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to initialize correctly", dod.getRandomApplicationAccount());
        long count = net.sourceforge.anubis.domain.ApplicationAccount.countApplicationAccounts();
        org.junit.Assert.assertTrue("Counter for 'ApplicationAccount' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ApplicationAccountIntegrationTest.testFindApplicationAccount() {
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to initialize correctly", dod.getRandomApplicationAccount());
        java.lang.Long id = dod.getRandomApplicationAccount().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ApplicationAccount obj = net.sourceforge.anubis.domain.ApplicationAccount.findApplicationAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'ApplicationAccount' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ApplicationAccount' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ApplicationAccountIntegrationTest.testFindAllApplicationAccounts() {
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to initialize correctly", dod.getRandomApplicationAccount());
        long count = net.sourceforge.anubis.domain.ApplicationAccount.countApplicationAccounts();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ApplicationAccount', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.ApplicationAccount> result = net.sourceforge.anubis.domain.ApplicationAccount.findAllApplicationAccounts();
        org.junit.Assert.assertNotNull("Find all method for 'ApplicationAccount' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ApplicationAccount' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ApplicationAccountIntegrationTest.testFindApplicationAccountEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to initialize correctly", dod.getRandomApplicationAccount());
        long count = net.sourceforge.anubis.domain.ApplicationAccount.countApplicationAccounts();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.ApplicationAccount> result = net.sourceforge.anubis.domain.ApplicationAccount.findApplicationAccountEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ApplicationAccount' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ApplicationAccount' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ApplicationAccountIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to initialize correctly", dod.getRandomApplicationAccount());
        java.lang.Long id = dod.getRandomApplicationAccount().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ApplicationAccount obj = net.sourceforge.anubis.domain.ApplicationAccount.findApplicationAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'ApplicationAccount' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyApplicationAccount(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ApplicationAccount' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ApplicationAccountIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to initialize correctly", dod.getRandomApplicationAccount());
        java.lang.Long id = dod.getRandomApplicationAccount().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ApplicationAccount obj = net.sourceforge.anubis.domain.ApplicationAccount.findApplicationAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'ApplicationAccount' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyApplicationAccount(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ApplicationAccount' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ApplicationAccountIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to initialize correctly", dod.getRandomApplicationAccount());
        net.sourceforge.anubis.domain.ApplicationAccount obj = dod.getNewTransientApplicationAccount(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ApplicationAccount' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ApplicationAccount' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ApplicationAccountIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to initialize correctly", dod.getRandomApplicationAccount());
        java.lang.Long id = dod.getRandomApplicationAccount().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ApplicationAccount' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ApplicationAccount obj = net.sourceforge.anubis.domain.ApplicationAccount.findApplicationAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'ApplicationAccount' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'ApplicationAccount' with identifier '" + id + "'", net.sourceforge.anubis.domain.ApplicationAccount.findApplicationAccount(id));
    }
    
}
