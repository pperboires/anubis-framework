package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualizationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAssignedCommonRoleContextualizationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserAssignedCommonRoleContextualizationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserAssignedCommonRoleContextualizationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private UserAssignedCommonRoleContextualizationDataOnDemand UserAssignedCommonRoleContextualizationIntegrationTest.dod;
    
    @Test
    public void UserAssignedCommonRoleContextualizationIntegrationTest.testCountUserAssignedCommonRoleContextualizations() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to initialize correctly", dod.getRandomUserAssignedCommonRoleContextualization());
        long count = net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization.countUserAssignedCommonRoleContextualizations();
        org.junit.Assert.assertTrue("Counter for 'UserAssignedCommonRoleContextualization' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserAssignedCommonRoleContextualizationIntegrationTest.testFindUserAssignedCommonRoleContextualization() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to initialize correctly", dod.getRandomUserAssignedCommonRoleContextualization());
        java.lang.Long id = dod.getRandomUserAssignedCommonRoleContextualization().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization obj = net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualization(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedCommonRoleContextualization' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'UserAssignedCommonRoleContextualization' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void UserAssignedCommonRoleContextualizationIntegrationTest.testFindAllUserAssignedCommonRoleContextualizations() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to initialize correctly", dod.getRandomUserAssignedCommonRoleContextualization());
        long count = net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization.countUserAssignedCommonRoleContextualizations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'UserAssignedCommonRoleContextualization', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization> result = net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization.findAllUserAssignedCommonRoleContextualizations();
        org.junit.Assert.assertNotNull("Find all method for 'UserAssignedCommonRoleContextualization' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'UserAssignedCommonRoleContextualization' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserAssignedCommonRoleContextualizationIntegrationTest.testFindUserAssignedCommonRoleContextualizationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to initialize correctly", dod.getRandomUserAssignedCommonRoleContextualization());
        long count = net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization.countUserAssignedCommonRoleContextualizations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization> result = net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualizationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'UserAssignedCommonRoleContextualization' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'UserAssignedCommonRoleContextualization' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void UserAssignedCommonRoleContextualizationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to initialize correctly", dod.getRandomUserAssignedCommonRoleContextualization());
        java.lang.Long id = dod.getRandomUserAssignedCommonRoleContextualization().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization obj = net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualization(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedCommonRoleContextualization' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserAssignedCommonRoleContextualization(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserAssignedCommonRoleContextualization' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserAssignedCommonRoleContextualizationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to initialize correctly", dod.getRandomUserAssignedCommonRoleContextualization());
        java.lang.Long id = dod.getRandomUserAssignedCommonRoleContextualization().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization obj = net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualization(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedCommonRoleContextualization' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserAssignedCommonRoleContextualization(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserAssignedCommonRoleContextualization' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void UserAssignedCommonRoleContextualizationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to initialize correctly", dod.getRandomUserAssignedCommonRoleContextualization());
        net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization obj = dod.getNewTransientUserAssignedCommonRoleContextualization(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'UserAssignedCommonRoleContextualization' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'UserAssignedCommonRoleContextualization' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void UserAssignedCommonRoleContextualizationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to initialize correctly", dod.getRandomUserAssignedCommonRoleContextualization());
        java.lang.Long id = dod.getRandomUserAssignedCommonRoleContextualization().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'UserAssignedCommonRoleContextualization' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization obj = net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualization(id);
        org.junit.Assert.assertNotNull("Find method for 'UserAssignedCommonRoleContextualization' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'UserAssignedCommonRoleContextualization' with identifier '" + id + "'", net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualization(id));
    }
    
}
