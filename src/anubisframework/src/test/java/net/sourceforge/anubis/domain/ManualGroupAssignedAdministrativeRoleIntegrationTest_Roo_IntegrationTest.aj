package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRoleDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ManualGroupAssignedAdministrativeRoleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ManualGroupAssignedAdministrativeRoleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ManualGroupAssignedAdministrativeRoleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ManualGroupAssignedAdministrativeRoleDataOnDemand ManualGroupAssignedAdministrativeRoleIntegrationTest.dod;
    
    @Test
    public void ManualGroupAssignedAdministrativeRoleIntegrationTest.testCountManualGroupAssignedAdministrativeRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomManualGroupAssignedAdministrativeRole());
        long count = net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole.countManualGroupAssignedAdministrativeRoles();
        org.junit.Assert.assertTrue("Counter for 'ManualGroupAssignedAdministrativeRole' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ManualGroupAssignedAdministrativeRoleIntegrationTest.testFindManualGroupAssignedAdministrativeRole() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomManualGroupAssignedAdministrativeRole());
        java.lang.Long id = dod.getRandomManualGroupAssignedAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole obj = net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupAssignedAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ManualGroupAssignedAdministrativeRole' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void ManualGroupAssignedAdministrativeRoleIntegrationTest.testFindAllManualGroupAssignedAdministrativeRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomManualGroupAssignedAdministrativeRole());
        long count = net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole.countManualGroupAssignedAdministrativeRoles();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ManualGroupAssignedAdministrativeRole', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole> result = net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole.findAllManualGroupAssignedAdministrativeRoles();
        org.junit.Assert.assertNotNull("Find all method for 'ManualGroupAssignedAdministrativeRole' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ManualGroupAssignedAdministrativeRole' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ManualGroupAssignedAdministrativeRoleIntegrationTest.testFindManualGroupAssignedAdministrativeRoleEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomManualGroupAssignedAdministrativeRole());
        long count = net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole.countManualGroupAssignedAdministrativeRoles();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole> result = net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRoleEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ManualGroupAssignedAdministrativeRole' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ManualGroupAssignedAdministrativeRole' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ManualGroupAssignedAdministrativeRoleIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomManualGroupAssignedAdministrativeRole());
        java.lang.Long id = dod.getRandomManualGroupAssignedAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole obj = net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupAssignedAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyManualGroupAssignedAdministrativeRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ManualGroupAssignedAdministrativeRole' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ManualGroupAssignedAdministrativeRoleIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomManualGroupAssignedAdministrativeRole());
        java.lang.Long id = dod.getRandomManualGroupAssignedAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole obj = net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupAssignedAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyManualGroupAssignedAdministrativeRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ManualGroupAssignedAdministrativeRole' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ManualGroupAssignedAdministrativeRoleIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomManualGroupAssignedAdministrativeRole());
        net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole obj = dod.getNewTransientManualGroupAssignedAdministrativeRole(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ManualGroupAssignedAdministrativeRole' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ManualGroupAssignedAdministrativeRole' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void ManualGroupAssignedAdministrativeRoleIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to initialize correctly", dod.getRandomManualGroupAssignedAdministrativeRole());
        java.lang.Long id = dod.getRandomManualGroupAssignedAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'ManualGroupAssignedAdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole obj = net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'ManualGroupAssignedAdministrativeRole' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'ManualGroupAssignedAdministrativeRole' with identifier '" + id + "'", net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRole(id));
    }
    
}
