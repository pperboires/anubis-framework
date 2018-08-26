package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.AdministrativeRoleDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AdministrativeRoleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AdministrativeRoleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AdministrativeRoleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private AdministrativeRoleDataOnDemand AdministrativeRoleIntegrationTest.dod;
    
    @Test
    public void AdministrativeRoleIntegrationTest.testCountAdministrativeRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to initialize correctly", dod.getRandomAdministrativeRole());
        long count = net.sourceforge.anubis.domain.AdministrativeRole.countAdministrativeRoles();
        org.junit.Assert.assertTrue("Counter for 'AdministrativeRole' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AdministrativeRoleIntegrationTest.testFindAdministrativeRole() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to initialize correctly", dod.getRandomAdministrativeRole());
        java.lang.Long id = dod.getRandomAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.AdministrativeRole obj = net.sourceforge.anubis.domain.AdministrativeRole.findAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'AdministrativeRole' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'AdministrativeRole' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void AdministrativeRoleIntegrationTest.testFindAllAdministrativeRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to initialize correctly", dod.getRandomAdministrativeRole());
        long count = net.sourceforge.anubis.domain.AdministrativeRole.countAdministrativeRoles();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'AdministrativeRole', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.AdministrativeRole> result = net.sourceforge.anubis.domain.AdministrativeRole.findAllAdministrativeRoles();
        org.junit.Assert.assertNotNull("Find all method for 'AdministrativeRole' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'AdministrativeRole' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AdministrativeRoleIntegrationTest.testFindAdministrativeRoleEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to initialize correctly", dod.getRandomAdministrativeRole());
        long count = net.sourceforge.anubis.domain.AdministrativeRole.countAdministrativeRoles();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.AdministrativeRole> result = net.sourceforge.anubis.domain.AdministrativeRole.findAdministrativeRoleEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'AdministrativeRole' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'AdministrativeRole' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void AdministrativeRoleIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to initialize correctly", dod.getRandomAdministrativeRole());
        java.lang.Long id = dod.getRandomAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.AdministrativeRole obj = net.sourceforge.anubis.domain.AdministrativeRole.findAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'AdministrativeRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAdministrativeRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'AdministrativeRole' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void AdministrativeRoleIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to initialize correctly", dod.getRandomAdministrativeRole());
        java.lang.Long id = dod.getRandomAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.AdministrativeRole obj = net.sourceforge.anubis.domain.AdministrativeRole.findAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'AdministrativeRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAdministrativeRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'AdministrativeRole' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void AdministrativeRoleIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to initialize correctly", dod.getRandomAdministrativeRole());
        net.sourceforge.anubis.domain.AdministrativeRole obj = dod.getNewTransientAdministrativeRole(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'AdministrativeRole' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'AdministrativeRole' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void AdministrativeRoleIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to initialize correctly", dod.getRandomAdministrativeRole());
        java.lang.Long id = dod.getRandomAdministrativeRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'AdministrativeRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.AdministrativeRole obj = net.sourceforge.anubis.domain.AdministrativeRole.findAdministrativeRole(id);
        org.junit.Assert.assertNotNull("Find method for 'AdministrativeRole' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'AdministrativeRole' with identifier '" + id + "'", net.sourceforge.anubis.domain.AdministrativeRole.findAdministrativeRole(id));
    }
    
}
