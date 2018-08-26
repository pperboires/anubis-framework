package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ManualGroupAssignedCommonRoleDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupAssignedCommonRoleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ManualGroupAssignedCommonRoleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ManualGroupAssignedCommonRoleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ManualGroupAssignedCommonRoleDataOnDemand ManualGroupAssignedCommonRoleIntegrationTest.dod;
    
    @Test
    public void ManualGroupAssignedCommonRoleIntegrationTest.testCountManualGroupAssignedCommonRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomManualGroupAssignedCommonRole());
        long count = net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole.countManualGroupAssignedCommonRoles();
        org.junit.Assert.assertTrue("Counter for 'ManualGroupAssignedCommonRole' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ManualGroupAssignedCommonRoleIntegrationTest.testFindManualGroupAssignedCommonRole() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomManualGroupAssignedCommonRole());
        java.lang.Long id = dod.getRandomManualGroupAssignedCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole obj = net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupAssignedCommonRole' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ManualGroupAssignedCommonRole' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ManualGroupAssignedCommonRoleIntegrationTest.testFindAllManualGroupAssignedCommonRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomManualGroupAssignedCommonRole());
        long count = net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole.countManualGroupAssignedCommonRoles();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ManualGroupAssignedCommonRole', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole> result = net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole.findAllManualGroupAssignedCommonRoles();
        org.junit.Assert.assertNotNull("Find all method for 'ManualGroupAssignedCommonRole' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ManualGroupAssignedCommonRole' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ManualGroupAssignedCommonRoleIntegrationTest.testFindManualGroupAssignedCommonRoleEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomManualGroupAssignedCommonRole());
        long count = net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole.countManualGroupAssignedCommonRoles();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole> result = net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRoleEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ManualGroupAssignedCommonRole' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ManualGroupAssignedCommonRole' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ManualGroupAssignedCommonRoleIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomManualGroupAssignedCommonRole());
        java.lang.Long id = dod.getRandomManualGroupAssignedCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole obj = net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupAssignedCommonRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyManualGroupAssignedCommonRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ManualGroupAssignedCommonRole' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ManualGroupAssignedCommonRoleIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomManualGroupAssignedCommonRole());
        java.lang.Long id = dod.getRandomManualGroupAssignedCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole obj = net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupAssignedCommonRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyManualGroupAssignedCommonRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ManualGroupAssignedCommonRole' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ManualGroupAssignedCommonRoleIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomManualGroupAssignedCommonRole());
        net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole obj = dod.getNewTransientManualGroupAssignedCommonRole(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ManualGroupAssignedCommonRole' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ManualGroupAssignedCommonRole' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ManualGroupAssignedCommonRoleIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to initialize correctly", dod.getRandomManualGroupAssignedCommonRole());
        java.lang.Long id = dod.getRandomManualGroupAssignedCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedCommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole obj = net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupAssignedCommonRole' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'ManualGroupAssignedCommonRole' with identifier '" + id + "'", net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRole(id));
    }
    
}
