package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.OperationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OperationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: OperationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: OperationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private OperationDataOnDemand OperationIntegrationTest.dod;
    
    @Test
    public void OperationIntegrationTest.testCountOperations() {
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to initialize correctly", dod.getRandomOperation());
        long count = net.sourceforge.anubis.domain.Operation.countOperations();
        org.junit.Assert.assertTrue("Counter for 'Operation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void OperationIntegrationTest.testFindOperation() {
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to initialize correctly", dod.getRandomOperation());
        java.lang.Long id = dod.getRandomOperation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Operation obj = net.sourceforge.anubis.domain.Operation.findOperation(id);
        org.junit.Assert.assertNotNull("Find method for 'Operation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Operation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void OperationIntegrationTest.testFindAllOperations() {
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to initialize correctly", dod.getRandomOperation());
        long count = net.sourceforge.anubis.domain.Operation.countOperations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Operation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.Operation> result = net.sourceforge.anubis.domain.Operation.findAllOperations();
        org.junit.Assert.assertNotNull("Find all method for 'Operation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Operation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void OperationIntegrationTest.testFindOperationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to initialize correctly", dod.getRandomOperation());
        long count = net.sourceforge.anubis.domain.Operation.countOperations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.Operation> result = net.sourceforge.anubis.domain.Operation.findOperationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Operation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Operation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void OperationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to initialize correctly", dod.getRandomOperation());
        java.lang.Long id = dod.getRandomOperation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Operation obj = net.sourceforge.anubis.domain.Operation.findOperation(id);
        org.junit.Assert.assertNotNull("Find method for 'Operation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyOperation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Operation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void OperationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to initialize correctly", dod.getRandomOperation());
        java.lang.Long id = dod.getRandomOperation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Operation obj = net.sourceforge.anubis.domain.Operation.findOperation(id);
        org.junit.Assert.assertNotNull("Find method for 'Operation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyOperation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Operation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void OperationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to initialize correctly", dod.getRandomOperation());
        net.sourceforge.anubis.domain.Operation obj = dod.getNewTransientOperation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Operation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Operation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void OperationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to initialize correctly", dod.getRandomOperation());
        java.lang.Long id = dod.getRandomOperation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'Operation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.Operation obj = net.sourceforge.anubis.domain.Operation.findOperation(id);
        org.junit.Assert.assertNotNull("Find method for 'Operation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Operation' with identifier '" + id + "'", net.sourceforge.anubis.domain.Operation.findOperation(id));
    }
    
}
