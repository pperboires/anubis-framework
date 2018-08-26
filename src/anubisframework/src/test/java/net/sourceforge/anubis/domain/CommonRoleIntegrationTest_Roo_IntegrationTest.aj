package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CommonRoleDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CommonRoleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CommonRoleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CommonRoleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CommonRoleDataOnDemand CommonRoleIntegrationTest.dod;
    
    @Test
    public void CommonRoleIntegrationTest.testCountCommonRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to initialize correctly", dod.getRandomCommonRole());
        long count = net.sourceforge.anubis.domain.CommonRole.countCommonRoles();
        org.junit.Assert.assertTrue("Counter for 'CommonRole' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CommonRoleIntegrationTest.testFindCommonRole() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to initialize correctly", dod.getRandomCommonRole());
        java.lang.Long id = dod.getRandomCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CommonRole obj = net.sourceforge.anubis.domain.CommonRole.findCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'CommonRole' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CommonRole' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void CommonRoleIntegrationTest.testFindAllCommonRoles() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to initialize correctly", dod.getRandomCommonRole());
        long count = net.sourceforge.anubis.domain.CommonRole.countCommonRoles();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CommonRole', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.CommonRole> result = net.sourceforge.anubis.domain.CommonRole.findAllCommonRoles();
        org.junit.Assert.assertNotNull("Find all method for 'CommonRole' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CommonRole' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CommonRoleIntegrationTest.testFindCommonRoleEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to initialize correctly", dod.getRandomCommonRole());
        long count = net.sourceforge.anubis.domain.CommonRole.countCommonRoles();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.CommonRole> result = net.sourceforge.anubis.domain.CommonRole.findCommonRoleEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'CommonRole' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CommonRole' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CommonRoleIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to initialize correctly", dod.getRandomCommonRole());
        java.lang.Long id = dod.getRandomCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CommonRole obj = net.sourceforge.anubis.domain.CommonRole.findCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'CommonRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCommonRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CommonRole' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CommonRoleIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to initialize correctly", dod.getRandomCommonRole());
        java.lang.Long id = dod.getRandomCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CommonRole obj = net.sourceforge.anubis.domain.CommonRole.findCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'CommonRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCommonRole(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CommonRole' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CommonRoleIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to initialize correctly", dod.getRandomCommonRole());
        net.sourceforge.anubis.domain.CommonRole obj = dod.getNewTransientCommonRole(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CommonRole' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CommonRole' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void CommonRoleIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to initialize correctly", dod.getRandomCommonRole());
        java.lang.Long id = dod.getRandomCommonRole().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CommonRole' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CommonRole obj = net.sourceforge.anubis.domain.CommonRole.findCommonRole(id);
        org.junit.Assert.assertNotNull("Find method for 'CommonRole' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'CommonRole' with identifier '" + id + "'", net.sourceforge.anubis.domain.CommonRole.findCommonRole(id));
    }
    
}
